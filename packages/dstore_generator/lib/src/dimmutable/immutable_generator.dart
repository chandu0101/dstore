import 'package:ansicolor/ansicolor.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/dimmutable/class_generator_helper.dart';
import 'package:dstore_generator/src/dimmutable/function_generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class DImmutableGenerator extends GeneratorForAnnotation<DImmutable> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      logger.shout("Genertating DImmutable for ${element.name}");
      ansiColorDisabled = false;
      if (!(element is ClassElement) && !(element is FunctionElement)) {
        throw UnsupportedError(
            "DImmutable should only be used on classes or function");
      }
      if (element.name?.startsWith("\$_") != true) {
        throw ArgumentError.value(
            "dimmutable function or class should start with \$_");
      }
      if (element is ClassElement) {
        return await generateDImmutableFromClass(
            element: element, buildStep: buildStep);
      } else {
        return await generateDImmutableFromFunction(
            element: element as FunctionElement, buildStep: buildStep);
      }
    } catch (e, st) {
      logger.error(
          "Error in generating immutable class for ${element.name}", e, st);
      rethrow;
    }
  }
}
