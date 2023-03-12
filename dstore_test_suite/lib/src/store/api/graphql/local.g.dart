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
          ?.map((e) => $enumDecode(_$Enum1EnumMap, e))
          .toList(),
      enum_$d: $enumDecodeNullable(_$Enum1EnumMap, json['enum']),
    );

Map<String, dynamic> _$Input1ToJson(Input1 instance) => <String, dynamic>{
      'name': instance.name,
      'inputs': instance.inputs?.map((e) => e?.toJson()).toList(),
      'count': instance.count,
      'percent': instance.percent,
      'counts': instance.counts,
      'enums': instance.enums?.map((e) => _$Enum1EnumMap[e]!).toList(),
      'enum': _$Enum1EnumMap[instance.enum_$d],
    };

const _$Enum1EnumMap = {
  Enum1.HIGH: 'HIGH',
  Enum1.LOW: 'LOW',
};
