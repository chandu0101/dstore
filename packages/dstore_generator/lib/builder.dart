// @dart=2.9
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/appstate/app_state_generator.dart';
import 'package:dstore_generator/src/denum/denum_generator.dart';
import 'package:dstore_generator/src/dunion/union_generator.dart';
import 'package:dstore_generator/src/env/env_generator.dart';
import 'package:dstore_generator/src/firebase/firestore/firestore_schema_generator.dart';
import 'package:dstore_generator/src/firebase/firestore/ops/firestore_ops_generator.dart';
import 'package:dstore_generator/src/form/form_model_generator.dart';
import 'package:dstore_generator/src/graphql/ops/graphql_ops_generator.dart';
import 'package:dstore_generator/src/graphql/schema/schema_genrator.dart';
import 'package:dstore_generator/src/dimmutable/immutable_generator.dart';
import 'package:dstore_generator/src/graphql/schema_source/schama_source_generator.dart';
import 'package:dstore_generator/src/open_api/open_api_generator.dart';
import 'package:dstore_generator/src/pstate/pstate_generator.dart';
import 'package:dstore_generator/src/selectors/selectors_generator.dart';
import 'package:dstore_generator/src/utils/builder_utils.dart';
import 'package:source_gen/source_gen.dart';

var lDebugMode = true;

class RGen extends GeneratorForAnnotation<RegularMethod> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return """
      typedef HelloT = HttpField<String>;
    """;
  }
}

/// Builds generators for `build_runner` to run
Builder dstorePSGen(BuilderOptions options) {
  print("dstorePSGen ************************* options ${options.config}");
  EnvGenerator.generate();
  PStateGeneratorBuildOptions.fromOptions(options.config);
  return PartBuilder(
    [PStateGenerator()],
    '.ps.dstore.dart',
  );
}

Builder dstoreApiGen(BuilderOptions options) {
  print(" dstoreApiGen ************************* options ${options.config}");
  EnvGenerator.generate();
  return PartBuilder(
    [GraphqlSchemaGenerator(), GraphqlOpsGenerator(), OpenApiGenerator()],
    '.api.dstore.dart',
  );
}

Builder dstoreGen(BuilderOptions options) {
  print("dstoreGen Options $options");
  EnvGenerator.generate();
  return PartBuilder(
      [
        FormModelGenerator(),
        UnionGenerator(),
        AppStateGenerator(),
        SelectorsGenerator(),
        SchemaSourceGenerator(),
        DEnumGenerator(),
        FireStoreSchemaGenerator(),
        FireStoreOpsGenerator(),
        DImmutableGenerator(),
        RGen(),
      ],
      '.dstore.dart',
      header: '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies
    ''');
}
