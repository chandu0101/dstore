import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/form/generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class FormModelGenerator extends GeneratorForAnnotation<FormModel> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw UnsupportedError("FormModel should only used on classes");
      }
      if (!element.name.startsWith("\$_")) {
        throw UnsupportedError(
            "All FormModel class names should start with \$_");
      }
      final result = await generateFormModel(element, buildStep);
      return result;
    } catch (e, st) {
      logger.error(
          "Error while generating FormModel for ${element.name}", e, st);
      rethrow;
    }
  }
}
