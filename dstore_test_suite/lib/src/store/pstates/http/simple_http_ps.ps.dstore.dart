// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_http_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleHttp extends PStateModel<SimpleHttp> {
  final helloPing ping;

  final helloJson json;

  final HelloOctet octet;

  final OptimisticFail optFail;

  @HttpRequestExtension(transformer: pingTransform)
  final helloJsonTransform<int> pinInt;

  @HttpRequestExtension(
      transformer: paginationTransformer, persitDataBetweenFetches: true)
  final Pagination pagination;

  final JsonPost jsPost;

  final FormUpload fromUpload;

  final UploadProgress uploadProgress;

  final DownloadProgress downloadProgress;

  final OfflineOp offlineOp;

  final LocalGraphqlOps_ping pingGraphql;

  final LocalGraphqlOps_users grpahqlUsers;

  final LocalGraphqlOps_chnageNameWithVariables graphqlChangeVariable;

  final LocalGraphqlOps_errorQ graphqlError;

  final LocalGraphqlOps_addMessage graphqlAddMessage;

  _$SimpleHttpCopyWith<SimpleHttp> get copyWith =>
      __$SimpleHttpCopyWithImpl<SimpleHttp>(this, IdentityFn);

  SimpleHttp(
      {this.ping = const helloPing(),
      this.json = const helloJson(),
      this.octet = const HelloOctet(),
      this.optFail = const OptimisticFail(),
      this.pinInt = const helloJsonTransform(),
      this.pagination = const Pagination(),
      this.jsPost = const JsonPost(),
      this.fromUpload = const FormUpload(),
      this.uploadProgress = const UploadProgress(),
      this.downloadProgress = const DownloadProgress(),
      this.offlineOp = const OfflineOp(),
      this.pingGraphql = const LocalGraphqlOps_ping(),
      this.grpahqlUsers = const LocalGraphqlOps_users(),
      this.graphqlChangeVariable =
          const LocalGraphqlOps_chnageNameWithVariables(),
      this.graphqlError = const LocalGraphqlOps_errorQ(),
      this.graphqlAddMessage = const LocalGraphqlOps_addMessage()});

  @override
  SimpleHttp copyWithMap(Map<String, dynamic> map) => SimpleHttp(
      ping: map.containsKey("ping") ? map["ping"] as helloPing : this.ping,
      json: map.containsKey("json") ? map["json"] as helloJson : this.json,
      octet: map.containsKey("octet") ? map["octet"] as HelloOctet : this.octet,
      optFail: map.containsKey("optFail")
          ? map["optFail"] as OptimisticFail
          : this.optFail,
      pinInt: map.containsKey("pinInt")
          ? map["pinInt"] as helloJsonTransform<int>
          : this.pinInt,
      pagination: map.containsKey("pagination")
          ? map["pagination"] as Pagination
          : this.pagination,
      jsPost:
          map.containsKey("jsPost") ? map["jsPost"] as JsonPost : this.jsPost,
      fromUpload: map.containsKey("fromUpload")
          ? map["fromUpload"] as FormUpload
          : this.fromUpload,
      uploadProgress: map.containsKey("uploadProgress")
          ? map["uploadProgress"] as UploadProgress
          : this.uploadProgress,
      downloadProgress: map.containsKey("downloadProgress")
          ? map["downloadProgress"] as DownloadProgress
          : this.downloadProgress,
      offlineOp: map.containsKey("offlineOp")
          ? map["offlineOp"] as OfflineOp
          : this.offlineOp,
      pingGraphql: map.containsKey("pingGraphql")
          ? map["pingGraphql"] as LocalGraphqlOps_ping
          : this.pingGraphql,
      grpahqlUsers: map.containsKey("grpahqlUsers")
          ? map["grpahqlUsers"] as LocalGraphqlOps_users
          : this.grpahqlUsers,
      graphqlChangeVariable: map.containsKey("graphqlChangeVariable")
          ? map["graphqlChangeVariable"]
              as LocalGraphqlOps_chnageNameWithVariables
          : this.graphqlChangeVariable,
      graphqlError: map.containsKey("graphqlError")
          ? map["graphqlError"] as LocalGraphqlOps_errorQ
          : this.graphqlError,
      graphqlAddMessage: map.containsKey("graphqlAddMessage")
          ? map["graphqlAddMessage"] as LocalGraphqlOps_addMessage
          : this.graphqlAddMessage);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "ping": this.ping,
        "json": this.json,
        "octet": this.octet,
        "optFail": this.optFail,
        "pinInt": this.pinInt,
        "pagination": this.pagination,
        "jsPost": this.jsPost,
        "fromUpload": this.fromUpload,
        "uploadProgress": this.uploadProgress,
        "downloadProgress": this.downloadProgress,
        "offlineOp": this.offlineOp,
        "pingGraphql": this.pingGraphql,
        "grpahqlUsers": this.grpahqlUsers,
        "graphqlChangeVariable": this.graphqlChangeVariable,
        "graphqlError": this.graphqlError,
        "graphqlAddMessage": this.graphqlAddMessage
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleHttp &&
        o.ping == ping &&
        o.json == json &&
        o.octet == octet &&
        o.optFail == optFail &&
        o.pinInt == pinInt &&
        o.pagination == pagination &&
        o.jsPost == jsPost &&
        o.fromUpload == fromUpload &&
        o.uploadProgress == uploadProgress &&
        o.downloadProgress == downloadProgress &&
        o.offlineOp == offlineOp &&
        o.pingGraphql == pingGraphql &&
        o.grpahqlUsers == grpahqlUsers &&
        o.graphqlChangeVariable == graphqlChangeVariable &&
        o.graphqlError == graphqlError &&
        o.graphqlAddMessage == graphqlAddMessage;
  }

  @override
  int get hashCode =>
      ping.hashCode ^
      json.hashCode ^
      octet.hashCode ^
      optFail.hashCode ^
      pinInt.hashCode ^
      pagination.hashCode ^
      jsPost.hashCode ^
      fromUpload.hashCode ^
      uploadProgress.hashCode ^
      downloadProgress.hashCode ^
      offlineOp.hashCode ^
      pingGraphql.hashCode ^
      grpahqlUsers.hashCode ^
      graphqlChangeVariable.hashCode ^
      graphqlError.hashCode ^
      graphqlAddMessage.hashCode;

  @override
  String toString() =>
      "SimpleHttp(ping: ${this.ping}, json: ${this.json}, octet: ${this.octet}, optFail: ${this.optFail}, pinInt: ${this.pinInt}, pagination: ${this.pagination}, jsPost: ${this.jsPost}, fromUpload: ${this.fromUpload}, uploadProgress: ${this.uploadProgress}, downloadProgress: ${this.downloadProgress}, offlineOp: ${this.offlineOp}, pingGraphql: ${this.pingGraphql}, grpahqlUsers: ${this.grpahqlUsers}, graphqlChangeVariable: ${this.graphqlChangeVariable}, graphqlError: ${this.graphqlError}, graphqlAddMessage: ${this.graphqlAddMessage})";
}

