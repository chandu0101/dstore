import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dstore_generator/src/pstate/generator_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/utils/utils.dart';

class PStateGenerator extends GeneratorForAnnotation<PState> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw ArgumentError.value("PState should be applied on class only");
      }

      final className = element.name;
      if (!className.startsWith("\$_")) {
        throw ArgumentError.value(
            "PState class should start with \$_ , example : class \$_Auth");
      }
      return await generatePStateForClassElement(element, buildStep);
    } catch (e, st) {
      logger.error("Error in generate PState for ${element.name}", e, st);
      rethrow;
    }
  }
}
