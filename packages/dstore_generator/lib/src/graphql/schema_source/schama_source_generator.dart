import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/graphql/schema_source/generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';

class SchemaSourceGenerator
    extends GeneratorForAnnotation<GraphqlSchemaSource> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw UnsupportedError(
            "You should use GraphqlSchema annotation on classes only ");
      }
      final result =
          await generateSchema(element: element, buildStep: buildStep);
      return result;
    } catch (e, st) {
      logger.error("Error genrating graphql schema for ${element.name}", e, st);
      rethrow;
    }
  }
}
