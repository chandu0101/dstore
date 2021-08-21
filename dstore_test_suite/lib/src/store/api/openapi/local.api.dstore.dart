// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// OpenApiGenerator
// **************************************************************************

String helloPingResponse_SuccessSerializer(int status, String input) => input;

String helloPingResponse_SuccessDeserializer(int status, dynamic input) =>
    input.toString();

String helloPingResponse_ErrorSerializer(int status, String input) => input;

String helloPingResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

@JsonSerializable()
class helloJsonResponse {
  final String name;

  final int count;

  @JsonKey(ignore: true)
  _$helloJsonResponseCopyWith<helloJsonResponse> get copyWith =>
      __$helloJsonResponseCopyWithImpl<helloJsonResponse>(this, IdentityFn);

  const helloJsonResponse({required this.name, required this.count});

  factory helloJsonResponse.fromJson(Map<String, dynamic> json) =>
      _$helloJsonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$helloJsonResponseToJson(this);

  static helloJsonResponse fromJsonStatic(int status, dynamic value) =>
      _$helloJsonResponseFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, helloJsonResponse input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is helloJsonResponse && o.name == name && o.count == count;
  }

  @override
  int get hashCode => name.hashCode ^ count.hashCode;

  @override
  String toString() =>
      "helloJsonResponse(name: ${this.name}, count: ${this.count})";
}

abstract class $helloJsonResponseCopyWith<O> {
  factory $helloJsonResponseCopyWith(
          helloJsonResponse value, O Function(helloJsonResponse) then) =
      _$helloJsonResponseCopyWithImpl<O>;
  O call({String name, int count});
}

class _$helloJsonResponseCopyWithImpl<O>
    implements $helloJsonResponseCopyWith<O> {
  final helloJsonResponse _value;
  final O Function(helloJsonResponse) _then;
  _$helloJsonResponseCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable, Object? count = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String,
        count: count == dimmutable ? _value.count : count as int));
  }
}

abstract class _$helloJsonResponseCopyWith<O>
    implements $helloJsonResponseCopyWith<O> {
  factory _$helloJsonResponseCopyWith(
          helloJsonResponse value, O Function(helloJsonResponse) then) =
      __$helloJsonResponseCopyWithImpl<O>;
  O call({String name, int count});
}

class __$helloJsonResponseCopyWithImpl<O>
    extends _$helloJsonResponseCopyWithImpl<O>
    implements _$helloJsonResponseCopyWith<O> {
  __$helloJsonResponseCopyWithImpl(
      helloJsonResponse _value, O Function(helloJsonResponse) _then)
      : super(_value, (v) => _then(v));

  @override
  helloJsonResponse get _value => super._value;

  @override
  O call({Object? name = dimmutable, Object? count = dimmutable}) {
    return _then(helloJsonResponse(
        name: name == dimmutable ? _value.name : name as String,
        count: count == dimmutable ? _value.count : count as int));
  }
}

String helloJsonResponse_ErrorSerializer(int status, String input) => input;

String helloJsonResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

List<int> HelloOctetResponse_SuccessSerializer(int status, List<int> input) =>
    input;

List<int> HelloOctetResponse_SuccessDeserializer(int status, dynamic input) =>
    input as List<int>;

String HelloOctetResponse_ErrorSerializer(int status, String input) => input;

String HelloOctetResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

String OptimisticFailResponse_SuccessSerializer(int status, String input) =>
    input;

String OptimisticFailResponse_SuccessDeserializer(int status, dynamic input) =>
    input.toString();

String OptimisticFailResponse_ErrorSerializer(int status, String input) =>
    input;

String OptimisticFailResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

@JsonSerializable()
class PaginationPathParams {
  final int page;

  @JsonKey(ignore: true)
  _$PaginationPathParamsCopyWith<PaginationPathParams> get copyWith =>
      __$PaginationPathParamsCopyWithImpl<PaginationPathParams>(
          this, IdentityFn);

  const PaginationPathParams({required this.page});

  factory PaginationPathParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationPathParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationPathParamsToJson(this);

