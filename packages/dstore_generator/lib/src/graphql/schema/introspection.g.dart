// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntrospectionQuery _$IntrospectionQueryFromJson(Map<String, dynamic> json) {
  return IntrospectionQuery()
    ..g__schema =
        IntrospectionSchema.fromJson(json['__schema'] as Map<String, dynamic>);
}

IntrospectionSchema _$IntrospectionSchemaFromJson(Map<String, dynamic> json) {
  return IntrospectionSchema()
    ..queryType = IntrospectionNamedTypeRef.fromJson(
        json['queryType'] as Map<String, dynamic>)
    ..mutationType = json['mutationType'] == null
        ? null
        : IntrospectionNamedTypeRef.fromJson(
            json['mutationType'] as Map<String, dynamic>)
    ..subscriptionType = json['subscriptionType'] == null
        ? null
        : IntrospectionNamedTypeRef.fromJson(
            json['subscriptionType'] as Map<String, dynamic>)
    ..types = (json['types'] as List<dynamic>)
        .map((e) => IntrospectionType.fromJson(e as Map<String, dynamic>))
        .toList()
    ..directives = (json['directives'] as List<dynamic>)
        .map((e) => IntrospectionDirective.fromJson(e as Map<String, dynamic>))
        .toList();
}

IntrospectionNamedTypeRef _$IntrospectionNamedTypeRefFromJson(
    Map<String, dynamic> json) {
  return IntrospectionNamedTypeRef()..name = json['name'] as String;
}

