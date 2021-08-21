import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_dgraph/dgraph.dart';
import 'package:dstore_generator/src/graphql/schema_source/dgraph/dgraph.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:tuple/tuple.dart';

const _LAMBDA_ARGS_SUFFIX = "\$dArgs";
final lambdaFields = <String>[];
Future<String> generateSchema(
    {required ClassElement element, required BuildStep buildStep}) async {
  final schemaMeta = _getGraphqlSchema(element);
  var objects = "";
  var jsObjects = "";
  var interfaces = "";
  var jsInterfaces = "";
  var enums = "";
  var jsEnums = "";
  var inputs = "";
  var jsInputs = "";
  var unions = "";
  var jsUnions = "";
  final comments = schemaMeta.comments;

  final enumF = element.fields
      .singleWhereOrNull((f) => f.name.toLowerCase() == "enums")
      ?.type
      .element;
  var enumNames = <String>[];
  if (enumF != null && enumF is ClassElement) {
    enumNames = enumF.interfaces
        .where((element) => !element.isDartCoreObject)
        .map((e) => e.getDisplayString(withNullability: false))
        .toList();
  }

  element.fields.forEach((fe) {
    logger.shout(
        "name ${fe.name} type ${fe.type} ${fe.type.runtimeType} type element  : ${fe.type.element} eleemnttype ${fe.type.element.runtimeType}");
    final name = fe.name.toLowerCase();
    if (name == "objects") {
      final tuple = getObjects(
          element: fe.type.element! as ClassElement,
          schema: schemaMeta,
          enumNames: enumNames);
      objects = tuple.item1;
      jsObjects = tuple.item2;
    }
    if (name == "interfaces") {
      final tuple = getInterfaces(
          element: fe.type.element! as ClassElement,
          schema: schemaMeta,
          enumNames: enumNames);
      interfaces = tuple.item1;
      jsObjects = tuple.item2;
    }
    if (name == "inputs") {
      final tuple = getInputs(
          element: fe.type.element! as ClassElement,
          schema: schemaMeta,
          enumNames: enumNames);
      inputs = tuple.item1;
      jsInputs = tuple.item2;
    }

    if (name == "unions") {
      final tuple = getUnions(
          element: fe.type.element! as ClassElement, schema: schemaMeta);
      unions = tuple.item1;
      jsUnions = tuple.item2;
    }

    if (name == "enums") {
      final tuple = getEnums(
          element: fe.type.element! as ClassElement,
          schema: schemaMeta,
          enumNames: enumNames);
      enums = tuple.item1;
      jsEnums = tuple.item2;
    }
  });

  final schema = """
   
   $enums 

   $interfaces

   $objects
   
   $unions

   $inputs

   $comments
  
  """
      .trim();
  print("Schema $schema");

  _saveSchemaToFile(schemaMeta, schema);
  if (schemaMeta.uploadSchema) {
    await _uploadSchema(schemaMeta, schema);
  }
  var lambdas = "";
  if (lambdaFields.isNotEmpty) {
    lambdas = _createLambdasObject(element.name);
  }

  return """
   $lambdas

   $jsObjects

   $jsUnions

   $jsInputs

   $jsEnums 

   $jsInterfaces 
   
  """;
}

String _createLambdasObject(String name) {
  final params = lambdaFields.map((f) {
    final pType = f.split(".").first;
    final argsType = f.endsWith(_LAMBDA_ARGS_SUFFIX)
        ? "$pType${f.split(".")[1].replaceFirst(_LAMBDA_ARGS_SUFFIX, "").cpatialize}Args"
        : dynamic;
    return "required ResolverEntryFn<$pType,$argsType> ${f.replaceFirst('.', '_').replaceFirst(_LAMBDA_ARGS_SUFFIX, "")}";
  }).join(", ");
  final objectSetters = lambdaFields.map((f) {
    final n = f.replaceFirst(_LAMBDA_ARGS_SUFFIX, "");
    return "setProperty(obj,'$n',allowInterop(${n.replaceFirst('.', '_')}));";
  }).join("\n");
  return """
   dynamic ${name}LambdasSetup({$params}) {
     final obj = newObject();
     $objectSetters
     addGraphQLResolvers(obj);
   }
  """;
}

void _saveSchemaToFile(GraphqlSchemaSource meta, String schema) {
  final file = File(meta.path);
  file.createSync(recursive: true);
  file.writeAsStringSync(schema);
}

