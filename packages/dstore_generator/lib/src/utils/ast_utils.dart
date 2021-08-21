import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/constants/revive.dart';
import 'package:tuple/tuple.dart';
import './utils.dart';
import "package:collection/collection.dart";

abstract class AstUtils {
  static Future<AstNode> getAstNodeFromElement(
      Element element, BuildStep buildStep,
      {bool resolve = false}) async {
    var library = element.library!;
    while (true) {
      try {
        final session = library.session;
        AstNode node;
        if (resolve) {
          final le = await session.getResolvedLibraryByElement2(library)
              as ResolvedLibraryResult;

          node = le.getElementDeclaration(element)!.node;
        } else {
          final pr = session.getParsedLibraryByElement2(library)
              as ParsedLibraryResult;
          node = pr.getElementDeclaration(element)!.node;
        }
        return node;
      } on InconsistentAnalysisException {
        library = await buildStep.resolver.libraryFor(
          await buildStep.resolver.assetIdForElement(element.library!),
        );
      }
    }
  }

  static Tuple2<String, String> getTypeParamsAndBounds(
      List<TypeParameterElement> typeParameters) {
    final typeParamsWithBounds =
        typeParameters.map((e) => e.toString()).join(",");
    final typeParams = typeParameters.map((e) => e.name).join(",");
    return Tuple2(typeParams, typeParamsWithBounds);
  }

  static String addConstToDefaultValue(String value) {
    return !value.trimLeft().startsWith("const") &&
            (value.contains("(") || value.contains("[") || value.contains("{"))
        ? "const $value"
        : value;
  }

  static List<Field> convertParamsToFields(FormalParameterList? parameters,
      {bool isDImmutable = false}) {
    if (parameters == null) {
      return [];
    }
    return parameters.parameters.map((param) {
      final name = param.identifier.toString();
      var isOptional = param.isOptional;
      late String type;
      String? value;
      if (param is SimpleFormalParameter) {
        print("simpleformal");
        type = param.type?.toString() ?? "dynamic";
      }
      final annotations = param.metadata.map((e) => e.toString()).toList();
      if (param is DefaultFormalParameter) {
        print("defaultformal");
        value = param.defaultValue?.toString();
        final t = (param.parameter as SimpleFormalParameter).type;
        type = t?.toString() ?? "dynamic";
      }
      return Field(
          name: name,
          type: type,
          value: value,
          annotations: annotations,
          isOptional: isOptional,
          param: param);
    }).toList();
  }

  static List<Field> convertParamElementsToFields(List<ParameterElement> params,
      {bool dim = false}) {
    return params.map((param) {
      final name = param.name;
      final type = param.type.getDisplayString(withNullability: true);
      var defaultValue = param.defaultValueCode;

      var annotations = param.metadata.map((e) => e.toSource()).toList();
      var isOptional = param.isOptional;
      if (dim) {
        if (param.isOptional && !type.endsWith("?")) {
          defaultValue = param.defaultValueFromAnnotation;
          if (defaultValue == null) {
            throw ArgumentError.value(
                "Should provide Default for field ${name} using @Default annotation in DImmutable models");
          }
          isOptional = false;
          if (param.hasJsonKey) {
            final jsonKeyAnnot = param.annotationFromType(JsonKey);
            if (!jsonKeyAnnot!.toSource().contains("defaultValue")) {
              // jsonKey doesnt have defaultValue but Default is specified as Default annotation so lets merge
              annotations = param.mergeJsonKeyAndReturnAnnotations(
                  <String, dynamic>{"defaultValue": defaultValue});
              logger.shout(
                  "Default value $defaultValue annotationation $annotations");
            }
          } else {
            annotations.add("@JsonKey(defaultValue : $defaultValue)");
          }
        }
      }
      return Field(
        name: name,
        type: type,
        annotations: annotations,
        value: defaultValue,
        isOptional: isOptional,
      );
    }).toList();
  }

  static InterfaceType? isSubTypeof(DartType sourceType, String superType) {
    InterfaceType? result;
    if (sourceType is InterfaceType) {
      for (final t in sourceType.allSupertypes) {
        var name = t.getDisplayString(withNullability: false);
        if (name.contains("<")) {
          name = name.substring(0, name.indexOf("<"));
        }
        if (name == superType) {
          result = t;
          break;
        }
      }
    }
    return result;
  }
}

abstract class AnnotationUtils {
  static bool hasJsonKey(Element element) =>
      TypeChecker.fromRuntime(JsonKey).hasAnnotationOf(element);

