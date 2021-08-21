import 'dart:convert';

import 'package:analyzer/dart/constant/value.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dio/dio.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/graphql/globals.dart';
import 'package:dstore_generator/src/graphql/ops/typegen.dart';
import 'package:dstore_generator/src/graphql/schema/introspection.dart';

import 'package:dstore_generator/src/utils/utils.dart';
import 'package:gql/language.dart' as glang;
import 'package:gql/schema.dart' as gschema;
import 'package:source_gen/source_gen.dart';
import "dart:io";

class GraphqlSchemaGenerator extends GeneratorForAnnotation<GraphqlApi> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw Exception(
            "Graphql Api annotation should only be applied on classes");
      }

      final gApi = getGraphqlApi(
          element.annotationFromType(GraphqlApi)!.computeConstantValue());
      print("generating for API $gApi");
      final schema = await getGraphqlSchemaFromApiUrl(gApi);
      final enums = schema.enums.map((e) => _convertGEnumToDEnum(e)).join("\n");
      final inputs = schema.inputObjectTypes
          .map((e) => _convertGInputTypeToDType(e, gApi.scalarMap))
          .join("\n");
      final dslTypes = getDslTypes(schema, gApi.scalarMap);
      return """
      
      $enums 

      $inputs

      $dslTypes
    
    """;
    } catch (e, st) {
      logger.error(
          "Error in generate GraphqlSchema  for ${element.name}", e, st);
      rethrow;
    }
  }
}

String _convertObjectTypeToDSl(gschema.ObjectTypeDefinition? ot,
    {String? newName, Map<String, String>? scalarMap}) {
  if (ot == null) {
    return "";
  }
  final name = newName ?? ot.name;
  final ctor = newName != null ? "$name([String? args]);" : "";
  final memebers = ot.fields.map((f) {
    return _convertFieldDefinitionToDSL(f, scalarMap);
  }).join("\n ");

  return """
    class $name {
      $ctor
      $memebers
      $_typeNameDSL
    }
  """;
}

String _convertFieldDefinitionToDSL(
    gschema.FieldDefinition f, Map<String, String>? scalaraMap) {
  if (f.type == null) {
    return "";
  }
  final fn = f.name;
  final fType = f.type!;
  final ft = getFieldMetadataFromFieldTypeInstance(fType);
  final type = fType.baseTypeName;
  final isScalar = ft.fieldType is gschema.ScalarTypeDefinition;
  final args = f.args?.map((a) {
        var an = a.name;
        if (an == fn) {
          an = "${an}_rename"; //TODO make yousure you removed suffix in vistors
        }
        final type = _getInputTypeFromGraphqlType(a.type!, scalaraMap);
        final req = type.endsWith("?") ? "" : "required ";
        return "$req $type $an";
      }).toList() ??
      [];
  args.add("String? alias");
  args.add("String? directive");
  var reqArgs = "";
  if (!isScalar) {
    reqArgs = "$type $fn,";
  }
  return "void $fn($reqArgs{${args.join(", ")}}) { }";
}

String _convertInterfaceTypeToDSL(gschema.InterfaceTypeDefinition? itd,
    gschema.GraphQLSchema schema, Map<String, String>? scalarMap) {
  if (itd == null) {
    return "";
  }
  final name = itd.name;
  final memebers = itd.fields.map((f) {
    return _convertFieldDefinitionToDSL(f, scalarMap);
  }).join("\n ");
  final concreteTypes = schema.objectTypes
      .where((ot) => itd.isImplementedBy(ot))
      .map((e) => "void interfacefrag_${e.name}(${e.name} value) {}")
      .join("\n");
  return """

  class $name {
    $memebers
    $concreteTypes
  }
  
  """;
}

const _typeNameDSL = "void d__typename;";

String _convertUnionTypeToDSl(gschema.UnionTypeDefinition ut) {
  final name = ut.name;
  final members = ut.typeNames.map((e) {
    return "void unionfrag_${e.name}(${e.name} value) {}";
  }).join("\n");

  return """
   class $name {
     $members
   }
  
  """;
}

String getDslTypes(
    gschema.GraphQLSchema schema, Map<String, String>? scalarMap) {
  String? getNewNameForObjectType(gschema.ObjectTypeDefinition ot) {
    final name = ot.name;
    if (name == schema.query?.name) {
      return "Query";
    }
    if (name == schema.mutation?.name) {
      return "Mutation";
    }

    if (name == schema.subscription?.name) {
      return "Subscription";
    }
  }

  final types = <String>[];

  types.addAll(schema.objectTypes.map((e) => _convertObjectTypeToDSl(e,
      newName: getNewNameForObjectType(e), scalarMap: scalarMap)));
  types.addAll(schema.unions.map((e) => _convertUnionTypeToDSl(e)));
  types.addAll(schema.interaces
      .map((e) => _convertInterfaceTypeToDSL(e, schema, scalarMap)));
  return """
   ${types.join("\n")}
  
  """;
}

