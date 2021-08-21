import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_generator/src/dunion/generator_helper.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:dstore_annotation/dstore_annotation.dart';

class UnionGenerator extends GeneratorForAnnotation<DUnion> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      logger.shout("DUnion ${element.runtimeType}");
      if (!(element is FunctionElement)) {
        throw UnsupportedError(
            "DUnion should be used only on functions but you used on ${element.name} which is of type ${element.runtimeType}");
      }
      if (!element.name.startsWith("\$_")) {
        throw NotAllowedError(
            "DUnion function name should with \$_ but you specified ${element.name}");
      }
      if (element.parameters.length < 2) {
        throw NotAllowedError(
            "DUnion function ${element.name} should contain atleast two params");
      }
      return await generateUnion(element, buildStep);
    } catch (e, st) {
      logger.error(
          "Error generating unions type for function ${element.name}", e, st);
      rethrow;
    }
  }
}
