import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/graphql/ops/gql_visitors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:gql/ast.dart';
import 'package:gql/schema.dart';

enum GListType { strict, nonstrict }

class GField {
  final String name;
  final String? jsonKey;
  final bool optional;
  final List<GListType> listType;
  final String? type;
  final List<GField> fields;
  final List<GFragment> fragments;
  final String? defaultValue;
  final bool isUnion;
  final bool isInterface;

  GField(
      {required this.name,
      required this.optional,
      required this.listType,
      this.type,
      this.isUnion = false,
      this.isInterface = false,
      this.jsonKey,
      this.defaultValue,
      this.fragments = const [],
      this.fields = const []});

  @override
  String toString() {
    return 'GField(name: $name, jsonKey: $jsonKey, optional: $optional, listType: $listType, type: $type, fields: $fields, framents: $fragments, defaultValue: $defaultValue)';
  }
}

class Stack<T> {
  List<T> list = [];
  T Function()? initializer;

  Stack([this.initializer]);

  void stack([T? value]) {
    if (value == null && initializer != null) {
      list.add(initializer!());
    } else if (value != null) {
      list.add(value);
    }
  }

  T get current {
    if (list.isEmpty) {
      throw Exception("No Elements Stack Error");
    }
    return list[list.length - 1];
  }

  T consume() {
    final c = current;
    list.removeLast();
    return c;
  }

  bool get isEmpty {
    return list.isEmpty;
  }
}

class GFragment {
  final bool isUnionCondition;
  final String? typeNode;
  final List<GField> fields;
  final List<GFragment> fragments;
  final String? on;

  GFragment(
      {required this.isUnionCondition,
      this.typeNode,
      this.on,
      this.fields = const [],
      this.fragments = const []});

  @override
  String toString() {
    return 'GFragment(isUnionCondition: $isUnionCondition, typeNode: $typeNode, fields: $fields, fragments: $fragments)';
  }
}

class FieldTypeElement {
  final List<GField> fields = [];
  final List<GFragment> typeFragments = [];
}

class FieldMetadata {
  final TypeDefinition fieldType;
  final List<GListType> listType;
  final bool strict;

  FieldMetadata(
      {required this.fieldType, required this.listType, required this.strict});

  @override
  String toString() =>
      'FieldMetadata(fieldType: $fieldType, listType: $listType, strict: $strict)';
}

class TypeNodeMeta {
  final String fieldType;
  final List<GListType> listType;
  final bool strict;

  TypeNodeMeta(
      {required this.fieldType, required this.listType, required this.strict});

  @override
  String toString() =>
      'FieldMetadata(fieldType: $fieldType, listType: $listType, strict: $strict)';
}

class ToplevelFragment {
  final bool isUnion;
  final List<GField> fields;
  final List<GFragment> fragments;
  final String on;

  ToplevelFragment(this.fields, this.fragments, this.isUnion, this.on);

  @override
  String toString() =>
      'ToplevelFragment(isUnion: $isUnion, fields: $fields, fragments: $fragments on: $on)';
}

String getScalarTypeFromString(String input, {Map<String, String>? scalarMap}) {
  switch (input) {
    case "String":
    case "ID":
      return "String";
    case "Float":
      return "double";
    case "Boolean":
      return "bool";
    case "Int":
      return "int";
    default:
      return scalarMap?[input] ?? "dynamic";
  }
}

FieldMetadata getFieldMetadataFromFieldTypeInstance(GraphQLType type,
    {List<GListType> list = const []}) {
  print("ftinput ${type.runtimeType} ${type} ${type.baseTypeName} $list");
  final listm = List<GListType>.from(list);
  if (type is ListType) {
    if (type.isNonNull) {
      listm.add(GListType.strict);
    } else {
      listm.add(GListType.nonstrict);
    }
    type = type.type;
  }
  if (type is NamedType) {
    var strict = false;
    if (type.isNonNull) {
      strict = true;
    }
    var ftd = type.type as TypeDefinition?;
    ftd ??= ScalarTypeDefinition(
        ScalarTypeDefinitionNode(name: NameNode(value: type.baseTypeName)));
    return FieldMetadata(fieldType: ftd, listType: listm, strict: strict);
  } else {
    return getFieldMetadataFromFieldTypeInstance(type, list: listm);
  }
}

class FieldG {
  final String name;
  final String type;
  final String? jsonKey;
  final GType? gType;