Future<void> _uploadSchema(GraphqlSchemaSource meta, String schema) async {
  final uploadDetails = meta.schemaUplodDetails;
  if (uploadDetails == null) {
    throw ArgumentError.value(
        "You should provide schemaUplodDetails while defining graphqlschema if you want to upload");
  }
  if (meta.database == GraphqlDatabase.dgraph) {
    await validateAndUploadDGraphSchema(meta: meta, schema: schema);
  }
}

Tuple2<String, String> getObjects(
    {required ClassElement element,
    required GraphqlSchemaSource schema,
    required List<String> enumNames}) {
  assetItHasInterfacess(element);
  return _getFinalTuple(element.interfaces
      .where((e) => !e.isDartCoreObject)
      .map((e) => convertDartInterfaceTypeToObject(
          it: e, database: schema.database, enumNames: enumNames)));
}

void assetItHasInterfacess(ClassElement element) {
  if (element.interfaces.isEmpty) {
    throw ArgumentError.value(
        "${element.name} should have interfaces , not mixins or extends");
  }
}

Tuple2<String, String> getUnions(
    {required ClassElement element, required GraphqlSchemaSource schema}) {
  assetItHasInterfacess(element);
  print("allSuperTypes of unions ${element.interfaces}");
  return _getFinalTuple(element.interfaces
      .where((e) => !e.isDartCoreObject)
      .map((e) =>
          convertDartInterfaceTypeToUnions(it: e, database: schema.database)));
}

Tuple2<String, String> getEnums(
    {required ClassElement element,
    required GraphqlSchemaSource schema,
    required List<String> enumNames}) {
  assetItHasInterfacess(element);
  assetItHasInterfacess(element);
  return _getFinalTuple(element.interfaces
      .where((e) => !e.isDartCoreObject)
      .map((e) =>
          convertDartInterfaceTypeToEnum(it: e, database: schema.database)));
}

Tuple2<String, String> getInterfaces(
    {required ClassElement element,
    required GraphqlSchemaSource schema,
    required List<String> enumNames}) {
  assetItHasInterfacess(element);
  return _getFinalTuple(
      element.interfaces.where((e) => !e.isDartCoreObject).map((e) {
    return convertDartInterfaceTypeToInterface(
        it: e, database: schema.database, enumNames: enumNames);
  }));
}

Tuple2<String, String> _getFinalTuple(Iterable<Tuple2<String, String>> tuples) {
  final schmas = <String>[];
  final jsTypes = <String>[];
  tuples.forEach((tuple2) {
    schmas.add(tuple2.item1);
    jsTypes.add(tuple2.item2);
  });
  return Tuple2(schmas.join("\n"), jsTypes.join("\n"));
}

Tuple2<String, String> getInputs(
    {required ClassElement element,
    required GraphqlSchemaSource schema,
    required List<String> enumNames}) {
  return _getFinalTuple(
      element.interfaces.where((e) => !e.isDartCoreObject).map((e) {
    return convertDartInterfaceTypeToInput(
        it: e, database: schema.database, enumNames: enumNames);
  }));
}

Tuple2<String, String> convertDartInterfaceTypeToObject(
    {required InterfaceType it,
    required GraphqlDatabase database,
    required List<String> enumNames}) {
  final element = it.element;
  final name = element.name;

  final interfaces = element.interfaces
      .where((e) => !e.isDartCoreObject)
      .map((e) => e.element.name)
      .join(", ");
  final impl = interfaces.isEmpty ? "" : "implements $interfaces";
  var interfacesFields = "";

  final directives =
      getAnnotationForObject(element: element, database: database);
  var fields = ModelUtils.convertFieldElementsToFields(element.fields);
  fields.addAll(ModelUtils.convertMethodElementsToFields(element.methods));
  fields = _replaceEnumNames(fields, enumNames);
  final s = """
     type $name $impl $directives {
    ${getFieldsFromClassElement(element: element, database: database)}
    $interfacesFields
   }
  """;
  print("Schema for object $s");
  final jsTypes = """
 ${ModelUtils.createDefaultDartJSModelFromFeilds(fields: fields, className: name)}
   ${_getArgs(element)}
  """;
  return Tuple2(s, jsTypes);
}

