import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_generator/src/dimmutable/vistors.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import "./class_generator_helper.dart";

Future<String> generateDImmutableFromFunction(
    {required FunctionElement element, required BuildStep buildStep}) async {
  if (!element.name.startsWith("\$_")) {
    throw NotAllowedError(
        "dimmutable function name should start with \$_ , but you specified ${element.name}");
  }
  final dim = element.getDImmutableAnnotation();
  final className = element.name.substring(2);
  final isJsonSerializable = dim.isJsonSerializable;
  final tuple = AstUtils.getTypeParamsAndBounds(element.typeParameters);
  final typeParamsWithBounds = tuple.item2;
  final typeParams = tuple.item1;
  element.parameters.forEach((element) {
    print(element);
    print(element.defaultValueCode);
  });

  final visitor = DImmutableFunctionVisitor();
  final ast = await AstUtils.getAstNodeFromElement(element, buildStep);
  ast.childEntities.forEach((element) {
    print(
        "function element entity ${element} runtime type ${element.runtimeType}");
  });
  ast.visitChildren(visitor);
  print("visitor fields ${visitor.fields}");

  final fields = ModelUtils.processFields(visitor.fields);
  print("dimmutable function fields $fields");

  final interfaces = <String>[];
  if (dim.toMap || dim.copyWithMap) {
    interfaces.add("ToMap<$className>");
  }
  final i = interfaces.isNotEmpty ? "implements ${interfaces.join(", ")}" : "";
  final ext = "$i";
  return """
    ${ModelUtils.createDefaultDartModelFromFeilds(fields: fields, extendClass: ext, className: className, typeParams: typeParams, typeParamsWithBounds: typeParamsWithBounds, isJsonSerializable: isJsonSerializable, toMap: dim.toMap, copyWithMap: dim.copyWithMap, collectionEquality: dim.collectionEquality)}
    
  """;
}