  FieldG(
      {required this.name,
      required this.type,
      required this.jsonKey,
      this.gType});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FieldG && o.name == name && o.jsonKey == jsonKey;
  }

  @override
  int get hashCode => name.hashCode ^ jsonKey.hashCode;

  @override
  String toString() {
    return "Field(name: ${name}, type: ${type}, jsonKey: ${jsonKey} , gType: ${gType})";
  }
}

class GType {
  final Set<FieldG> fields;
  final String name;
  final bool isOptional;
  final List<GType> unions;
  final List<GType> supertypes;
  final Set<String> baseTypes;
  GType(
      {required this.fields,
      required this.name,
      this.unions = const [],
      this.supertypes = const [],
      this.isOptional = false,
      this.baseTypes = const {}});

  @override
  String toString() {
    return "GType(fields: ${fields}, name: ${name}, unions : ${unions} baseTypes : $baseTypes);";
  }
}

FieldG convertGraphqlFieldToField(
    GField gf, String prefix, Map<String, ToplevelFragment> fragmentFieldsMap) {
  if (gf.isUnion) {
    // union type
    final type = "${prefix}_${gf.name}";
    List<GFragment> frags;
    if (gf.fragments.length == 1 && gf.fragments.first.typeNode != null) {
      // toplevel union fragment spread
      final typeNode = gf.fragments.first.typeNode!;
      final tf = fragmentFieldsMap[typeNode]!;
      frags = tf.fragments;
    } else {
      frags = gf.fragments;
    }
    final fieldsG = gf.fields
        .map((gf) => convertGraphqlFieldToField(gf, prefix, fragmentFieldsMap));
    final unions = frags.map((f) {
      final fields = getFieldsFromFragment([f], fragmentFieldsMap, prefix);
      // fields.add(FieldG(
      //   name: "G__typeName",
      //   type: "String",
      //   jsonKey: "__typename",
      // ));
      String on;
      if (f.typeNode != null) {
        final tl = fragmentFieldsMap[f.typeNode]!;
        on = tl.on;
      } else {
        on = f.on!;
      }
      final name = "${type}_${on}";
      fields.addAll(fieldsG);
      return GType(
        fields: fields,
        name: name,
        baseTypes: {type},
      );
    }).toList();
    logger.shout("isOptional Union ${gf.optional} ${gf.name}");
    return FieldG(
        name: gf.name,
        jsonKey: gf.jsonKey,
        type: getDType(gf, type),
        gType: GType(
            name: type, fields: {}, unions: unions, isOptional: gf.optional));
  } else if (gf.isInterface) {
    final type = "${prefix}_${gf.name}";
    if (gf.fragments.isNotEmpty) {
      final fieldsG = gf.fields.map(
          (gf) => convertGraphqlFieldToField(gf, prefix, fragmentFieldsMap));
      final supertypes = gf.fragments.map((f) {
        final fields = getFieldsFromFragment([f], fragmentFieldsMap, prefix);
        // fields.add(FieldG(
        //   name: "G__typeName",
        //   type: "String",
        //   jsonKey: "__typename",
        // ));
        String on;
        if (f.typeNode != null) {
          final tl = fragmentFieldsMap[f.typeNode]!;
          on = tl.on;
        } else {
          on = f.on!;
        }
        fields.addAll(fieldsG);
        final name = "${type}_${on}";
        return GType(
          fields: fields,
          name: name,
          baseTypes: {type},
        );
      }).toList();
      return FieldG(
          name: gf.name,
          jsonKey: gf.jsonKey,
          type: getDType(gf, type),
          gType: GType(
              name: type,
              fields: {},
              supertypes: supertypes,
              isOptional: gf.optional));
    } else {
      final gt = getGType(gf.fields, gf.fragments, type, fragmentFieldsMap);

      return FieldG(
          name: gf.name,
          jsonKey: gf.jsonKey,
          type: getDType(gf, type),
          gType: gt);
    }
  } else if (gf.fields.isNotEmpty || gf.fragments.isNotEmpty) {
    // object
    final type = "${prefix}_${gf.name}";
    final gt = getGType(gf.fields, gf.fragments, type, fragmentFieldsMap);

    return FieldG(
        name: gf.name,
        jsonKey: gf.jsonKey,
        type: getDType(gf, type),
        gType: gt);
  } else {
    return FieldG(
        name: gf.name, jsonKey: gf.jsonKey, type: getDType(gf, gf.type!));
  }
}