abstract class $SimpleHttpCopyWith<O> {
  factory $SimpleHttpCopyWith(SimpleHttp value, O Function(SimpleHttp) then) =
      _$SimpleHttpCopyWithImpl<O>;
  O call(
      {helloPing ping,
      helloJson json,
      HelloOctet octet,
      OptimisticFail optFail,
      helloJsonTransform<int> pinInt,
      Pagination pagination,
      JsonPost jsPost,
      FormUpload fromUpload,
      UploadProgress uploadProgress,
      DownloadProgress downloadProgress,
      OfflineOp offlineOp,
      LocalGraphqlOps_ping pingGraphql,
      LocalGraphqlOps_users grpahqlUsers,
      LocalGraphqlOps_chnageNameWithVariables graphqlChangeVariable,
      LocalGraphqlOps_errorQ graphqlError,
      LocalGraphqlOps_addMessage graphqlAddMessage});
}

class _$SimpleHttpCopyWithImpl<O> implements $SimpleHttpCopyWith<O> {
  final SimpleHttp _value;
  final O Function(SimpleHttp) _then;
  _$SimpleHttpCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? ping = dimmutable,
      Object? json = dimmutable,
      Object? octet = dimmutable,
      Object? optFail = dimmutable,
      Object? pinInt = dimmutable,
      Object? pagination = dimmutable,
      Object? jsPost = dimmutable,
      Object? fromUpload = dimmutable,
      Object? uploadProgress = dimmutable,
      Object? downloadProgress = dimmutable,
      Object? offlineOp = dimmutable,
      Object? pingGraphql = dimmutable,
      Object? grpahqlUsers = dimmutable,
      Object? graphqlChangeVariable = dimmutable,
      Object? graphqlError = dimmutable,
      Object? graphqlAddMessage = dimmutable}) {
    return _then(_value.copyWith(
        ping: ping == dimmutable ? _value.ping : ping as helloPing,
        json: json == dimmutable ? _value.json : json as helloJson,
        octet: octet == dimmutable ? _value.octet : octet as HelloOctet,
        optFail:
            optFail == dimmutable ? _value.optFail : optFail as OptimisticFail,
        pinInt: pinInt == dimmutable
            ? _value.pinInt
            : pinInt as helloJsonTransform<int>,
        pagination: pagination == dimmutable
            ? _value.pagination
            : pagination as Pagination,
        jsPost: jsPost == dimmutable ? _value.jsPost : jsPost as JsonPost,
        fromUpload: fromUpload == dimmutable
            ? _value.fromUpload
            : fromUpload as FormUpload,
        uploadProgress: uploadProgress == dimmutable
            ? _value.uploadProgress
            : uploadProgress as UploadProgress,
        downloadProgress: downloadProgress == dimmutable
            ? _value.downloadProgress
            : downloadProgress as DownloadProgress,
        offlineOp:
            offlineOp == dimmutable ? _value.offlineOp : offlineOp as OfflineOp,
        pingGraphql: pingGraphql == dimmutable
            ? _value.pingGraphql
            : pingGraphql as LocalGraphqlOps_ping,
        grpahqlUsers: grpahqlUsers == dimmutable
            ? _value.grpahqlUsers
            : grpahqlUsers as LocalGraphqlOps_users,
        graphqlChangeVariable: graphqlChangeVariable == dimmutable
            ? _value.graphqlChangeVariable
            : graphqlChangeVariable as LocalGraphqlOps_chnageNameWithVariables,
        graphqlError: graphqlError == dimmutable
            ? _value.graphqlError
            : graphqlError as LocalGraphqlOps_errorQ,
        graphqlAddMessage: graphqlAddMessage == dimmutable
            ? _value.graphqlAddMessage
            : graphqlAddMessage as LocalGraphqlOps_addMessage));
  }
}