  static String? defaultValue(Element element) {
    final annot = element.annotationFromType(Default);
    if (annot == null) {
      return null;
    }
    final s = annot.toSource().trim();
    final v = s.substring(s.indexOf("(") + 1, s.length - 1);
    return AstUtils.addConstToDefaultValue(v);
  }

  static List<String> mergeJsonKeyAndReturnAnnotations(
      Element element, Map<String, dynamic> newFields) {
    final tc = TypeChecker.fromRuntime(JsonKey);
    return element.metadata.map((e) {
      final type = e.type;
      if (type != null && tc.isAssignableFromType(type)) {
        final o = e.computeConstantValue();
        final key = getJsonKeyFromDartObject(o!);
        return key.copyWithMap(newFields).toSource();
      }
      return e.toSource();
    }).toList();
  }

  static JsonKey getJsonKeyFromDartObject(DartObject o) {
    final reader = ConstantReader(o);
    dynamic defaultValue;
    final defaultValueField = reader.peek("defaultValue");
    if (defaultValueField != null) {
      defaultValue = defaultValueField.literalValue;
    }

    bool? disallowNullValue;
    final disallowNullValueField = reader.peek("disallowNullValue");
    if (disallowNullValueField != null) {
      disallowNullValue = disallowNullValueField.boolValue;
    }

    Function? fromJson;
    final fromJsonField = reader.peek("fromJson");
    if (fromJsonField != null) {
      fromJson = fromJsonField.literalValue as Function;
    }

    bool? ignore;
    final ignoreField = reader.peek("ignore");
    if (ignoreField != null) {
      ignore = ignoreField.boolValue;
    }

    bool? includeIfNull;
    final includeIfNullField = reader.peek("includeIfNull");
    if (includeIfNullField != null) {
      includeIfNull = includeIfNullField.boolValue;
    }

    String? name;
    final nameField = reader.peek("name");
    if (nameField != null) {
      name = nameField.stringValue;
    }

    bool? required;
    final requiredField = reader.peek("required");
    if (requiredField != null) {
      required = requiredField.boolValue;
    }

    Function? toJson;
    final toJsonField = reader.peek("toJson");
    if (toJsonField != null) {
      toJson = toJsonField.literalValue as Function;
    }

    dynamic unknownEnumValue;
    final unknownEnumValueField = reader.peek("unknownEnumValue");
    if (unknownEnumValueField != null) {
      unknownEnumValue = unknownEnumValueField.literalValue;
    }

    return JsonKey(
        defaultValue: defaultValue,
        disallowNullValue: disallowNullValue,
        fromJson: fromJson,
        ignore: ignore,
        includeIfNull: includeIfNull,
        name: name,
        required: required,
        toJson: toJson,
        unknownEnumValue: unknownEnumValue);
  }
}

extension ElementExt on Element {
  ElementAnnotation? annotationFromType(Type type) {
    final tc = TypeChecker.fromRuntime(type);
    return metadata.singleWhereOrNull((e) {
      final v = e.computeConstantValue();
      return v != null && v.type != null && tc.isAssignableFromType(v.type!);
    });
  }
}

extension TypelAliasElementExt on TypeAliasElement {
  ElementAnnotation? annotationFromType(Type type) {
    final tc = TypeChecker.fromRuntime(type);
    return metadata.singleWhereOrNull((e) {
      final v = e.computeConstantValue();
      return v != null && v.type != null && tc.isAssignableFromType(v.type!);
    });
  }
}

extension VariableDeclarationExt on VariableDeclaration {
  Annotation? annotationFromType(Type type) {
    final tc = TypeChecker.fromRuntime(type);
    return this.metadata.singleWhereOrNull((e) {
      final v = e.elementAnnotation?.computeConstantValue();
      return v != null && v.type != null && tc.isAssignableFromType(v.type!);
    });
  }
}

extension ElementAnnotationExt on ElementAnnotation {
  DartType? get type {
    final v = computeConstantValue();
    return v?.type;
  }
}