GraphqlApi getGraphqlApi(DartObject? obj) {
  final gApi = obj;
  if (gApi == null) {
    throw ArgumentError.value(
        "Error while computing @GraphqlApi annotation, make sure you used all constant values for api config");
  }
  final apiUrl = gApi.getField("apiUrl")!.toStringValue()!;
  final schemaPath = gApi.getField("schemaPath")?.toStringValue();
  final enablePersitantQueries =
      gApi.getEnumField("enablePersitantQueries", PersitantQueryMode.values);
  final cacheOnlineApiSchema =
      gApi.getField("cacheOnlineApiSchema")?.toStringValue();
  final wsUrl = gApi.getField("wsUrl")?.toStringValue();
  final collectionEquality =
      gApi.getEnumField("collectionEquality", CollectionEquality.values);
  final scalarMap = gApi.getField("scalarMap")?.toMapValue()?.map(
      (key, value) => MapEntry(key!.toStringValue()!, value!.toStringValue()!));
  logger.shout("Scalar Map $scalarMap");
  final headers = gApi.getStringMapForField("headers");
  return GraphqlApi(
      apiUrl: apiUrl,
      scalarMap: scalarMap,
      schemaPath: schemaPath,
      cacheOnlineApiSchema: cacheOnlineApiSchema,
      enablePersitantQueries: enablePersitantQueries,
      collectionEquality: collectionEquality,
      headers: headers,
      wsUrl: wsUrl);
}

String _convertGEnumToDEnum(gschema.EnumTypeDefinition genum) {
  final name = genum.name;
  final values = genum.values.map((v) => v.name).join(", ");
  final result = "enum $name { $values }";
  return result;
}

String _getInputTypeFromGraphqlType(
    gschema.GraphQLType gtype, Map<String, String>? scalarMap) {
  String getNamedType(gschema.NamedType gtype2) {
    final gschema.TypeDefinition td = gtype2.type!;
    var type = gtype.baseTypeName;
    if (td is gschema.ScalarTypeDefinition) {
      type = getScalarTypeFromString(type, scalarMap: scalarMap);
    }
    return type;
  }

  if (gtype.isNonNull) {
    if (gtype is gschema.NamedType) {
      return getNamedType(gtype);
    } else {
      return "List<${_getInputTypeFromGraphqlType((gtype as gschema.ListType).type, scalarMap)}>";
    }
  } else {
    if (gtype is gschema.NamedType) {
      return "${getNamedType(gtype)}?";
    } else {
      return "List<${_getInputTypeFromGraphqlType((gtype as gschema.ListType).type, scalarMap)}>?";
    }
  }
}

String _convertGInputTypeToDType(
    gschema.InputObjectTypeDefinition it, Map<String, String>? scalarMap) {
  final name = it.name;
  final fields = it.fields.map((gf) {
    final name = gf.name;
    final gtype = gf.type;
    var type = _getInputTypeFromGraphqlType(gtype!, scalarMap);
    return Field(
      name: name!,
      type: type,
      isOptional: !gtype.isNonNull,
    );
  }).toList();

  return ModelUtils.createDefaultDartModelFromFeilds(
      fields: ModelUtils.processFields(fields, addJsonKey: true),
      className: name!,
      isJsonSerializable: true);
}

Future<gschema.GraphQLSchema> getGraphqlSchemaFromApiUrl(
    GraphqlApi graphqlApi) async {
  late gschema.GraphQLSchema schema;
  final url = graphqlApi.apiUrl;
  final schemaPath = graphqlApi.schemaPath;
  final cacheOnlineApi = graphqlApi.cacheOnlineApiSchema;
  print("Trying to get schema from url $url");
  try {
    final dio = Dio();
    final resp = await dio.post<dynamic>(url,
        options: Options(headers: graphqlApi.headers),
        data: {"query": getIntrospectionQuery()});
    final respStr = jsonEncode(resp.data);
    if (cacheOnlineApi != null) {
      // cache api schema in local disk for offline usage
      final path = _getPathForCacheOffline(cacheOnlineApi);
      final file = File(path);
      file.createSync(recursive: true);
      file.writeAsStringSync(respStr);
    }

    schema = buildSchemaFromIntrospection(
        IntrospectionQuery.fromJson(resp.data["data"] as Map<String, dynamic>));
  } catch (e) {
    if (schemaPath != null) {
      print(
          "Error getting schema from apiUrl $e , Try to get schema from file $schemaPath");
      schema = await getSchemaFromPath(schemaPath);
    } else if (cacheOnlineApi != null) {
      final path = _getPathForCacheOffline(cacheOnlineApi);
      print(
          "Error getting schema from apiUrl $e , Try to get schema from cached file $path");

      try {
        final content = File(path).readAsStringSync();
        final dynamic cResp = jsonDecode(content);
        schema = buildSchemaFromIntrospection(
            IntrospectionQuery.fromJson(cResp["data"] as Map<String, dynamic>));
      } catch (e) {
        throw Exception("Error getting graphql schema from cached path $path");
      }
    } else {
      throw Exception(
          "Error while getting graphql schema from api url $url $e ");
    }
  }
  graphqlSchemaMap[url] = schema;
  return schema;
}

String _getPathForCacheOffline(String cacheOnlineApi) {
  var path = cacheOnlineApi;

  if (!path.endsWith(".json")) {
    path = "$path.json";
  }
  return path;
}

Future<gschema.GraphQLSchema> getSchemaFromPath(String schemaPath) async {
  try {
    final schemaStr = await File(schemaPath).readAsString();
    final schemaDoc = glang.parseString(schemaStr);
    return gschema.GraphQLSchema.fromNode(schemaDoc);
  } catch (e) {
    throw Exception("Error getting schema from file $schemaPath");
  }
}