  static PaginationPathParams fromJsonStatic(dynamic value) =>
      _$PaginationPathParamsFromJson(value as Map<String, dynamic>);

  static Map<String, dynamic> toJsonStatic(dynamic input) =>
      (input as PaginationPathParams).toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is PaginationPathParams && o.page == page;
  }

  @override
  int get hashCode => page.hashCode;

  @override
  String toString() => "PaginationPathParams(page: ${this.page})";
}

abstract class $PaginationPathParamsCopyWith<O> {
  factory $PaginationPathParamsCopyWith(
          PaginationPathParams value, O Function(PaginationPathParams) then) =
      _$PaginationPathParamsCopyWithImpl<O>;
  O call({int page});
}

class _$PaginationPathParamsCopyWithImpl<O>
    implements $PaginationPathParamsCopyWith<O> {
  final PaginationPathParams _value;
  final O Function(PaginationPathParams) _then;
  _$PaginationPathParamsCopyWithImpl(this._value, this._then);

  @override
  O call({Object? page = dimmutable}) {
    return _then(
        _value.copyWith(page: page == dimmutable ? _value.page : page as int));
  }
}

abstract class _$PaginationPathParamsCopyWith<O>
    implements $PaginationPathParamsCopyWith<O> {
  factory _$PaginationPathParamsCopyWith(
          PaginationPathParams value, O Function(PaginationPathParams) then) =
      __$PaginationPathParamsCopyWithImpl<O>;
  O call({int page});
}

class __$PaginationPathParamsCopyWithImpl<O>
    extends _$PaginationPathParamsCopyWithImpl<O>
    implements _$PaginationPathParamsCopyWith<O> {
  __$PaginationPathParamsCopyWithImpl(
      PaginationPathParams _value, O Function(PaginationPathParams) _then)
      : super(_value, (v) => _then(v));

  @override
  PaginationPathParams get _value => super._value;

  @override
  O call({Object? page = dimmutable}) {
    return _then(PaginationPathParams(
        page: page == dimmutable ? _value.page : page as int));
  }
}

@JsonSerializable()
class PaginationQueryParams {
  final String qp;

  @JsonKey(ignore: true)
  _$PaginationQueryParamsCopyWith<PaginationQueryParams> get copyWith =>
      __$PaginationQueryParamsCopyWithImpl<PaginationQueryParams>(
          this, IdentityFn);

  const PaginationQueryParams({required this.qp});

  factory PaginationQueryParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationQueryParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationQueryParamsToJson(this);

  static PaginationQueryParams fromJsonStatic(dynamic value) =>
      _$PaginationQueryParamsFromJson(value as Map<String, dynamic>);

  static Map<String, dynamic> toJsonStatic(dynamic input) =>
      (input as PaginationQueryParams).toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is PaginationQueryParams && o.qp == qp;
  }

  @override
  int get hashCode => qp.hashCode;

  @override
  String toString() => "PaginationQueryParams(qp: ${this.qp})";
}

abstract class $PaginationQueryParamsCopyWith<O> {
  factory $PaginationQueryParamsCopyWith(
          PaginationQueryParams value, O Function(PaginationQueryParams) then) =
      _$PaginationQueryParamsCopyWithImpl<O>;
  O call({String qp});
}

class _$PaginationQueryParamsCopyWithImpl<O>
    implements $PaginationQueryParamsCopyWith<O> {
  final PaginationQueryParams _value;
  final O Function(PaginationQueryParams) _then;
  _$PaginationQueryParamsCopyWithImpl(this._value, this._then);

  @override
  O call({Object? qp = dimmutable}) {
    return _then(
        _value.copyWith(qp: qp == dimmutable ? _value.qp : qp as String));
  }
}

abstract class _$PaginationQueryParamsCopyWith<O>
    implements $PaginationQueryParamsCopyWith<O> {
  factory _$PaginationQueryParamsCopyWith(
          PaginationQueryParams value, O Function(PaginationQueryParams) then) =
      __$PaginationQueryParamsCopyWithImpl<O>;
  O call({String qp});
}