GType getGType(List<GField> fields, List<GFragment> fragments, String prefix,
    Map<String, ToplevelFragment> fragmentFieldsMap) {
  final fFields = <FieldG>{};

  fFields.addAll(fields
      .map((gf) => convertGraphqlFieldToField(gf, prefix, fragmentFieldsMap)));
  fFields.addAll(getFieldsFromFragment(fragments, fragmentFieldsMap, prefix));

  return GType(fields: fFields, name: prefix);
}

Set<FieldG> getFieldsFromFragment(List<GFragment> fragments,
    Map<String, ToplevelFragment> fragmentFieldsMap, String prefix) {
  final fragFields = <FieldG>{};
  fragments.forEach((frag) {
    var fields = frag.fields;
    var frags = frag.fragments;
    if (frag.typeNode != null) {
      final tf = fragmentFieldsMap[frag.typeNode]!;
      fields = tf.fields;
      frags = tf.fragments;
    }
    fragFields.addAll(fields.map(
        (gf) => convertGraphqlFieldToField(gf, prefix, fragmentFieldsMap)));
    fragFields.addAll(getFieldsFromFragment(frags, fragmentFieldsMap, prefix));
  });
  return fragFields;
}

String getDType(GField gf, String type) {
  String getListType(List<GListType> list, String type) {
    final lt = list.first;
    final ltt = lt == GListType.nonstrict ? "List<$type>?" : "List<$type>";
    if (list.length == 1) {
      return ltt;
    } else {
      return getListType(list.sublist(1), ltt);
    }
  }

  final t = gf.optional ? "$type?" : type;
  if (gf.listType.isNotEmpty) {
    return getListType(gf.listType, t);
  } else {
    return t;
  }
}

final unionsListSerializers = <String>[];

String getTypes(OperationVisitor visitor, String name,
    CollectionEquality? collectionEquality) {
  print("getTypes called");
  final list = <GType>[];
  final fragmentMap = visitor.fragmentFieldsMap;

  final gt =
      getGType(visitor.fields, visitor.fragments, "${name}Data", fragmentMap);
  list.add(gt);
  list.addAll(getAllGTypes(gt.fields));
  print(gt);

  final response =
      list.map((e) => convertGTypeToDartType(e, collectionEquality)).join("\n");
  final variables = visitor.variables.isEmpty
      ? ""
      : createVariableType(visitor.variables, "${name}Variables");
  final unions = [...unionsListSerializers];
  unionsListSerializers.clear();
  return """
    $response
     ${unions.join("\n")}
    $variables
  """;
}

// LocalOps_usersData_users_helloa

Field converGFieldToField(GField field) {
  final name = field.name;
  final type = getDType(field, field.type!);
  return Field(name: name, type: type, isOptional: field.optional);
}

String createVariableType(List<GField> gFields, String name) {
  final fields = gFields.map(converGFieldToField).toList();

  return ModelUtils.createDefaultDartModelFromFeilds(
      fields: fields, className: name, isJsonSerializable: true);
}

List<GType> getAllGTypes(Set<FieldG> fields) {
  final result = <GType>[];
  fields.forEach((f) {
    if (f.gType != null) {
      final gType = f.gType!;
      result.add(gType);
      result.addAll(gType.unions);
      result.addAll(getAllGTypes(gType.fields));
    }
  });
  return result;
}

String convertGTypeToDartType(
    GType gtype, CollectionEquality? collectionEquality) {
  final name = gtype.name;
  if (gtype.unions.isNotEmpty || gtype.supertypes.isNotEmpty) {
    return _covertUnionOrInterfaceToDartModel(gtype);
  }
  if (gtype.fields.where((f) => f.name == "helloa").isNotEmpty) {
    print("gfields ${gtype.fields}");
  }
  final fields = gtype.fields.map((f) {
    final annotations = <String>[];
    final jkFields = <String>[];
    if (f.jsonKey != null) {
      jkFields.add("name:\"${f.jsonKey}\"");
    }
    if (f.gType != null && f.gType!.unions.isNotEmpty) {
      // union field we need special getter

      final tn = f.gType!.name;
      var fj = "$tn.fromJson";
      var tj = "$tn.toJson";

      if (f.type.startsWith("List")) {
        final toJsonName = "${tn}_${f.name}ListSerializer";
        final isAlreadyGenerated = unionsListSerializers
            .where((element) => element.contains(toJsonName))
            .isNotEmpty;
        print(
            "Got union list field ${f.type} isAlreadyGenerated $isAlreadyGenerated ");

        tj = toJsonName;
        final isOp = f.type.endsWith("?");
        final isUnionOp = f.gType!.isOptional;
        if (!isAlreadyGenerated) {
          final toJson = getListUnionToJson(
              name: tn,
              isUnionOp: isUnionOp,
              isOp: isOp,
              serializerName: toJsonName);
          unionsListSerializers.add(toJson);
        }

        final fromJsonName = "${tn}${f.name}ListDeserializer";
        fj = fromJsonName;
        if (!isAlreadyGenerated) {
          final fromJson = getListFromJson(
              name: tn,
              isUnionOp: isUnionOp,
              isOp: isOp,
              serializerName: fromJsonName);
          unionsListSerializers.add(fromJson);
        }
      }
      jkFields.add("fromJson: $fj");
      jkFields.add("toJson: $tj");
    }

    if (jkFields.isNotEmpty) {
      annotations.add("@JsonKey(${jkFields.join(",")})");
    }

    return Field(name: f.name, type: f.type, annotations: annotations);
  }).toList();
  return ModelUtils.createDefaultDartModelFromFeilds(
      fields: fields,
      className: name,
      isJsonSerializable: true,
      collectionEquality: collectionEquality);
}

