import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/appstate/generator_helper.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class AppStateGenerator extends GeneratorForAnnotation<AppStateAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    try {
      if (!(element is FunctionElement)) {
        throw NotAllowedError(
            "AppStateAnnotation can only be used on functions");
      }
      if (!element.name.startsWith("\$_")) {
        throw NotAllowedError(
            "AppState name should star with \$_ , but you speciefd ${element.name}");
      }

      return createAppState(element);
    } catch (e, st) {
      logger.error("Error generating AppState for ${element.name}", e, st);
      rethrow;
    }
  }
}
