import 'dart:io';

import 'package:dstore_generator/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

abstract class DBuilderOptions {
  static late PStateGeneratorBuildOptions psBuilderOptions;
}

enum PersistMode { ExplicitPersist, ExplicitDontPersist }

class PStateGeneratorBuildOptions {
  final PersistMode? persistMode;
  final List<String> nonConstClassesWithDefaultValues;
  final String appVersion;

  PStateGeneratorBuildOptions(
      {this.persistMode,
      required this.nonConstClassesWithDefaultValues,
      required this.appVersion});

  @override
  String toString() => "PStateGeneratorBuildOptions(persitMode: $persistMode)";

  static void fromOptions(Map<String, dynamic> config) {
    try {
      PersistMode? persistMode;
      final pms = config["persistMode"] as String?;
      print("pms $pms");
      if (pms != null) {
        if (pms != "ExplicitPersist" && pms != "ExplicitDontPersist") {
          throw ArgumentError.value(
              "You should provide persistMode one of two options ExplicitPersist or ExplicitNoPersist");
        }
        persistMode = convertStringToEnum(pms, PersistMode.values);
      }
      var nonConstClassesWithDefaultValues =
          (config["nonConstClassesWithDefaultValues"] as List<dynamic>?)
              ?.map((dynamic e) => e as String)
              .toList();
      if (nonConstClassesWithDefaultValues != null) {
        nonConstClassesWithDefaultValues
            .addAll(_defaultNonConstClassesWithDefaultValues);
      } else {
        nonConstClassesWithDefaultValues = [
          ..._defaultNonConstClassesWithDefaultValues
        ];
      }
      final appVersion = _getAppVersionnumber();
      final options = PStateGeneratorBuildOptions(
          persistMode: persistMode,
          appVersion: appVersion,
          nonConstClassesWithDefaultValues: nonConstClassesWithDefaultValues);
      logger.shout("PS Builder options $options");
      DBuilderOptions.psBuilderOptions = options;
    } catch (e, st) {
      logger.error("Error parsing dstore_generator:ps builder options", e, st);
      rethrow;
    }
  }
}

String _getAppVersionnumber() {
  final file = File("./pubspec.yaml");
  if (file.existsSync()) {
    final content = file.readAsStringSync();
    dynamic doc = loadYaml(content);
    final version = doc["version"] as String?;
    return version ?? "";
  }
  return "";
}

const _defaultNonConstClassesWithDefaultValues = [
  "DateTime",
  "FormField",
  "NavConfigMeta"
];
