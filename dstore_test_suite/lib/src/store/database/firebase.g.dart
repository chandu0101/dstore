// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserUpdateToJson(UserUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'address': instance.address?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      count: (json['count'] as num?)?.toDouble(),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'address': instance.address?.toJson(),
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message();

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{};

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      name: json['name'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'name': instance.name,
    };

Map<String, dynamic> _$AddressUpdateToJson(AddressUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
