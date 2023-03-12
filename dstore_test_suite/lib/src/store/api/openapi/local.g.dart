// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

helloJsonResponse _$helloJsonResponseFromJson(Map<String, dynamic> json) =>
    helloJsonResponse(
      name: json['name'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$helloJsonResponseToJson(helloJsonResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };

PaginationPathParams _$PaginationPathParamsFromJson(
        Map<String, dynamic> json) =>
    PaginationPathParams(
      page: json['page'] as int,
    );

Map<String, dynamic> _$PaginationPathParamsToJson(
        PaginationPathParams instance) =>
    <String, dynamic>{
      'page': instance.page,
    };

PaginationQueryParams _$PaginationQueryParamsFromJson(
        Map<String, dynamic> json) =>
    PaginationQueryParams(
      qp: json['qp'] as String,
    );

Map<String, dynamic> _$PaginationQueryParamsToJson(
        PaginationQueryParams instance) =>
    <String, dynamic>{
      'qp': instance.qp,
    };

PaginationResponse _$PaginationResponseFromJson(Map<String, dynamic> json) =>
    PaginationResponse(
      list: (json['list'] as List<dynamic>).map((e) => e as String).toList(),
      nextPage: json['nextPage'] as int?,
    );

Map<String, dynamic> _$PaginationResponseToJson(PaginationResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
      'nextPage': instance.nextPage,
    };

JsonPostRequestBody _$JsonPostRequestBodyFromJson(Map<String, dynamic> json) =>
    JsonPostRequestBody(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$JsonPostRequestBodyToJson(
        JsonPostRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

JsonPostResponse _$JsonPostResponseFromJson(Map<String, dynamic> json) =>
    JsonPostResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$JsonPostResponseToJson(JsonPostResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

FormUploadRequestBody _$FormUploadRequestBodyFromJson(
        Map<String, dynamic> json) =>
    FormUploadRequestBody(
      file: (json['file'] as List<dynamic>?)?.map((e) => e as int).toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FormUploadRequestBodyToJson(
        FormUploadRequestBody instance) =>
    <String, dynamic>{
      'file': instance.file,
      'name': instance.name,
    };

FormUploadResponse _$FormUploadResponseFromJson(Map<String, dynamic> json) =>
    FormUploadResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FormUploadResponseToJson(FormUploadResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UploadProgressResponse _$UploadProgressResponseFromJson(
        Map<String, dynamic> json) =>
    UploadProgressResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UploadProgressResponseToJson(
        UploadProgressResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
