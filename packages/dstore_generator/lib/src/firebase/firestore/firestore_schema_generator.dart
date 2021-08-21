import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/firebase/firestore/generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class FireStoreSchemaGenerator extends GeneratorForAnnotation<FireStoreSchema> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw UnsupportedError(
            "FireStoreSchema should only be applied on class");
      }
      return await generateFireStoreSchema(
          element: element, buildStep: buildStep);
    } catch (e, st) {
      logger.error(
          "Error generating firestore schema for ${element.name} ", e, st);
      rethrow;
    }
  }
}