IntrospectionType _$IntrospectionTypeFromJson(Map<String, dynamic> json) {
  return IntrospectionType()
    ..kind = _$enumDecode(_$IntrospectionTypeKindEnumMap, json['kind'])
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..fields = (json['fields'] as List<dynamic>?)
        ?.map((e) => IntrospectionField.fromJson(e as Map<String, dynamic>))
        .toList()
    ..inputFields = (json['inputFields'] as List<dynamic>?)
        ?.map(
            (e) => IntrospectionInputValue.fromJson(e as Map<String, dynamic>))
        .toList()
    ..interfaces = (json['interfaces'] as List<dynamic>?)
        ?.map((e) => IntrospectionTypeRef.fromJson(e as Map<String, dynamic>))
        .toList()
    ..enumValues = (json['enumValues'] as List<dynamic>?)
        ?.map((e) => IntrospectionEnumValue.fromJson(e as Map<String, dynamic>))
        .toList()
    ..possibleTypes = (json['possibleTypes'] as List<dynamic>?)
        ?.map((e) => IntrospectionTypeRef.fromJson(e as Map<String, dynamic>))
        .toList();
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$IntrospectionTypeKindEnumMap = {
  IntrospectionTypeKind.ENUM: 'ENUM',
  IntrospectionTypeKind.INPUT_OBJECT: 'INPUT_OBJECT',
  IntrospectionTypeKind.SCALAR: 'SCALAR',
  IntrospectionTypeKind.OBJECT: 'OBJECT',
  IntrospectionTypeKind.INTERFACE: 'INTERFACE',
  IntrospectionTypeKind.UNION: 'UNION',
};

IntrospectionField _$IntrospectionFieldFromJson(Map<String, dynamic> json) {
  return IntrospectionField()
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..args = (json['args'] as List<dynamic>)
        .map((e) => IntrospectionInputValue.fromJson(e as Map<String, dynamic>))
        .toList()
    ..type = IntrospectionTypeRef.fromJson(json['type'] as Map<String, dynamic>)
    ..isDeprecated = json['isDeprecated'] as bool
    ..deprecationReason = json['deprecationReason'] as String?;
}

IntrospectionInputValue _$IntrospectionInputValueFromJson(
    Map<String, dynamic> json) {
  return IntrospectionInputValue()
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..type = IntrospectionTypeRef.fromJson(json['type'] as Map<String, dynamic>)
    ..defaultValue = json['defaultValue'] as String?
    ..isDeprecated = json['isDeprecated'] as bool?
    ..deprecationReason = json['deprecationReason'] as String?;
}

IntrospectionEnumValue _$IntrospectionEnumValueFromJson(
    Map<String, dynamic> json) {
  return IntrospectionEnumValue()
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..deprecationReason = json['deprecationReason'] as String?
    ..isDeprecated = json['isDeprecated'] as bool;
}

IntrospectionTypeRef _$IntrospectionTypeRefFromJson(Map<String, dynamic> json) {
  return IntrospectionTypeRef()
    ..kind = _$enumDecode(_$IntrospectionTypeRefKindEnumMap, json['kind'])
    ..name = json['name'] as String?
    ..ofType = json['ofType'] == null
        ? null
        : IntrospectionTypeRef.fromJson(json['ofType'] as Map<String, dynamic>);
}

const _$IntrospectionTypeRefKindEnumMap = {
  IntrospectionTypeRefKind.ENUM: 'ENUM',
  IntrospectionTypeRefKind.INPUT_OBJECT: 'INPUT_OBJECT',
  IntrospectionTypeRefKind.SCALAR: 'SCALAR',
  IntrospectionTypeRefKind.NON_NULL: 'NON_NULL',
  IntrospectionTypeRefKind.LIST: 'LIST',
  IntrospectionTypeRefKind.OBJECT: 'OBJECT',
  IntrospectionTypeRefKind.INTERFACE: 'INTERFACE',
  IntrospectionTypeRefKind.UNION: 'UNION',
};

IntrospectionDirective _$IntrospectionDirectiveFromJson(
    Map<String, dynamic> json) {
  return IntrospectionDirective()
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..isRepeatable = json['isRepeatable'] as bool?
    ..args = (json['args'] as List<dynamic>)
        .map((e) => IntrospectionInputValue.fromJson(e as Map<String, dynamic>))
        .toList()
    ..locations = (json['locations'] as List<dynamic>)
        .map((e) => _$enumDecode(_$DirectiveLocationEnumEnumMap, e))
        .toList();
}

const _$DirectiveLocationEnumEnumMap = {
  DirectiveLocationEnum.QUERY: 'QUERY',
  DirectiveLocationEnum.MUTATION: 'MUTATION',
  DirectiveLocationEnum.SUBSCRIPTION: 'SUBSCRIPTION',
  DirectiveLocationEnum.FIELD: 'FIELD',
  DirectiveLocationEnum.FRAGMENT_DEFINITION: 'FRAGMENT_DEFINITION',
  DirectiveLocationEnum.FRAGMENT_SPREAD: 'FRAGMENT_SPREAD',
  DirectiveLocationEnum.INLINE_FRAGMENT: 'INLINE_FRAGMENT',
  DirectiveLocationEnum.VARIABLE_DEFINITION: 'VARIABLE_DEFINITION',
  DirectiveLocationEnum.SCHEMA: 'SCHEMA',
  DirectiveLocationEnum.SCALAR: 'SCALAR',
  DirectiveLocationEnum.OBJECT: 'OBJECT',
  DirectiveLocationEnum.FIELD_DEFINITION: 'FIELD_DEFINITION',
  DirectiveLocationEnum.ARGUMENT_DEFINITION: 'ARGUMENT_DEFINITION',
  DirectiveLocationEnum.INTERFACE: 'INTERFACE',
  DirectiveLocationEnum.UNION: 'UNION',
  DirectiveLocationEnum.ENUM: 'ENUM',
  DirectiveLocationEnum.ENUM_VALUE: 'ENUM_VALUE',
  DirectiveLocationEnum.INPUT_OBJECT: 'INPUT_OBJECT',
  DirectiveLocationEnum.INPUT_FIELD_DEFINITION: 'INPUT_FIELD_DEFINITION',
};