abstract class _$SimpleHttpCopyWith<O> implements $SimpleHttpCopyWith<O> {
  factory _$SimpleHttpCopyWith(SimpleHttp value, O Function(SimpleHttp) then) =
      __$SimpleHttpCopyWithImpl<O>;
  O call(
      {helloPing ping,
      helloJson json,
      HelloOctet octet,
      OptimisticFail optFail,
      helloJsonTransform<int> pinInt,
      Pagination pagination,
      JsonPost jsPost,
      FormUpload fromUpload,
      UploadProgress uploadProgress,
      DownloadProgress downloadProgress,
      OfflineOp offlineOp,
      LocalGraphqlOps_ping pingGraphql,
      LocalGraphqlOps_users grpahqlUsers,
      LocalGraphqlOps_chnageNameWithVariables graphqlChangeVariable,
      LocalGraphqlOps_errorQ graphqlError,
      LocalGraphqlOps_addMessage graphqlAddMessage});
}

class __$SimpleHttpCopyWithImpl<O> extends _$SimpleHttpCopyWithImpl<O>
    implements _$SimpleHttpCopyWith<O> {
  __$SimpleHttpCopyWithImpl(SimpleHttp _value, O Function(SimpleHttp) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleHttp get _value => super._value;

  @override
  O call(
      {Object? ping = dimmutable,
      Object? json = dimmutable,
      Object? octet = dimmutable,
      Object? optFail = dimmutable,
      Object? pinInt = dimmutable,
      Object? pagination = dimmutable,
      Object? jsPost = dimmutable,
      Object? fromUpload = dimmutable,
      Object? uploadProgress = dimmutable,
      Object? downloadProgress = dimmutable,
      Object? offlineOp = dimmutable,
      Object? pingGraphql = dimmutable,
      Object? grpahqlUsers = dimmutable,
      Object? graphqlChangeVariable = dimmutable,
      Object? graphqlError = dimmutable,
      Object? graphqlAddMessage = dimmutable}) {
    return _then(SimpleHttp(
        ping: ping == dimmutable ? _value.ping : ping as helloPing,
        json: json == dimmutable ? _value.json : json as helloJson,
        octet: octet == dimmutable ? _value.octet : octet as HelloOctet,
        optFail:
            optFail == dimmutable ? _value.optFail : optFail as OptimisticFail,
        pinInt: pinInt == dimmutable
            ? _value.pinInt
            : pinInt as helloJsonTransform<int>,
        pagination: pagination == dimmutable
            ? _value.pagination
            : pagination as Pagination,
        jsPost: jsPost == dimmutable ? _value.jsPost : jsPost as JsonPost,
        fromUpload: fromUpload == dimmutable
            ? _value.fromUpload
            : fromUpload as FormUpload,
        uploadProgress: uploadProgress == dimmutable
            ? _value.uploadProgress
            : uploadProgress as UploadProgress,
        downloadProgress: downloadProgress == dimmutable
            ? _value.downloadProgress
            : downloadProgress as DownloadProgress,
        offlineOp:
            offlineOp == dimmutable ? _value.offlineOp : offlineOp as OfflineOp,
        pingGraphql: pingGraphql == dimmutable
            ? _value.pingGraphql
            : pingGraphql as LocalGraphqlOps_ping,
        grpahqlUsers: grpahqlUsers == dimmutable
            ? _value.grpahqlUsers
            : grpahqlUsers as LocalGraphqlOps_users,
        graphqlChangeVariable: graphqlChangeVariable == dimmutable
            ? _value.graphqlChangeVariable
            : graphqlChangeVariable as LocalGraphqlOps_chnageNameWithVariables,
        graphqlError: graphqlError == dimmutable
            ? _value.graphqlError
            : graphqlError as LocalGraphqlOps_errorQ,
        graphqlAddMessage: graphqlAddMessage == dimmutable
            ? _value.graphqlAddMessage
            : graphqlAddMessage as LocalGraphqlOps_addMessage));
  }
}

const _SimpleHttp_FullPath = "/store/pstates/http/simple_http_ps/SimpleHttp";

abstract class SimpleHttpActions {
  static Action<HttpField<Null, String, String>> ping(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      String? optimisticResponse,
      HttpField<Null, String, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, String, String>>(
        name: "ping",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, String, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/",
            method: "GET",
            responseType: HttpResponseType.STRING,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, String, String>> pingMock(
      HttpField<Null, String, String> mock) {
    return Action<HttpField<Null, String, String>>(
        name: "ping", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, helloJsonResponse, String>> json(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      helloJsonResponse? optimisticResponse,
      HttpField<Null, helloJsonResponse, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, helloJsonResponse, String>>(
        name: "json",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, helloJsonResponse, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/json",
            method: "GET",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, helloJsonResponse, String>> jsonMock(
      HttpField<Null, helloJsonResponse, String> mock) {
    return Action<HttpField<Null, helloJsonResponse, String>>(
        name: "json", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, List<int>, String>> octet(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      List<int>? optimisticResponse,
      HttpField<Null, List<int>, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, List<int>, String>>(
        name: "octet",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, List<int>, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/octet",
            method: "GET",
            responseType: HttpResponseType.BYTES,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, List<int>, String>> octetMock(
      HttpField<Null, List<int>, String> mock) {
    return Action<HttpField<Null, List<int>, String>>(
        name: "octet", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, String, String>> optFail(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      String? optimisticResponse,
      HttpField<Null, String, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, String, String>>(
        name: "optFail",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, String, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/optimistic-fail",
            method: "GET",
            responseType: HttpResponseType.STRING,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, String, String>> optFailMock(
      HttpField<Null, String, String> mock) {
    return Action<HttpField<Null, String, String>>(
        name: "optFail", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, int, String>> pinInt(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      helloJsonResponse? optimisticResponse,
      HttpField<Null, int, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, int, String>>(
        name: "pinInt",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, helloJsonResponse, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/json",
            method: "GET",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, int, String>> pinIntMock(
      HttpField<Null, int, String> mock) {
    return Action<HttpField<Null, int, String>>(
        name: "pinInt", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, PaginationResponse, String>> pagination(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      PaginationResponse? optimisticResponse,
      required PaginationPathParams pathParams,
      required PaginationQueryParams queryParams,
      HttpField<Null, PaginationResponse, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, PaginationResponse, String>>(
        name: "pagination",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<PaginationPathParams, PaginationQueryParams, Null,
                PaginationResponse, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/pagination/{page}",
            method: "GET",
            responseType: HttpResponseType.JSON,
            pathParams: pathParams,
            queryParams: queryParams,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, PaginationResponse, String>> paginationMock(
      HttpField<Null, PaginationResponse, String> mock) {
    return Action<HttpField<Null, PaginationResponse, String>>(
        name: "pagination", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<JsonPostRequestBody, JsonPostResponse, String>>
      jsPost(
          {required JsonPostRequestBody input,
          bool abortable = false,
          bool silent = false,
          bool offline = false,
          Map<String, String>? headers,
          JsonPostResponse? optimisticResponse,
          HttpField<JsonPostRequestBody, JsonPostResponse, String>? mock,
          Duration? debounce,
          bool listenSendProgress = false,
          bool listenReceiveProgress = false}) {
    return Action<HttpField<JsonPostRequestBody, JsonPostResponse, String>>(
        name: "jsPost",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, JsonPostRequestBody, JsonPostResponse,
                String, dynamic>(
            data: input,
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/jsonpost",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<JsonPostRequestBody, JsonPostResponse, String>>
      jsPostMock(
          HttpField<JsonPostRequestBody, JsonPostResponse, String> mock) {
    return Action<HttpField<JsonPostRequestBody, JsonPostResponse, String>>(
        name: "jsPost", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<FormUploadRequestBody, FormUploadResponse, String>>
      fromUpload(
          {required FormUploadRequestBody input,
          bool abortable = false,
          bool silent = false,
          bool offline = false,
          Map<String, String>? headers,
          FormUploadResponse? optimisticResponse,
          HttpField<FormUploadRequestBody, FormUploadResponse, String>? mock,
          Duration? debounce,
          bool listenSendProgress = false,
          bool listenReceiveProgress = false}) {
    return Action<HttpField<FormUploadRequestBody, FormUploadResponse, String>>(
        name: "fromUpload",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, FormUploadRequestBody, FormUploadResponse,
                String, dynamic>(
            data: input,
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/form-upload",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<FormUploadRequestBody, FormUploadResponse, String>>
      fromUploadMock(
          HttpField<FormUploadRequestBody, FormUploadResponse, String> mock) {
    return Action<HttpField<FormUploadRequestBody, FormUploadResponse, String>>(
        name: "fromUpload", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<List<int>, UploadProgressResponse, String>>
      uploadProgress(
          {required List<int> input,
          bool abortable = false,
          bool silent = false,
          bool offline = false,
          Map<String, String>? headers,
          UploadProgressResponse? optimisticResponse,
          HttpField<List<int>, UploadProgressResponse, String>? mock,
          Duration? debounce,
          bool listenSendProgress = false,
          bool listenReceiveProgress = false}) {
    return Action<HttpField<List<int>, UploadProgressResponse, String>>(
        name: "uploadProgress",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, List<int>, UploadProgressResponse, String,
                dynamic>(
            data: input,
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/uploadprogress",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<List<int>, UploadProgressResponse, String>>
      uploadProgressMock(
          HttpField<List<int>, UploadProgressResponse, String> mock) {
    return Action<HttpField<List<int>, UploadProgressResponse, String>>(
        name: "uploadProgress", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, List<int>, String>> downloadProgress(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      List<int>? optimisticResponse,
      HttpField<Null, List<int>, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, List<int>, String>>(
        name: "downloadProgress",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, List<int>, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/download",
            method: "POST",
            responseType: HttpResponseType.BYTES,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, List<int>, String>> downloadProgressMock(
      HttpField<Null, List<int>, String> mock) {
    return Action<HttpField<Null, List<int>, String>>(
        name: "downloadProgress", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<HttpField<Null, String, String>> offlineOp(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      String? optimisticResponse,
      HttpField<Null, String, String>? mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    return Action<HttpField<Null, String, String>>(
        name: "offlineOp",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, Null, String, String, dynamic>(
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:8080/offline",
            method: "GET",
            responseType: HttpResponseType.STRING,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<HttpField<Null, String, String>> offlineOpMock(
      HttpField<Null, String, String> mock) {
    return Action<HttpField<Null, String, String>>(
        name: "offlineOp", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_pingData,
          List<GraphqlError>>> pingGraphql(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      LocalGraphqlOps_pingData? optimisticResponse,
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_pingData,
              List<GraphqlError>>?
          mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    headers = <String, String>{...headers ?? <String, String>{}};
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_pingData,
                List<GraphqlError>>>(
        name: "pingGraphql",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, GraphqlRequestInput<Null>,
                LocalGraphqlOps_pingData, List<GraphqlError>, dynamic>(
            data: GraphqlRequestInput(query: """query LocalGraphqlOps_ping { 
 ping   
 
 }"""),
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:4000/graphql",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_pingData,
          List<GraphqlError>>> pingGraphqlMock(
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_pingData,
              List<GraphqlError>>
          mock) {
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_pingData,
                List<GraphqlError>>>(
        name: "pingGraphql", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_usersData,
          List<GraphqlError>>> grpahqlUsers(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      LocalGraphqlOps_usersData? optimisticResponse,
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_usersData,
              List<GraphqlError>>?
          mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    headers = <String, String>{...headers ?? <String, String>{}};
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_usersData,
                List<GraphqlError>>>(
        name: "grpahqlUsers",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, GraphqlRequestInput<Null>,
                LocalGraphqlOps_usersData, List<GraphqlError>, dynamic>(
            data: GraphqlRequestInput(query: """query LocalGraphqlOps_users { 
 users  {  
 name

tags

          hello {
                   __typename
              ... on Hello1 {
         name
one
       }
      
       ... on Hello2 {
         name
two
       }
      
     
          }
        
          helloa {
                   __typename
              ... on Hello1 {
         name
one
       }
      
       ... on Hello2 {
         name
two
       }
      
     
          }
        
address {
             street
zip
country {
             code
name
          } 
          }  }

 }"""),
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:4000/graphql",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_usersData,
          List<GraphqlError>>> grpahqlUsersMock(
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_usersData,
              List<GraphqlError>>
          mock) {
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_usersData,
                List<GraphqlError>>>(
        name: "grpahqlUsers", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<
      HttpField<
          GraphqlRequestInput<LocalGraphqlOps_chnageNameWithVariablesVariables>,
          LocalGraphqlOps_chnageNameWithVariablesData,
          List<GraphqlError>>> graphqlChangeVariable(
      {required LocalGraphqlOps_chnageNameWithVariablesVariables variables,
      bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      LocalGraphqlOps_chnageNameWithVariablesData? optimisticResponse,
      HttpField<
              GraphqlRequestInput<
                  LocalGraphqlOps_chnageNameWithVariablesVariables>,
              LocalGraphqlOps_chnageNameWithVariablesData,
              List<GraphqlError>>?
          mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    headers = <String, String>{...headers ?? <String, String>{}};
    return Action<
            HttpField<
                GraphqlRequestInput<
                    LocalGraphqlOps_chnageNameWithVariablesVariables>,
                LocalGraphqlOps_chnageNameWithVariablesData,
                List<GraphqlError>>>(
        name: "graphqlChangeVariable",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<
                Null,
                Null,
                GraphqlRequestInput<
                    LocalGraphqlOps_chnageNameWithVariablesVariables>,
                LocalGraphqlOps_chnageNameWithVariablesData,
                List<GraphqlError>,
                dynamic>(
            data: GraphqlRequestInput(
                query:
                    """mutation LocalGraphqlOps_chnageNameWithVariables(\$name: String!) { 
 changeName(name: \$name)   
 
 }""",
                variables: variables),
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:4000/graphql",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<
      HttpField<
          GraphqlRequestInput<LocalGraphqlOps_chnageNameWithVariablesVariables>,
          LocalGraphqlOps_chnageNameWithVariablesData,
          List<GraphqlError>>> graphqlChangeVariableMock(
      HttpField<
              GraphqlRequestInput<
                  LocalGraphqlOps_chnageNameWithVariablesVariables>,
              LocalGraphqlOps_chnageNameWithVariablesData,
              List<GraphqlError>>
          mock) {
    return Action<
            HttpField<
                GraphqlRequestInput<
                    LocalGraphqlOps_chnageNameWithVariablesVariables>,
                LocalGraphqlOps_chnageNameWithVariablesData,
                List<GraphqlError>>>(
        name: "graphqlChangeVariable", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_errorQData,
          List<GraphqlError>>> graphqlError(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      LocalGraphqlOps_errorQData? optimisticResponse,
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_errorQData,
              List<GraphqlError>>?
          mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    headers = <String, String>{...headers ?? <String, String>{}};
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_errorQData,
                List<GraphqlError>>>(
        name: "graphqlError",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, GraphqlRequestInput<Null>,
                LocalGraphqlOps_errorQData, List<GraphqlError>, dynamic>(
            data: GraphqlRequestInput(query: """query LocalGraphqlOps_errorQ { 
 errorQ   
 
 }"""),
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:4000/graphql",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_errorQData,
          List<GraphqlError>>> graphqlErrorMock(
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_errorQData,
              List<GraphqlError>>
          mock) {
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_errorQData,
                List<GraphqlError>>>(
        name: "graphqlError", type: _SimpleHttp_FullPath, mock: mock);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_addMessageData,
          List<GraphqlError>>> graphqlAddMessage(
      {bool abortable = false,
      bool silent = false,
      bool offline = false,
      Map<String, String>? headers,
      LocalGraphqlOps_addMessageData? optimisticResponse,
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_addMessageData,
              List<GraphqlError>>?
          mock,
      Duration? debounce,
      bool listenSendProgress = false,
      bool listenReceiveProgress = false}) {
    headers = <String, String>{...headers ?? <String, String>{}};
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_addMessageData,
                List<GraphqlError>>>(
        name: "graphqlAddMessage",
        type: _SimpleHttp_FullPath,
        silent: silent,
        http: HttpPayload<Null, Null, GraphqlRequestInput<Null>,
                LocalGraphqlOps_addMessageData, List<GraphqlError>, dynamic>(
            data: GraphqlRequestInput(
                query: """mutation LocalGraphqlOps_addMessage { 
 addMessage(message: "m1")  {  
 text }

 }"""),
            abortable: abortable,
            offline: offline,
            headers: headers,
            optimisticResponse: optimisticResponse,
            url: "http://localhost:4000/graphql",
            method: "POST",
            responseType: HttpResponseType.JSON,
            listenSendProgress: listenSendProgress,
            listenReceiveProgress: listenReceiveProgress),
        debounce: debounce);
  }

  static Action<
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_addMessageData,
          List<GraphqlError>>> graphqlAddMessageMock(
      HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_addMessageData,
              List<GraphqlError>>
          mock) {
    return Action<
            HttpField<GraphqlRequestInput<Null>, LocalGraphqlOps_addMessageData,
                List<GraphqlError>>>(
        name: "graphqlAddMessage", type: _SimpleHttp_FullPath, mock: mock);
  }
}

SimpleHttp SimpleHttp_DS() => SimpleHttp(
    ping: helloPing(),
    json: helloJson(),
    octet: HelloOctet(),
    optFail: OptimisticFail(),
    pinInt: helloJsonTransform(),
    pagination: Pagination(),
    jsPost: JsonPost(),
    fromUpload: FormUpload(),
    uploadProgress: UploadProgress(),
    downloadProgress: DownloadProgress(),
    offlineOp: OfflineOp(),
    pingGraphql: LocalGraphqlOps_ping(),
    grpahqlUsers: LocalGraphqlOps_users(),
    graphqlChangeVariable: LocalGraphqlOps_chnageNameWithVariables(),
    graphqlError: LocalGraphqlOps_errorQ(),
    graphqlAddMessage: LocalGraphqlOps_addMessage());

final SimpleHttpMeta = PStateMeta<
    SimpleHttp>(type: _SimpleHttp_FullPath, ds: SimpleHttp_DS, httpMetaMap: {
  "ping": HttpMeta<Null, Null, Null, String, String, String>(
      responseSerializer: helloPingResponse_SuccessSerializer,
      responseDeserializer: helloPingResponse_SuccessDeserializer),
  "json":
      HttpMeta<Null, Null, Null, helloJsonResponse, String, helloJsonResponse>(
          responseSerializer: helloJsonResponse.toJsonStatic,
          responseDeserializer: helloJsonResponse.fromJsonStatic),
  "octet": HttpMeta<Null, Null, Null, List<int>, String, List<int>>(
      responseSerializer: HelloOctetResponse_SuccessSerializer,
      responseDeserializer: HelloOctetResponse_SuccessDeserializer),
  "optFail": HttpMeta<Null, Null, Null, String, String, String>(
      responseSerializer: OptimisticFailResponse_SuccessSerializer,
      responseDeserializer: OptimisticFailResponse_SuccessDeserializer),
  "pinInt": HttpMeta<Null, Null, Null, helloJsonResponse, String, int>(
      responseSerializer: helloJsonResponse.toJsonStatic,
      transformer: pingTransform,
      responseDeserializer: helloJsonResponse.fromJsonStatic),
  "pagination": HttpMeta<PaginationPathParams, PaginationQueryParams, Null,
          PaginationResponse, String, PaginationResponse>(
      queryParamsSerializer: PaginationQueryParams.toJsonStatic,
      queryParamsDeserializer: PaginationQueryParams.fromJsonStatic,
      pathParamsSerializer: PaginationPathParams.toJsonStatic,
      pathParamsDeserializer: PaginationPathParams.fromJsonStatic,
      responseSerializer: PaginationResponse.toJsonStatic,
      persitDataBetweenFetches: true,
      transformer: paginationTransformer,
      responseDeserializer: PaginationResponse.fromJsonStatic),
  "jsPost": HttpMeta<Null, Null, JsonPostRequestBody, JsonPostResponse, String,
          JsonPostResponse>(
      inputSerializer: JsonPostRequestBodySerializer,
      inputDeserializer: JsonPostRequestBodyDeserializer,
      responseSerializer: JsonPostResponse.toJsonStatic,
      responseDeserializer: JsonPostResponse.fromJsonStatic),
  "fromUpload": HttpMeta<Null, Null, FormUploadRequestBody, FormUploadResponse,
          String, FormUploadResponse>(
      inputSerializer: FormUploadRequestBodySerializer,
      inputDeserializer: FormUploadRequestBodyDeserializer,
      responseSerializer: FormUploadResponse.toJsonStatic,
      responseDeserializer: FormUploadResponse.fromJsonStatic),
  "uploadProgress": HttpMeta<Null, Null, List<int>, UploadProgressResponse,
          String, UploadProgressResponse>(
      inputSerializer: UploadProgressRequestBodySerializer,
      inputDeserializer: UploadProgressRequestBodyDeserializer,
      responseSerializer: UploadProgressResponse.toJsonStatic,
      responseDeserializer: UploadProgressResponse.fromJsonStatic),
  "downloadProgress": HttpMeta<Null, Null, Null, List<int>, String, List<int>>(
      responseSerializer: DownloadProgressResponse_SuccessSerializer,
      responseDeserializer: DownloadProgressResponse_SuccessDeserializer),
  "offlineOp": HttpMeta<Null, Null, Null, String, String, String>(
      responseSerializer: OfflineOpResponse_SuccessSerializer,
      responseDeserializer: OfflineOpResponse_SuccessDeserializer),
  "pingGraphql": HttpMeta<
          Null,
          Null,
          GraphqlRequestInput<Null>,
          LocalGraphqlOps_pingData,
          List<GraphqlError>,
          LocalGraphqlOps_pingData>(
      inputSerializer: GraphqlRequestInput.toJson,
      inputDeserializer: LocalGraphqlOps_pingInputDeserializer,
      responseSerializer: LocalGraphqlOps_pingDataSerializer,
      responseDeserializer: LocalGraphqlOps_pingDataDeserializer),
  "grpahqlUsers": HttpMeta<
          Null,
          Null,
          GraphqlRequestInput<Null>,
          LocalGraphqlOps_usersData,
          List<GraphqlError>,
          LocalGraphqlOps_usersData>(
      inputSerializer: GraphqlRequestInput.toJson,
      inputDeserializer: LocalGraphqlOps_usersInputDeserializer,
      responseSerializer: LocalGraphqlOps_usersDataSerializer,
      responseDeserializer: LocalGraphqlOps_usersDataDeserializer),
  "graphqlChangeVariable": HttpMeta<
          Null,
          Null,
          GraphqlRequestInput<LocalGraphqlOps_chnageNameWithVariablesVariables>,
          LocalGraphqlOps_chnageNameWithVariablesData,
          List<GraphqlError>,
          LocalGraphqlOps_chnageNameWithVariablesData>(
      inputSerializer: GraphqlRequestInput.toJson,
      inputDeserializer:
          LocalGraphqlOps_chnageNameWithVariablesInputDeserializer,
      responseSerializer: LocalGraphqlOps_chnageNameWithVariablesDataSerializer,
      responseDeserializer:
          LocalGraphqlOps_chnageNameWithVariablesDataDeserializer),
  "graphqlError": HttpMeta<
          Null,
          Null,
          GraphqlRequestInput<Null>,
          LocalGraphqlOps_errorQData,
          List<GraphqlError>,
          LocalGraphqlOps_errorQData>(
      inputSerializer: GraphqlRequestInput.toJson,
      inputDeserializer: LocalGraphqlOps_errorQInputDeserializer,
      responseSerializer: LocalGraphqlOps_errorQDataSerializer,
      responseDeserializer: LocalGraphqlOps_errorQDataDeserializer),
  "graphqlAddMessage": HttpMeta<
          Null,
          Null,
          GraphqlRequestInput<Null>,
          LocalGraphqlOps_addMessageData,
          List<GraphqlError>,
          LocalGraphqlOps_addMessageData>(
      inputSerializer: GraphqlRequestInput.toJson,
      inputDeserializer: LocalGraphqlOps_addMessageInputDeserializer,
      responseSerializer: LocalGraphqlOps_addMessageDataSerializer,
      responseDeserializer: LocalGraphqlOps_addMessageDataDeserializer)
});