class __$PaginationQueryParamsCopyWithImpl<O>
    extends _$PaginationQueryParamsCopyWithImpl<O>
    implements _$PaginationQueryParamsCopyWith<O> {
  __$PaginationQueryParamsCopyWithImpl(
      PaginationQueryParams _value, O Function(PaginationQueryParams) _then)
      : super(_value, (v) => _then(v));

  @override
  PaginationQueryParams get _value => super._value;

  @override
  O call({Object? qp = dimmutable}) {
    return _then(
        PaginationQueryParams(qp: qp == dimmutable ? _value.qp : qp as String));
  }
}

@JsonSerializable()
class PaginationResponse {
  final List<String> list;

  final int? nextPage;

  @JsonKey(ignore: true)
  _$PaginationResponseCopyWith<PaginationResponse> get copyWith =>
      __$PaginationResponseCopyWithImpl<PaginationResponse>(this, IdentityFn);

  const PaginationResponse({required this.list, this.nextPage});

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);

  static PaginationResponse fromJsonStatic(int status, dynamic value) =>
      _$PaginationResponseFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, PaginationResponse input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is PaginationResponse &&
        ListEquality<dynamic>().equals(list, o.list) &&
        o.nextPage == nextPage;
  }

  @override
  int get hashCode => list.hashCode ^ nextPage.hashCode;

  @override
  String toString() =>
      "PaginationResponse(list: ${this.list}, nextPage: ${this.nextPage})";
}

abstract class $PaginationResponseCopyWith<O> {
  factory $PaginationResponseCopyWith(
          PaginationResponse value, O Function(PaginationResponse) then) =
      _$PaginationResponseCopyWithImpl<O>;
  O call({List<String> list, int? nextPage});
}

class _$PaginationResponseCopyWithImpl<O>
    implements $PaginationResponseCopyWith<O> {
  final PaginationResponse _value;
  final O Function(PaginationResponse) _then;
  _$PaginationResponseCopyWithImpl(this._value, this._then);

  @override
  O call({Object? list = dimmutable, Object? nextPage = dimmutable}) {
    return _then(_value.copyWith(
        list: list == dimmutable ? _value.list : list as List<String>,
        nextPage: nextPage == dimmutable ? _value.nextPage : nextPage as int?));
  }
}

abstract class _$PaginationResponseCopyWith<O>
    implements $PaginationResponseCopyWith<O> {
  factory _$PaginationResponseCopyWith(
          PaginationResponse value, O Function(PaginationResponse) then) =
      __$PaginationResponseCopyWithImpl<O>;
  O call({List<String> list, int? nextPage});
}

class __$PaginationResponseCopyWithImpl<O>
    extends _$PaginationResponseCopyWithImpl<O>
    implements _$PaginationResponseCopyWith<O> {
  __$PaginationResponseCopyWithImpl(
      PaginationResponse _value, O Function(PaginationResponse) _then)
      : super(_value, (v) => _then(v));

  @override
  PaginationResponse get _value => super._value;

  @override
  O call({Object? list = dimmutable, Object? nextPage = dimmutable}) {
    return _then(PaginationResponse(
        list: list == dimmutable ? _value.list : list as List<String>,
        nextPage: nextPage == dimmutable ? _value.nextPage : nextPage as int?));
  }
}

String PaginationResponse_ErrorSerializer(int status, String input) => input;

String PaginationResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

@JsonSerializable()
class JsonPostRequestBody {
  final String? name;

  @JsonKey(ignore: true)
  _$JsonPostRequestBodyCopyWith<JsonPostRequestBody> get copyWith =>
      __$JsonPostRequestBodyCopyWithImpl<JsonPostRequestBody>(this, IdentityFn);

  const JsonPostRequestBody({this.name});

  factory JsonPostRequestBody.fromJson(Map<String, dynamic> json) =>
      _$JsonPostRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$JsonPostRequestBodyToJson(this);

  static JsonPostRequestBody fromJsonStatic(int status, dynamic value) =>
      _$JsonPostRequestBodyFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, JsonPostRequestBody input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is JsonPostRequestBody && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "JsonPostRequestBody(name: ${this.name})";
}

