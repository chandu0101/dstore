// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input1 _$Input1FromJson(Map<String, dynamic> json) => Input1(
      name: json['name'] as String?,
      inputs: (json['inputs'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Input1.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
      percent: (json['percent'] as num?)?.toDouble(),
      counts: (json['counts'] as List<dynamic>?)?.map((e) => e as int).toList(),
      enums: (json['enums'] as List<dynamic>?)
          ?.map((e) => _$enumDecode(_$Enum1EnumMap, e))
          .toList(),
      enum_$d: _$enumDecodeNullable(_$Enum1EnumMap, json['enum']),
    );

Map<String, dynamic> _$Input1ToJson(Input1 instance) => <String, dynamic>{
      'name': instance.name,
      'inputs': instance.inputs?.map((e) => e?.toJson()).toList(),
      'count': instance.count,
      'percent': instance.percent,
      'counts': instance.counts,
      'enums': instance.enums?.map((e) => _$Enum1EnumMap[e]).toList(),
      'enum': _$Enum1EnumMap[instance.enum_$d],
    };

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

const _$Enum1EnumMap = {
  Enum1.HIGH: 'HIGH',
  Enum1.LOW: 'LOW',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}
