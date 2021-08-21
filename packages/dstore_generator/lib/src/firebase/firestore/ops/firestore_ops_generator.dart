import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/firebase/firestore/ops/generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

class FireStoreOpsGenerator extends GeneratorForAnnotation<FireStoreOps> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw UnsupportedError(
            "FireStoreSchema should only be applied on class");
      }
      if (!element.name.startsWith("\$_")) {
        throw UnsupportedError(
            "FireStore ops source class name should start with \$_ ");
      }
      return await generateFireStoreOps(element: element, buildStep: buildStep);
    } catch (e, st) {
      logger.error(
          "Error generating firestore ops for ${element.name} ", e, st);
      rethrow;
    }
  }
}