abstract class $JsonPostRequestBodyCopyWith<O> {
  factory $JsonPostRequestBodyCopyWith(
          JsonPostRequestBody value, O Function(JsonPostRequestBody) then) =
      _$JsonPostRequestBodyCopyWithImpl<O>;
  O call({String? name});
}

class _$JsonPostRequestBodyCopyWithImpl<O>
    implements $JsonPostRequestBodyCopyWith<O> {
  final JsonPostRequestBody _value;
  final O Function(JsonPostRequestBody) _then;
  _$JsonPostRequestBodyCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

abstract class _$JsonPostRequestBodyCopyWith<O>
    implements $JsonPostRequestBodyCopyWith<O> {
  factory _$JsonPostRequestBodyCopyWith(
          JsonPostRequestBody value, O Function(JsonPostRequestBody) then) =
      __$JsonPostRequestBodyCopyWithImpl<O>;
  O call({String? name});
}

class __$JsonPostRequestBodyCopyWithImpl<O>
    extends _$JsonPostRequestBodyCopyWithImpl<O>
    implements _$JsonPostRequestBodyCopyWith<O> {
  __$JsonPostRequestBodyCopyWithImpl(
      JsonPostRequestBody _value, O Function(JsonPostRequestBody) _then)
      : super(_value, (v) => _then(v));

  @override
  JsonPostRequestBody get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(JsonPostRequestBody(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

dynamic JsonPostRequestBodySerializer(JsonPostRequestBody input) =>
    input.toJson();

JsonPostRequestBody JsonPostRequestBodyDeserializer(dynamic input) =>
    JsonPostRequestBody.fromJson(input as Map<String, dynamic>);

@JsonSerializable()
class JsonPostResponse {
  final String? name;

  @JsonKey(ignore: true)
  _$JsonPostResponseCopyWith<JsonPostResponse> get copyWith =>
      __$JsonPostResponseCopyWithImpl<JsonPostResponse>(this, IdentityFn);

  const JsonPostResponse({this.name});

  factory JsonPostResponse.fromJson(Map<String, dynamic> json) =>
      _$JsonPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JsonPostResponseToJson(this);

  static JsonPostResponse fromJsonStatic(int status, dynamic value) =>
      _$JsonPostResponseFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, JsonPostResponse input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is JsonPostResponse && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "JsonPostResponse(name: ${this.name})";
}

abstract class $JsonPostResponseCopyWith<O> {
  factory $JsonPostResponseCopyWith(
          JsonPostResponse value, O Function(JsonPostResponse) then) =
      _$JsonPostResponseCopyWithImpl<O>;
  O call({String? name});
}

class _$JsonPostResponseCopyWithImpl<O>
    implements $JsonPostResponseCopyWith<O> {
  final JsonPostResponse _value;
  final O Function(JsonPostResponse) _then;
  _$JsonPostResponseCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

abstract class _$JsonPostResponseCopyWith<O>
    implements $JsonPostResponseCopyWith<O> {
  factory _$JsonPostResponseCopyWith(
          JsonPostResponse value, O Function(JsonPostResponse) then) =
      __$JsonPostResponseCopyWithImpl<O>;
  O call({String? name});
}

class __$JsonPostResponseCopyWithImpl<O>
    extends _$JsonPostResponseCopyWithImpl<O>
    implements _$JsonPostResponseCopyWith<O> {
  __$JsonPostResponseCopyWithImpl(
      JsonPostResponse _value, O Function(JsonPostResponse) _then)
      : super(_value, (v) => _then(v));

  @override
  JsonPostResponse get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(JsonPostResponse(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

String JsonPostResponse_ErrorSerializer(int status, String input) => input;

String JsonPostResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

@JsonSerializable()
class FormUploadRequestBody {
  final List<int>? file;

  final String? name;

  @JsonKey(ignore: true)
  _$FormUploadRequestBodyCopyWith<FormUploadRequestBody> get copyWith =>
      __$FormUploadRequestBodyCopyWithImpl<FormUploadRequestBody>(
          this, IdentityFn);

  const FormUploadRequestBody({this.file, this.name});

  factory FormUploadRequestBody.fromJson(Map<String, dynamic> json) =>
      _$FormUploadRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$FormUploadRequestBodyToJson(this);

  static FormUploadRequestBody fromJsonStatic(int status, dynamic value) =>
      _$FormUploadRequestBodyFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, FormUploadRequestBody input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is FormUploadRequestBody &&
        ListEquality<dynamic>().equals(file, o.file) &&
        o.name == name;
  }

  @override
  int get hashCode => file.hashCode ^ name.hashCode;

  @override
  String toString() =>
      "FormUploadRequestBody(file: ${this.file}, name: ${this.name})";
}

abstract class $FormUploadRequestBodyCopyWith<O> {
  factory $FormUploadRequestBodyCopyWith(
          FormUploadRequestBody value, O Function(FormUploadRequestBody) then) =
      _$FormUploadRequestBodyCopyWithImpl<O>;
  O call({List<int>? file, String? name});
}

class _$FormUploadRequestBodyCopyWithImpl<O>
    implements $FormUploadRequestBodyCopyWith<O> {
  final FormUploadRequestBody _value;
  final O Function(FormUploadRequestBody) _then;
  _$FormUploadRequestBodyCopyWithImpl(this._value, this._then);

  @override
  O call({Object? file = dimmutable, Object? name = dimmutable}) {
    return _then(_value.copyWith(
        file: file == dimmutable ? _value.file : file as List<int>?,
        name: name == dimmutable ? _value.name : name as String?));
  }
}

abstract class _$FormUploadRequestBodyCopyWith<O>
    implements $FormUploadRequestBodyCopyWith<O> {
  factory _$FormUploadRequestBodyCopyWith(
          FormUploadRequestBody value, O Function(FormUploadRequestBody) then) =
      __$FormUploadRequestBodyCopyWithImpl<O>;
  O call({List<int>? file, String? name});
}

class __$FormUploadRequestBodyCopyWithImpl<O>
    extends _$FormUploadRequestBodyCopyWithImpl<O>
    implements _$FormUploadRequestBodyCopyWith<O> {
  __$FormUploadRequestBodyCopyWithImpl(
      FormUploadRequestBody _value, O Function(FormUploadRequestBody) _then)
      : super(_value, (v) => _then(v));

  @override
  FormUploadRequestBody get _value => super._value;

  @override
  O call({Object? file = dimmutable, Object? name = dimmutable}) {
    return _then(FormUploadRequestBody(
        file: file == dimmutable ? _value.file : file as List<int>?,
        name: name == dimmutable ? _value.name : name as String?));
  }
}

dynamic FormUploadRequestBodySerializer(FormUploadRequestBody input) =>
    input.toJson();

FormUploadRequestBody FormUploadRequestBodyDeserializer(dynamic input) =>
    FormUploadRequestBody.fromJson(input as Map<String, dynamic>);

@JsonSerializable()
class FormUploadResponse {
  final String? name;

  @JsonKey(ignore: true)
  _$FormUploadResponseCopyWith<FormUploadResponse> get copyWith =>
      __$FormUploadResponseCopyWithImpl<FormUploadResponse>(this, IdentityFn);

  const FormUploadResponse({this.name});

  factory FormUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$FormUploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FormUploadResponseToJson(this);

  static FormUploadResponse fromJsonStatic(int status, dynamic value) =>
      _$FormUploadResponseFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, FormUploadResponse input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is FormUploadResponse && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "FormUploadResponse(name: ${this.name})";
}

abstract class $FormUploadResponseCopyWith<O> {
  factory $FormUploadResponseCopyWith(
          FormUploadResponse value, O Function(FormUploadResponse) then) =
      _$FormUploadResponseCopyWithImpl<O>;
  O call({String? name});
}

class _$FormUploadResponseCopyWithImpl<O>
    implements $FormUploadResponseCopyWith<O> {
  final FormUploadResponse _value;
  final O Function(FormUploadResponse) _then;
  _$FormUploadResponseCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

abstract class _$FormUploadResponseCopyWith<O>
    implements $FormUploadResponseCopyWith<O> {
  factory _$FormUploadResponseCopyWith(
          FormUploadResponse value, O Function(FormUploadResponse) then) =
      __$FormUploadResponseCopyWithImpl<O>;
  O call({String? name});
}

class __$FormUploadResponseCopyWithImpl<O>
    extends _$FormUploadResponseCopyWithImpl<O>
    implements _$FormUploadResponseCopyWith<O> {
  __$FormUploadResponseCopyWithImpl(
      FormUploadResponse _value, O Function(FormUploadResponse) _then)
      : super(_value, (v) => _then(v));

  @override
  FormUploadResponse get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(FormUploadResponse(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

String FormUploadResponse_ErrorSerializer(int status, String input) => input;

String FormUploadResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

List<int> UploadProgressRequestBodySerializer(List<int> input) => input;
List<int> UploadProgressRequestBodyDeserializer(dynamic input) =>
    (input as List<dynamic>).map((dynamic v) => v as int).toList();

@JsonSerializable()
class UploadProgressResponse {
  final String? name;

  @JsonKey(ignore: true)
  _$UploadProgressResponseCopyWith<UploadProgressResponse> get copyWith =>
      __$UploadProgressResponseCopyWithImpl<UploadProgressResponse>(
          this, IdentityFn);

  const UploadProgressResponse({this.name});

  factory UploadProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadProgressResponseToJson(this);

  static UploadProgressResponse fromJsonStatic(int status, dynamic value) =>
      _$UploadProgressResponseFromJson(value as Map<String, dynamic>);

  static dynamic toJsonStatic(int status, UploadProgressResponse input) =>
      input.toJson();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is UploadProgressResponse && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "UploadProgressResponse(name: ${this.name})";
}

abstract class $UploadProgressResponseCopyWith<O> {
  factory $UploadProgressResponseCopyWith(UploadProgressResponse value,
          O Function(UploadProgressResponse) then) =
      _$UploadProgressResponseCopyWithImpl<O>;
  O call({String? name});
}

class _$UploadProgressResponseCopyWithImpl<O>
    implements $UploadProgressResponseCopyWith<O> {
  final UploadProgressResponse _value;
  final O Function(UploadProgressResponse) _then;
  _$UploadProgressResponseCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

abstract class _$UploadProgressResponseCopyWith<O>
    implements $UploadProgressResponseCopyWith<O> {
  factory _$UploadProgressResponseCopyWith(UploadProgressResponse value,
          O Function(UploadProgressResponse) then) =
      __$UploadProgressResponseCopyWithImpl<O>;
  O call({String? name});
}

class __$UploadProgressResponseCopyWithImpl<O>
    extends _$UploadProgressResponseCopyWithImpl<O>
    implements _$UploadProgressResponseCopyWith<O> {
  __$UploadProgressResponseCopyWithImpl(
      UploadProgressResponse _value, O Function(UploadProgressResponse) _then)
      : super(_value, (v) => _then(v));

  @override
  UploadProgressResponse get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(UploadProgressResponse(
        name: name == dimmutable ? _value.name : name as String?));
  }
}

String UploadProgressResponse_ErrorSerializer(int status, String input) =>
    input;

String UploadProgressResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

List<int> DownloadProgressResponse_SuccessSerializer(
        int status, List<int> input) =>
    input;

List<int> DownloadProgressResponse_SuccessDeserializer(
        int status, dynamic input) =>
    input as List<int>;

String DownloadProgressResponse_ErrorSerializer(int status, String input) =>
    input;

String DownloadProgressResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

String OfflineOpResponse_SuccessSerializer(int status, String input) => input;

String OfflineOpResponse_SuccessDeserializer(int status, dynamic input) =>
    input.toString();

String OfflineOpResponse_ErrorSerializer(int status, String input) => input;

String OfflineOpResponse_ErrorDeserializer(int status, dynamic input) =>
    input.toString();

@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/",
    responseType: HttpResponseType.STRING,
    responseSerializer: helloPingResponse_SuccessSerializer,
    responseDeserializer: helloPingResponse_SuccessDeserializer,
    errorDeserializer: helloPingResponse_ErrorDeserializer)
typedef helloPing = HttpField<Null, String, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/",
    responseType: HttpResponseType.STRING,
    responseSerializer: helloPingResponse_SuccessSerializer,
    responseDeserializer: helloPingResponse_SuccessDeserializer,
    errorDeserializer: helloPingResponse_ErrorDeserializer,
    originalResponseType: 'String')
typedef helloPingTransform<T> = HttpField<Null, T, String>;

@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/json",
    responseType: HttpResponseType.JSON,
    responseSerializer: helloJsonResponse.toJsonStatic,
    responseDeserializer: helloJsonResponse.fromJsonStatic,
    errorDeserializer: helloJsonResponse_ErrorDeserializer)
typedef helloJson = HttpField<Null, helloJsonResponse, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/json",
    responseType: HttpResponseType.JSON,
    responseSerializer: helloJsonResponse.toJsonStatic,
    responseDeserializer: helloJsonResponse.fromJsonStatic,
    errorDeserializer: helloJsonResponse_ErrorDeserializer,
    originalResponseType: 'helloJsonResponse')
typedef helloJsonTransform<T> = HttpField<Null, T, String>;

@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/octet",
    responseType: HttpResponseType.BYTES,
    responseSerializer: HelloOctetResponse_SuccessSerializer,
    responseDeserializer: HelloOctetResponse_SuccessDeserializer,
    errorDeserializer: HelloOctetResponse_ErrorDeserializer)
typedef HelloOctet = HttpField<Null, List<int>, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/octet",
    responseType: HttpResponseType.BYTES,
    responseSerializer: HelloOctetResponse_SuccessSerializer,
    responseDeserializer: HelloOctetResponse_SuccessDeserializer,
    errorDeserializer: HelloOctetResponse_ErrorDeserializer,
    originalResponseType: 'List<int>')
typedef HelloOctetTransform<T> = HttpField<Null, T, String>;

@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/optimistic-fail",
    responseType: HttpResponseType.STRING,
    responseSerializer: OptimisticFailResponse_SuccessSerializer,
    responseDeserializer: OptimisticFailResponse_SuccessDeserializer,
    errorDeserializer: OptimisticFailResponse_ErrorDeserializer)
typedef OptimisticFail = HttpField<Null, String, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/optimistic-fail",
    responseType: HttpResponseType.STRING,
    responseSerializer: OptimisticFailResponse_SuccessSerializer,
    responseDeserializer: OptimisticFailResponse_SuccessDeserializer,
    errorDeserializer: OptimisticFailResponse_ErrorDeserializer,
    originalResponseType: 'String')
typedef OptimisticFailTransform<T> = HttpField<Null, T, String>;

@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/pagination/{page}",
    responseType: HttpResponseType.JSON,
    responseSerializer: PaginationResponse.toJsonStatic,
    responseDeserializer: PaginationResponse.fromJsonStatic,
    errorDeserializer: PaginationResponse_ErrorDeserializer,
    queryParamsType: "PaginationQueryParams",
    pathParamsType: "PaginationPathParams")
typedef Pagination = HttpField<Null, PaginationResponse, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/pagination/{page}",
    responseType: HttpResponseType.JSON,
    responseSerializer: PaginationResponse.toJsonStatic,
    responseDeserializer: PaginationResponse.fromJsonStatic,
    errorDeserializer: PaginationResponse_ErrorDeserializer,
    queryParamsType: "PaginationQueryParams",
    pathParamsType: "PaginationPathParams",
    originalResponseType: 'PaginationResponse')
typedef PaginationTransform<T> = HttpField<Null, T, String>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/jsonpost",
    inputDeserializer: JsonPostRequestBodyDeserializer,
    inputSerializer: JsonPostRequestBodySerializer,
    responseType: HttpResponseType.JSON,
    responseSerializer: JsonPostResponse.toJsonStatic,
    responseDeserializer: JsonPostResponse.fromJsonStatic,
    errorDeserializer: JsonPostResponse_ErrorDeserializer)