extension JsonKeyExt on JsonKey {
  JsonKey copyWithMap(Map<String, dynamic> map) {
    return JsonKey(
        defaultValue: map.containsKey("defaultValue")
            ? map["defaultValue"]
            : defaultValue,
        disallowNullValue: map.containsKey("disallowNullValue")
            ? map["disallowNullValue"] as bool?
            : disallowNullValue,
        fromJson: map.containsKey("fromJson")
            ? map["fromJson"] as Function?
            : fromJson,
        ignore: map.containsKey("ignore") ? map["ignore"] as bool? : ignore,
        includeIfNull: map.containsKey("includeIfNull")
            ? map["includeIfNull"] as bool?
            : includeIfNull,
        name: map.containsKey("name") ? map["name"] as String? : name,
        required:
            map.containsKey("required") ? map["required"] as bool? : required,
        toJson: map.containsKey("toJson") ? map["toJson"] as Function? : toJson,
        unknownEnumValue: map.containsKey("unknownEnumValue")
            ? map["unknownEnumValue"]
            : unknownEnumValue);
  }

  String toSource() =>
      "@JsonKey(defaultValue : $defaultValue, disallowNullValue : $disallowNullValue, fromJson : $fromJson, ignore : $ignore, includeIfNull : $includeIfNull, name : $name, required : $required, toJson : $toJson, unknownEnumValue : $unknownEnumValue)";
}

extension ParameterElementExt on ParameterElement {
  bool get hasJsonKey => AnnotationUtils.hasJsonKey(this);
  String? get defaultValueFromAnnotation => AnnotationUtils.defaultValue(this);

  List<String> mergeJsonKeyAndReturnAnnotations(
          Map<String, dynamic> newFields) =>
      AnnotationUtils.mergeJsonKeyAndReturnAnnotations(this, newFields);
}

extension DartObjectExt on DartObject {
  String? functionNameForField(String name,
      {String? Function(ExecutableElement fn)? validateFn}) {
    final fn = getField(name)?.toFunctionValue();
    if (fn != null) {
      logger.shout("fn = ${fn} Rt ${fn.returnType}");
      if (validateFn != null) {
        final message = validateFn(fn);
        if (message != null) {
          throw InvalidSignatureError(message);
        }
      }
      final name = fn.name;
      final enclosingName = fn.enclosingElement.name;
      return enclosingName != null ? "${enclosingName}.$name" : name;
    }
  }

  Map<String, String>? getStringMapForField(String name) {
    final m = getField(name)?.toMapValue();
    return m?.map((key, value) =>
        MapEntry(key!.toStringValue()!, value!.toStringValue()!));
  }

  List<String>? getStringList(String name) {
    return getField(name)
        ?.toListValue()
        ?.map((e) => e.toStringValue()!)
        .toList();
  }

  T? getEnumField<T>(String name, List<T> values) {
    final field = getField(name);
    print("Enum Field $field ${field.runtimeType}");
    if (field != null && !field.isNull) {
      final v = reviveInstance(field).accessor;
      return values.singleWhereOrNull((element) => element.toString() == v);
    }
  }

  T? getEnumValue<T>(List<T> values) {
    final i = reviveInstance(this);
    if (i != null) {
      final v = i.accessor;
      return values.singleWhereOrNull((element) => element.toString() == v);
    }
  }

  String? get accesor {
    final i = reviveInstance(this);
    if (i != null) {
      return i.accessor;
    }
  }
}

extension ConstReadExt on ConstantReader {
  T? getEnumField<T>(String name, List<T> values) {
    return objectValue.getEnumField(name, values);
  }

  String? functionNameForField(String name,
      {String? Function(ExecutableElement fn)? validateFn}) {
    return objectValue.functionNameForField(name, validateFn: validateFn);
  }

  List<String>? getStringList(String name) {
    return objectValue.getStringList(name);
  }

  Map<String, String>? getStringMapForField(String name) {
    return objectValue.getStringMapForField(name);
  }
}

extension FieldElementExt on FieldElement {
  bool get hasJsonKey => AnnotationUtils.hasJsonKey(this);

  List<String> mergeJsonKeyAndReturnAnnotations(
          Map<String, dynamic> newFields) =>
      AnnotationUtils.mergeJsonKeyAndReturnAnnotations(this, newFields);
}

extension MethodElementExt on MethodElement {
  Tuple2<Url, Element?>? getUrlFromAnnotation() {
    final a = this.annotationFromType(Url);
    if (a != null) {
      final ao = ConstantReader(a.computeConstantValue());
      final url = ao.peek("path")?.stringValue;
      final isProtected = ao.peek("isProtected")?.boolValue ?? false;
      final nt = ao.peek("nestedType")?.objectValue.toTypeValue()?.element;
      return Tuple2(
        Url(url!, isProtected: isProtected),
        nt,
      );
    }
  }
}
