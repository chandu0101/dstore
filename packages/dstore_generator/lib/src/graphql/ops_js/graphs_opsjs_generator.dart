import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/graphql/globals.dart';
import 'package:dstore_generator/src/graphql/ops/gql_visitors.dart';
import 'package:dstore_generator/src/graphql/ops/typegen.dart';
import 'package:dstore_generator/src/graphql/ops/visitors.dart';
import 'package:dstore_generator/src/graphql/schema/schema_genrator.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:gql/ast.dart';
import 'package:gql/schema.dart';
import 'package:source_gen/source_gen.dart';

class GraphqlOpsJSGenerator extends GeneratorForAnnotation<GraphqlOpsJS> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw Exception(
            "GraphqlopsJs annotation should should only be applied on abstract classes");
      }

      final opsAnnotations = element.metadata.first.computeConstantValue();
      final apiA = opsAnnotations?.getField("api")!;
      final gAPi = getGraphqlApi(apiA);
      final apiUrl = gAPi.apiUrl;
      if (graphqlSchemaMap[apiUrl] == null) {
        await getGraphqlSchemaFromApiUrl(gAPi);
      }

      final visitor = DSLFieldsVisitor(
          className: element.name, element: element, api: gAPi, isJS: true);
      final ast = await AstUtils.getAstNodeFromElement(element, buildStep);
      ast.visitChildren(visitor);
      final ops = visitor.ops.join("\n");
      return """
     $ops
    """;
    } catch (e, st) {
      logger.error("Error in generate GraphqlOpsJS for ${element.name}", e, st);
      rethrow;
    }
  }
}

String getJSOp(
    {required GraphQLSchema schema,
    required String query,
    required DocumentNode doc,
    required GraphqlApi api,
    required String name}) {
  final visitor = OperationVisitor(documentNode: doc, schema: schema, api: api);
  doc.accept(visitor);
  final types = getJSTypes(visitor, name);
  return """   
   const $name = ${query.addTripleQuotes};
   $types
  """;
}

String getJSTypes(OperationVisitor visitor, String name) {
  final list = <GType>[];
  final fragmentMap = visitor.fragmentFieldsMap;

  final gt =
      getGType(visitor.fields, visitor.fragments, "${name}Data", fragmentMap);
  list.add(gt);
  list.addAll(getAllGTypes(gt.fields));
  print(gt);

  final response = list.map((e) => convertGTypeToDartJSType(e)).join("\n");
  final variables = visitor.variables.isEmpty
      ? ""
      : createVariableJSType(visitor.variables, "${name}Variables");
  return """
    $response
    $variables
  """;
}

String createVariableJSType(List<GField> gFields, String name) {
  final fields = gFields.map(converGFieldToField).toList();

  return ModelUtils.createDefaultDartJSModelFromFeilds(
      fields: fields, className: name);
}

String convertGTypeToDartJSType(GType gtype) {
  final name = gtype.name;
  if (gtype.unions.isNotEmpty || gtype.supertypes.isNotEmpty) {
    return _convertUnionOrInterfaceGTypeToDartJSType(gtype);
  }
  final fields = gtype.fields.map((f) {
    final annotations = <String>[];
    final jkFields = <String>[];
    if (f.jsonKey != null) {
      jkFields.add("name:\"${f.jsonKey}\"");
    }
    if (f.gType != null && f.gType!.unions.isNotEmpty) {
      // union field we need special getter
      final tn = f.gType!.name;
      jkFields.add("fromJson: $tn.fromJson");
      jkFields.add("toJson: ${tn}.toJson");
    }

    if (jkFields.isNotEmpty) {
      annotations.add("@JsonKey(${jkFields.join(",")})");
    }

    return Field(name: f.name, type: f.type, annotations: annotations);
  }).toList();
  return ModelUtils.createDefaultDartJSModelFromFeilds(
      fields: fields, className: name);
}

String _convertUnionOrInterfaceGTypeToDartJSType(GType gtype) {
  final name = gtype.name;
  final getters = <String>[];

  gtype.unions.forEach((e) {
    final un = e.name;
    final tn = un.substring(e.name.lastIndexOf("_") + 1);
    getters.add("$un? get ${tn} => typename == '$tn' ? this as $un : null;");
  });

  gtype.supertypes.forEach((e) {
    final un = e.name;
    final tn = un.substring(e.name.lastIndexOf("_") + 1);
    getters.add("$un? get ${tn} => typename == '$tn' ? this as $un : null;");
  });

  return """
   @JS()
   @anonymous
   abstract class $name{

   }

   extension ${name}Ext on $name {
     
     String get typename => getProperty(this,"__typename");

     ${getters.join("\n")}

   }
  
  """;
}