typedef JsonPost = HttpField<JsonPostRequestBody, JsonPostResponse, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/jsonpost",
    inputDeserializer: JsonPostRequestBodyDeserializer,
    inputSerializer: JsonPostRequestBodySerializer,
    responseType: HttpResponseType.JSON,
    responseSerializer: JsonPostResponse.toJsonStatic,
    responseDeserializer: JsonPostResponse.fromJsonStatic,
    errorDeserializer: JsonPostResponse_ErrorDeserializer,
    originalResponseType: 'JsonPostResponse')
typedef JsonPostTransform<T> = HttpField<JsonPostRequestBody, T, String>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/form-upload",
    inputDeserializer: FormUploadRequestBodyDeserializer,
    inputSerializer: FormUploadRequestBodySerializer,
    responseType: HttpResponseType.JSON,
    responseSerializer: FormUploadResponse.toJsonStatic,
    responseDeserializer: FormUploadResponse.fromJsonStatic,
    errorDeserializer: FormUploadResponse_ErrorDeserializer)
typedef FormUpload
    = HttpField<FormUploadRequestBody, FormUploadResponse, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/form-upload",
    inputDeserializer: FormUploadRequestBodyDeserializer,
    inputSerializer: FormUploadRequestBodySerializer,
    responseType: HttpResponseType.JSON,
    responseSerializer: FormUploadResponse.toJsonStatic,
    responseDeserializer: FormUploadResponse.fromJsonStatic,
    errorDeserializer: FormUploadResponse_ErrorDeserializer,
    originalResponseType: 'FormUploadResponse')
