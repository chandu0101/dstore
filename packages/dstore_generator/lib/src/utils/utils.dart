export "model_utils.dart";
export "ast_utils.dart";
export "logger.dart";
export "builder_utils.dart";
export "package:collection/collection.dart";
import 'package:analyzer/dart/ast/ast.dart';
import "package:collection/collection.dart";
import 'package:dstore_generator/src/constants.dart';

class Field {
  String name;
  String type;
  String? value;
  List<String> annotations;
  bool isOptional;
  FormalParameter? param;
  bool isNamed;
  bool nonConstValue;
  Field(
      {required this.name,
      required this.type,
      this.value,
      this.annotations = const [],
      this.isNamed = false,
      this.param,
      this.nonConstValue = false,
      this.isOptional = false});

  @override
  String toString() {
    return "Field(Name : ${name} Type : ${type} Value : ${value} isOptional : $isOptional annotations : $annotations isNamed: $isNamed)";
  }

  Field copyWith({
    String? name,
    String? type,
    String? value,
    List<String>? annotations,
    bool? isOptional,
    bool? isNamed,
    FormalParameter? param,
  }) {
    return Field(
        name: name ?? this.name,
        type: type ?? this.type,
        value: value ?? this.value,
        annotations: annotations ?? this.annotations,
        isOptional: isOptional ?? this.isOptional,
        param: param ?? this.param,
        isNamed: isNamed ?? this.isNamed);
  }
}

String replaceEndStar(String input) {
  var result = input;
  if (input.endsWith("*")) {
    result = input.substring(0, input.length - 1);
  }
  return result;
}

String getDNameForIdentifier(String name) {
  return DART_RESERVED_KEYWORDS.contains(name) ? "d\$_$name" : "$name";
}

String convertEnumToString(Object enumEntry) {
  final description = enumEntry.toString();
  final indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumEntry" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}

String? convertEnumOrNullToString(Object? enumEntry) {
  if (enumEntry == null) {
    return null;
  }
  final description = enumEntry.toString();
  final indexOfDot = description.indexOf('.');
  assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumEntry" is not an enum.',
  );
  return description.substring(indexOfDot + 1);
}

E? convertStringToEnum<E>(String s, List<E> values) {
  return values.firstWhereOrNull((v) => v.toString().split('.')[1] == s);
}

extension StringExt on String {
  String get cpatialize => "${substring(0, 1).toUpperCase()}${substring(1)}";
  String? replaceAndReturn(String match) {
    if (this.startsWith(match)) {
      return this.replaceFirst(match, "");
    }
  }

  String get addDName {
    final value = this;
    if (startsWith("_")) {
      return "d\$_$value";
    } else if (DART_RESERVED_KEYWORDS.contains(value)) {
      return "${value}_\$d";
    } else {
      return value;
    }
  }

  String get removeDName {
    final value = this;
    if (value.startsWith("d\$_")) {
      final v = value.substring(3);
      if (v.startsWith("_")) {
        return v;
      }
      return value;
    } else if (value.endsWith("_\$d")) {
      final v = value.substring(0, value.length - 3);
      if (DART_RESERVED_KEYWORDS.contains(v)) {
        return v;
      }
      return value;
    } else {
      return value;
    }
  }

  String get addTripleQuotes {
    return "\"\"\"$this\"\"\"";
  }

  String get addQuestionMarkAtEnd {
    final value = this;
    return value.endsWith("?") ? value : "$value?";
  }

  String get replaceQuotes {
    var value = this;
    if (value.startsWith("\"")) {
      value = value.substring(1);
    }
    if (value.endsWith("\"")) {
      value = value.substring(0, value.length - 1);
    }
    if (value.startsWith("'")) {
      value = value.substring(1);
    }
    if (value.endsWith("'")) {
      value = value.substring(0, value.length - 1);
    }
    return value;
  }
}

extension IterableMapIndex<T> on Iterable<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T t) f) {
    return Iterable.generate(
        this.length, (index) => f(index, elementAt(index)));
  }
}
