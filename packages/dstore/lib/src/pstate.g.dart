// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pstate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsyncActionField _$AsyncActionFieldFromJson(Map<String, dynamic> json) {
  return AsyncActionField(
    loading: json['loading'] as bool,
    completed: json['completed'] as bool,
    error: json['error'],
  );
}

Map<String, dynamic> _$AsyncActionFieldToJson(AsyncActionField instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'completed': instance.completed,
      'error': instance.error,
    };