typedef FormUploadTransform<T> = HttpField<FormUploadRequestBody, T, String>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/uploadprogress",
    inputDeserializer: UploadProgressRequestBodyDeserializer,
    inputSerializer: UploadProgressRequestBodySerializer,
    responseType: HttpResponseType.JSON,
    responseSerializer: UploadProgressResponse.toJsonStatic,
    responseDeserializer: UploadProgressResponse.fromJsonStatic,
    errorDeserializer: UploadProgressResponse_ErrorDeserializer)
typedef UploadProgress = HttpField<List<int>, UploadProgressResponse, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/uploadprogress",
    inputDeserializer: UploadProgressRequestBodyDeserializer,
    inputSerializer: UploadProgressRequestBodySerializer,
    responseType: HttpResponseType.JSON,
    responseSerializer: UploadProgressResponse.toJsonStatic,
    responseDeserializer: UploadProgressResponse.fromJsonStatic,
    errorDeserializer: UploadProgressResponse_ErrorDeserializer,
    originalResponseType: 'UploadProgressResponse')
typedef UploadProgressTransform<T> = HttpField<List<int>, T, String>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/download",
    responseType: HttpResponseType.BYTES,
    responseSerializer: DownloadProgressResponse_SuccessSerializer,
    responseDeserializer: DownloadProgressResponse_SuccessDeserializer,
    errorDeserializer: DownloadProgressResponse_ErrorDeserializer)