String getListFromJson(
    {required String name,
    required bool isOp,
    required bool isUnionOp,
    required String serializerName}) {
  final op = isOp ? "?" : "";
  final uop = isUnionOp ? "?" : "";
  final nullCond = isOp
      ? """
    if(input == null) {
      return null;
    }
  """
      : "";
  return """
    
    List<$name$uop>$op $serializerName(Object$op input) {
      $nullCond
      return (input as List<dynamic>).map((dynamic e) => $name.fromJson(e as Map<String,dynamic>$uop)).toList();
    }
  
  """;
}

String getListUnionToJson(
    {required String name,
    required bool isOp,
    required bool isUnionOp,
    required String serializerName}) {
  final op = isOp ? "?" : "";
  final uop = isUnionOp ? "?" : "";
  final nullCond = isOp
      ? """
    if(input == null) {
      return null;
    }
  """
      : "";
  return """
    List<Map<String,dynamic>$uop>$op  $serializerName(List<$name$uop>$op input) {
        $nullCond
        return input.map((m) => $name.toJson(m)).toList();
    }
  """;
}

String _covertUnionOrInterfaceToDartModel(GType gtype) {
  final name = gtype.name;
  final ctors = <String>[];
  final getters = <String>[];
  final fromJson = <String>[];

  gtype.unions.forEach((e) {
    final un = e.name;
    final tn = un.substring(e.name.lastIndexOf("_") + 1);
    ctors.add("${name}.${tn}(${un} value):_value = value;");
    getters.add("$un? get ${tn} => _value is $un ? _value as $un : null;");
    fromJson.add("""if(json["__typename"] == \"$tn\") {
          return $name.$tn(${un}.fromJson(json));
        }""");
  });

  gtype.supertypes.forEach((e) {
    final un = e.name;
    final tn = un.substring(e.name.lastIndexOf("_") + 1);
    ctors.add("${name}.${tn}(${un} value):_value = value;");
    getters.add("$un? get ${tn} => _value is $un ? _value as $un : null;");
    fromJson.add("""if(json["__typename"] == \"$tn\") {
          return $name.$tn(${un}.fromJson(json));
        }""");
  });

  ctors.add("$name(this._value);");

  final oq = gtype.isOptional ? "?" : "";
  var nullCheckFrom = "";
  var nullCheckTo = "";
  if (oq.isNotEmpty) {
    nullCheckFrom = """
        if(json == null) {
          return null;
        }
      """;

    nullCheckTo = """
        if(value == null) {
          return null;
        }
      """;
  }
  final fields = [Field(name: "_value", type: "dynamic")];
  return """
      class $name {
        final dynamic _value;
         ${ctors.join("\n")}
         ${getters.join("\n")}
        
        static $name$oq fromJson(Map<String,dynamic>$oq json){
           $nullCheckFrom
           ${fromJson.join("\n")}
          throw ArgumentError.value(
          json,
           'json',
           'Cannot convert the provided data.',
           );
        }

        static Map<String,dynamic>$oq toJson($name$oq value) {
            $nullCheckTo
           return  value._value.toJson() as Map<String,dynamic>;
           }
      
        ${ModelUtils.createToStringFromFieldsList(name, fields)}
        ${ModelUtils.createEqualsFromFieldsList(name, fields)}
        ${ModelUtils.createHashcodeFromFieldsList(fields)}

      }
    """;
}
