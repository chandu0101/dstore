import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:dstore_annotation/dstore_annotation.dart';

class DEnumGenerator extends GeneratorForAnnotation<DEnum> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    try {
      // if (element is EnumElementImpl) {}
      if (!element.toString().trim().startsWith("enum")) {
        throw ArgumentError.value(
            "You should use @DEnum annotation only on enums");
      }
      final name = element.name;
      logger.shout("Enum ${element.runtimeType} ${element.name} ${element}");
      final fields = (element as dynamic).constants as List<FieldElement>;
      print(fields);
      fields.forEach((element) {
        print("Element ${element.name}");
      });
      return """
       extension ${name}Ext on ${name} {
          String get value => toString().split(".").last;
          static $name? fromValue(String value) {
            return ${name}.values
               .singleWhereOrNull((e) => e.toString().split(".")[1] == value);
          }
       }
    """;
    } catch (e, st) {
      logger.error("Error generating value for Enum ${element.name} ", e, st);
      rethrow;
    }
  }
}