List<Field> _replaceEnumNames(List<Field> fields, List<String> enumNames) {
  return fields.map((f) {
    if (enumNames.contains(f.type)) {
      final op = f.type.endsWith("?") ? "?" : "";
      return f.copyWith(type: "String$op/* ${f.type} */");
    } else {
      return f;
    }
  }).toList();
}

Tuple2<String, String> convertDartInterfaceTypeToUnions(
    {required InterfaceType it, required GraphqlDatabase database}) {
  final element = it.element;
  final name = element.name;

  final objects = element.interfaces
      .where((e) => !e.isDartCoreObject)
      .map((e) => e.element.name)
      .join(" | ");
  print("union objects $objects");
  final unionGetters =
      element.interfaces.where((e) => !e.isDartCoreObject).map((e) {
    final name = e.getDisplayString(withNullability: false);
    final gname = "${name.substring(0, 1)}${name.substring(1)}";
    return "$name? get $gname => typename == '$name' ? this as $name : null; ";
  }).join("\n");

  final directives =
      getAnnotationForUnion(element: element, database: database);

  final s = """
   union $name = $objects $directives
  """;
  final jsTypes = """"
   @JS()
   @anonymous
   abstract class $name {
    
   }
   extension ${name}Ext on $name {
     String get typename => getProperty(this,"__typename");
     $unionGetters
   }
  """;
  return Tuple2(s, jsTypes);
}

Tuple2<String, String> convertDartInterfaceTypeToEnum(
    {required InterfaceType it, required GraphqlDatabase database}) {
  final element = it.element;
  final name = element.name;
  final members = element.fields.map((e) => e.name).join("\n");
  final jsMemebers = element.fields
      .map((e) => "static const ${e.name} = '${e.name}';")
      .join("\n");
  final directives = getAnnotationForEnum(element: element, database: database);
  final s = """
   enum $name $directives {
     $members
   }
  """;
  final jsType = """
   abstract class $name {
       $jsMemebers
   }
  """;
  return Tuple2(s, jsType);
}

Tuple2<String, String> convertDartInterfaceTypeToInput(
    {required InterfaceType it,
    required GraphqlDatabase database,
    required List<String> enumNames}) {
  final element = it.element;
  final name = element.name;
  final directives =
      getAnnotationForInput(element: element, database: database);
  var fields = ModelUtils.convertFieldElementsToFields(element.fields);
  fields = _replaceEnumNames(fields, enumNames);
  final s = """
   input $name $directives  {
    ${getFieldsFromClassElement(element: it.element, database: database)}
   }
  """;
  final jsType = """
   ${ModelUtils.createDefaultDartJSModelFromFeilds(fields: fields, className: name)}
  """;
  return Tuple2(s, jsType);
}

Tuple2<String, String> convertDartInterfaceTypeToInterface(
    {required InterfaceType it,
    required GraphqlDatabase database,
    required List<String> enumNames}) {
  final element = it.element;
  final name = element.name;

  var interfacesFields = "";
  final directives =
      getAnnotationForInterface(element: element, database: database);
  var fields = ModelUtils.convertFieldElementsToFields(element.fields);
  fields.addAll(ModelUtils.convertMethodElementsToFields(element.methods));
  fields = _replaceEnumNames(fields, enumNames);

  final s = """
   interface $name  $directives {
    ${getFieldsFromClassElement(element: it.element, database: database)}
    $interfacesFields
   }
  """;
  final jsTypes = """
  ${ModelUtils.createDefaultDartJSModelFromFeilds(fields: fields, className: name)}
   ${_getArgs(element)}
  """;
  return Tuple2(s, jsTypes);
}

String _getArgs(ClassElement element) {
  final className = element.name;
  return element.methods
      .where((m) => m.annotationFromType(lambda) != null)
      .map((m) {
    final an = "${className}_${m.name.cpatialize}Args";
    final fields = ModelUtils.convertParameterElementsToFields(m.parameters);
    return ModelUtils.createDefaultDartJSModelFromFeilds(
        fields: fields, className: an);
  }).join("\n");
}

