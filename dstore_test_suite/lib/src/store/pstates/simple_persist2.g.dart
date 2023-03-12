// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_persist2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hello _$HelloFromJson(Map<String, dynamic> json) => Hello(
      json['y'] as String,
    );

Map<String, dynamic> _$HelloToJson(Hello instance) => <String, dynamic>{
      'y': instance.y,
    };

SimplePersist2 _$SimplePersist2FromJson(Map<String, dynamic> json) =>
    SimplePersist2(
      p2: json['p2'] as int? ?? 0,
    );

Map<String, dynamic> _$SimplePersist2ToJson(SimplePersist2 instance) =>
    <String, dynamic>{
      'p2': instance.p2,
    };
