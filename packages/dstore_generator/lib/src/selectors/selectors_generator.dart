import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/selectors/generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class SelectorsGenerator extends GeneratorForAnnotation<Selectors> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw Exception("Selectors should be applied on class only");
      }
      final className = element.name;

      if (!className.startsWith("\$_")) {
        throw Exception("Selectors functions class should start with \$_");
      }
      final modelName = className.substring(2);
      return await generateSelectors(
          modelName: modelName, element: element, buildStep: buildStep);
    } catch (e, st) {
      logger.error("Failed generating selectors for ${element.name}", e, st);
      rethrow;
    }
  }
}