typedef DownloadProgress = HttpField<Null, List<int>, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "POST",
    url: "http://localhost:8080/download",
    responseType: HttpResponseType.BYTES,
    responseSerializer: DownloadProgressResponse_SuccessSerializer,
    responseDeserializer: DownloadProgressResponse_SuccessDeserializer,
    errorDeserializer: DownloadProgressResponse_ErrorDeserializer,
    originalResponseType: 'List<int>')
typedef DownloadProgressTransform<T> = HttpField<Null, T, String>;

@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/offline",
    responseType: HttpResponseType.STRING,
    responseSerializer: OfflineOpResponse_SuccessSerializer,
    responseDeserializer: OfflineOpResponse_SuccessDeserializer,
    errorDeserializer: OfflineOpResponse_ErrorDeserializer)
typedef OfflineOp = HttpField<Null, String, String>;

// use this when you want to transform original http response type(like when you want to store only part of response or paginations etc)
@HttpRequest(
    method: "GET",
    url: "http://localhost:8080/offline",
    responseType: HttpResponseType.STRING,
    responseSerializer: OfflineOpResponse_SuccessSerializer,
    responseDeserializer: OfflineOpResponse_SuccessDeserializer,
    errorDeserializer: OfflineOpResponse_ErrorDeserializer,
    originalResponseType: 'String')
typedef OfflineOpTransform<T> = HttpField<Null, T, String>;