String getFieldsFromClassElement(
    {required ClassElement element, required GraphqlDatabase database}) {
  final fields = element.fields.map((e) {
    final type = getGraphqlType(e.type);
    final name = e.name;
    final directives = getAnnotationsForField(fe: e, database: database);
    if (database == GraphqlDatabase.dgraph) {
      if (directives.contains("@lambda")) {
        lambdaFields.add("${element.name}_${name}");
      }
    }
    return "$name: $type $directives";
  }).toList();
  final fieldsWithArgs = element.methods.map((m) {
    if (m.parameters.isEmpty) {
      throw ArgumentError.value("Fields with args must have params");
    }
    final rt = m.returnType.toString();
    if (rt == "dynamic" || rt == "void") {
      throw ArgumentError.value(
          "You should provide return type for fields(methods) with args, $m");
    }
    final type = getGraphqlType(m.returnType);
    final name = m.name;
    final directives = getAnnotationsForField(fe: m, database: database);
    if (database == GraphqlDatabase.dgraph) {
      if (directives.contains("@lambda")) {
        lambdaFields.add("${element.name}_${name}$_LAMBDA_ARGS_SUFFIX");
      }
    }
    final args = m.parameters.map((e) {
      final name = e.name;
      final type = getGraphqlType(e.type);
      return "$name: $type";
    });
    return "$name(${args.join(", ")}): $type $directives";
  });
  fields.addAll(fieldsWithArgs);
  return fields.join("\n");
}

String getAnnotationsForField(
    {required Element fe, required GraphqlDatabase database}) {
  if (database == GraphqlDatabase.dgraph) {
    return getDGraphFieldAnnotations(element: fe);
  }
  return "";
}

String getAnnotationForObject(
    {required ClassElement element, required GraphqlDatabase database}) {
  if (database == GraphqlDatabase.dgraph) {
    return getDGraphObjectAnnotations(element: element);
  }
  return "";
}

String getAnnotationForInterface(
    {required ClassElement element, required GraphqlDatabase database}) {
  if (database == GraphqlDatabase.dgraph) {
    return getDGraphInterfaceAnnotations(element: element);
  }
  return "";
}

String getAnnotationForUnion(
    {required ClassElement element, required GraphqlDatabase database}) {
  if (database == GraphqlDatabase.dgraph) {
    return getDGraphUnionAnnotations(element: element);
  }
  return "";
}

String getAnnotationForInput(
    {required ClassElement element, required GraphqlDatabase database}) {
  if (database == GraphqlDatabase.dgraph) {
    return getDGraphInputAnnotations(element: element);
  }
  return "";
}

String getAnnotationForEnum(
    {required ClassElement element, required GraphqlDatabase database}) {
  if (database == GraphqlDatabase.dgraph) {
    return getDGraphEnumAnnotations(element: element);
  }
  return "";
}

String getGraphqlType(DartType type) {
  final req =
      type.getDisplayString(withNullability: true).endsWith("?") ? "" : "!";
  if (type.isDartCoreList) {
    return "[${getGraphqlType((type as InterfaceType).typeArguments.first)}]$req";
  } else if (type.isDartCoreInt) {
    return "Int$req";
  } else if (type.isDartCoreBool) {
    return "Boolean$req";
  } else if (type.isDartCoreDouble) {
    return "Float$req";
  } else if (type.isDartCoreNum) {
    return "Float$req";
  } else {
    return "${type.getDisplayString(withNullability: false)}$req";
  }
}

GraphqlSchemaSource _getGraphqlSchema(ClassElement element) {
  final annot = element.annotationFromType(GraphqlSchemaSource)!;
  final reader = ConstantReader(annot.computeConstantValue());
  final path = reader.peek("path")!.stringValue;
  final lambdaSourceFile = reader.peek("lambdaSourceFile")?.stringValue;
  print("database ${reader.peek("database")}");
  final database = reader.getEnumField("database", GraphqlDatabase.values)!;
  final uploadSchema = reader.peek("uploadSchema")?.boolValue ?? false;
  final uploadLambda = reader.peek("uploadLambda")?.boolValue ?? false;
  final comments = reader.peek("comments")?.stringValue ?? "";
  final schemaUplodDetailsObj = reader.peek("schemaUplodDetails");
  SchemaUploadRequest? schemaUplodDetails;
  if (schemaUplodDetailsObj != null) {
    final url = schemaUplodDetailsObj.peek("url")?.stringValue;
    final headers = schemaUplodDetailsObj.getStringMapForField("headers");
    schemaUplodDetails = SchemaUploadRequest(url: url!, headers: headers);
  }
  return GraphqlSchemaSource(
      path: path,
      database: database,
      uploadSchema: uploadSchema,
      uploadLambda: uploadLambda,
      lambdaSourceFile: lambdaSourceFile,
      schemaUplodDetails: schemaUplodDetails,
      comments: comments);
}
