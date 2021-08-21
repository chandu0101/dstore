import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/dimmutable/vistors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

Future<String> generateDImmutableFromClass(
    {required ClassElement element, required BuildStep buildStep}) async {
  final dim = element.getDImmutableAnnotation();
  final tuple = AstUtils.getTypeParamsAndBounds(element.typeParameters);
  final typeParamsWithBounds = tuple.item2;
  final typeParams = tuple.item1;
  logger.shout("typeParams : $typeParamsWithBounds fields ${element.fields}");
  final visitor = DImmutableClassVisitor();
  final ast = await AstUtils.getAstNodeFromElement(element, buildStep);
  ast.visitChildren(visitor);
  final fields = ModelUtils.processFields(visitor.fields);
  final methods = visitor.methods.join("\n");
  final name = element.name.substring(2);
  print("Params : $fields");
  final isJosnSerializable = dim.isJsonSerializable;
  final interfaces = <String>[];
  if (dim.toMap || dim.copyWithMap) {
    interfaces.add("ToMap<$name>");
  }
  final i = interfaces.isNotEmpty ? "implements ${interfaces.join(", ")}" : "";
  final ext = "$i";
  final result = """
      ${ModelUtils.createDefaultDartModelFromFeilds(fields: fields, extendClass: ext, methods: methods, className: name, typeParams: typeParams, typeParamsWithBounds: typeParamsWithBounds, isJsonSerializable: isJosnSerializable, collectionEquality: dim.collectionEquality, toMap: dim.toMap, copyWithMap: dim.copyWithMap)}
    """;
  return result;
}

extension DImmutableEllementExt on Element {
  DImmutable getDImmutableAnnotation() {
    final annot = this.annotationFromType(DImmutable);
    if (annot == null) {
      throw ArgumentError.value(
          "Element ${this.name} is not anotated with @DImmutable");
    }
    final reader = ConstantReader(annot.computeConstantValue());
    final isJsonSerializable = reader.read("isJsonSerializable").boolValue;
    final collectionEquality =
        reader.getEnumField("collectionEquality", CollectionEquality.values);
    final toMap = reader.peek("toMap")?.boolValue ?? false;
    final copyWithMap = reader.peek("copyWithMap")?.boolValue ?? false;
    return DImmutable(
        isJsonSerializable: isJsonSerializable,
        collectionEquality: collectionEquality,
        toMap: toMap,
        copyWithMap: copyWithMap);
  }
}
