// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_ops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalGraphqlOps_pingData _$LocalGraphqlOps_pingDataFromJson(
        Map<String, dynamic> json) =>
    LocalGraphqlOps_pingData(
      ping: json['ping'] as String?,
    );

Map<String, dynamic> _$LocalGraphqlOps_pingDataToJson(
        LocalGraphqlOps_pingData instance) =>
    <String, dynamic>{
      'ping': instance.ping,
    };

LocalGraphqlOps_usersData _$LocalGraphqlOps_usersDataFromJson(
        Map<String, dynamic> json) =>
    LocalGraphqlOps_usersData(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : LocalGraphqlOps_usersData_users.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalGraphqlOps_usersDataToJson(
        LocalGraphqlOps_usersData instance) =>
    <String, dynamic>{
      'users': instance.users?.map((e) => e?.toJson()).toList(),
    };

LocalGraphqlOps_usersData_users _$LocalGraphqlOps_usersData_usersFromJson(
        Map<String, dynamic> json) =>
    LocalGraphqlOps_usersData_users(
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      hello: LocalGraphqlOps_usersData_users_hello.fromJson(
          json['hello'] as Map<String, dynamic>?),
      helloa: LocalGraphqlOps_usersData_users_helloahelloaListDeserializer(
          json['helloa']),
      address: json['address'] == null
          ? null
          : LocalGraphqlOps_usersData_users_address.fromJson(
              json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalGraphqlOps_usersData_usersToJson(
        LocalGraphqlOps_usersData_users instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tags': instance.tags,
      'hello': LocalGraphqlOps_usersData_users_hello.toJson(instance.hello),
      'helloa': LocalGraphqlOps_usersData_users_helloa_helloaListSerializer(
          instance.helloa),
      'address': instance.address?.toJson(),
    };

LocalGraphqlOps_usersData_users_hello_Hello1
    _$LocalGraphqlOps_usersData_users_hello_Hello1FromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_usersData_users_hello_Hello1(
          name: json['name'] as String?,
          one: json['one'] as String,
          d$___typeName: json['__typename'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_usersData_users_hello_Hello1ToJson(
        LocalGraphqlOps_usersData_users_hello_Hello1 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'one': instance.one,
      '__typename': instance.d$___typeName,
    };

LocalGraphqlOps_usersData_users_hello_Hello2
    _$LocalGraphqlOps_usersData_users_hello_Hello2FromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_usersData_users_hello_Hello2(
          name: json['name'] as String?,
          two: json['two'] as String,
          d$___typeName: json['__typename'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_usersData_users_hello_Hello2ToJson(
        LocalGraphqlOps_usersData_users_hello_Hello2 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'two': instance.two,
      '__typename': instance.d$___typeName,
    };

LocalGraphqlOps_usersData_users_helloa_Hello1
    _$LocalGraphqlOps_usersData_users_helloa_Hello1FromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_usersData_users_helloa_Hello1(
          name: json['name'] as String?,
          one: json['one'] as String,
          d$___typeName: json['__typename'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_usersData_users_helloa_Hello1ToJson(
        LocalGraphqlOps_usersData_users_helloa_Hello1 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'one': instance.one,
      '__typename': instance.d$___typeName,
    };

LocalGraphqlOps_usersData_users_helloa_Hello2
    _$LocalGraphqlOps_usersData_users_helloa_Hello2FromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_usersData_users_helloa_Hello2(
          name: json['name'] as String?,
          two: json['two'] as String,
          d$___typeName: json['__typename'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_usersData_users_helloa_Hello2ToJson(
        LocalGraphqlOps_usersData_users_helloa_Hello2 instance) =>
    <String, dynamic>{
      'name': instance.name,
      'two': instance.two,
      '__typename': instance.d$___typeName,
    };

LocalGraphqlOps_usersData_users_address
    _$LocalGraphqlOps_usersData_users_addressFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_usersData_users_address(
          street: json['street'] as String,
          zip: json['zip'] as String,
          country: LocalGraphqlOps_usersData_users_address_country.fromJson(
              json['country'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$LocalGraphqlOps_usersData_users_addressToJson(
        LocalGraphqlOps_usersData_users_address instance) =>
    <String, dynamic>{
      'street': instance.street,
      'zip': instance.zip,
      'country': instance.country.toJson(),
    };

LocalGraphqlOps_usersData_users_address_country
    _$LocalGraphqlOps_usersData_users_address_countryFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_usersData_users_address_country(
          code: json['code'] as String,
          name: json['name'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_usersData_users_address_countryToJson(
        LocalGraphqlOps_usersData_users_address_country instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

LocalGraphqlOps_chnageNameWithVariablesData
    _$LocalGraphqlOps_chnageNameWithVariablesDataFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_chnageNameWithVariablesData(
          changeName: json['changeName'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_chnageNameWithVariablesDataToJson(
        LocalGraphqlOps_chnageNameWithVariablesData instance) =>
    <String, dynamic>{
      'changeName': instance.changeName,
    };

LocalGraphqlOps_chnageNameWithVariablesVariables
    _$LocalGraphqlOps_chnageNameWithVariablesVariablesFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_chnageNameWithVariablesVariables(
          name: json['name'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_chnageNameWithVariablesVariablesToJson(
        LocalGraphqlOps_chnageNameWithVariablesVariables instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

LocalGraphqlOps_addMessageData _$LocalGraphqlOps_addMessageDataFromJson(
        Map<String, dynamic> json) =>
    LocalGraphqlOps_addMessageData(
      addMessage: LocalGraphqlOps_addMessageData_addMessage.fromJson(
          json['addMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocalGraphqlOps_addMessageDataToJson(
        LocalGraphqlOps_addMessageData instance) =>
    <String, dynamic>{
      'addMessage': instance.addMessage.toJson(),
    };

LocalGraphqlOps_addMessageData_addMessage
    _$LocalGraphqlOps_addMessageData_addMessageFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_addMessageData_addMessage(
          text: json['text'] as String,
        );

Map<String, dynamic> _$LocalGraphqlOps_addMessageData_addMessageToJson(
        LocalGraphqlOps_addMessageData_addMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

LocalGraphqlOps_errorQData _$LocalGraphqlOps_errorQDataFromJson(
        Map<String, dynamic> json) =>
    LocalGraphqlOps_errorQData(
      errorQ: json['errorQ'] as String?,
    );

Map<String, dynamic> _$LocalGraphqlOps_errorQDataToJson(
        LocalGraphqlOps_errorQData instance) =>
    <String, dynamic>{
      'errorQ': instance.errorQ,
    };

LocalGraphqlOps_subscriptionMessageData
    _$LocalGraphqlOps_subscriptionMessageDataFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_subscriptionMessageData(
          messageCreated: json['messageCreated'] == null
              ? null
              : LocalGraphqlOps_subscriptionMessageData_messageCreated.fromJson(
                  json['messageCreated'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$LocalGraphqlOps_subscriptionMessageDataToJson(
        LocalGraphqlOps_subscriptionMessageData instance) =>
    <String, dynamic>{
      'messageCreated': instance.messageCreated?.toJson(),
    };

LocalGraphqlOps_subscriptionMessageData_messageCreated
    _$LocalGraphqlOps_subscriptionMessageData_messageCreatedFromJson(
            Map<String, dynamic> json) =>
        LocalGraphqlOps_subscriptionMessageData_messageCreated(
          text: json['text'] as String,
        );

Map<String, dynamic>
    _$LocalGraphqlOps_subscriptionMessageData_messageCreatedToJson(
            LocalGraphqlOps_subscriptionMessageData_messageCreated instance) =>
        <String, dynamic>{
          'text': instance.text,
        };
