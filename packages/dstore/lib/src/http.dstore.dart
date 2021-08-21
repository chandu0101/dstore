// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'http.dart';

// **************************************************************************
// DImmutableGenerator
// **************************************************************************

class HttpField<I, R, E> implements ToMap<HttpField> {
  final R? data;

  final E? error;

  final dynamic? genericError;

  final Map<String, String>? responseHeaders;

  final int? status;

  final HttpProgress? progress;

  final HttpErrorType? errorType;

  final AbortController? abortController;

  final bool optimistic;

  final bool loading;

  final bool completed;

  final bool offline;

  _$HttpFieldCopyWith<I, R, E, HttpField<I, R, E>> get copyWith =>
      __$HttpFieldCopyWithImpl<I, R, E, HttpField<I, R, E>>(this, IdentityFn);

  const HttpField(
      {this.data,
      this.error,
      this.genericError,
      this.responseHeaders,
      this.status,
      this.progress,
      this.errorType,
      this.abortController,
      this.optimistic = false,
      this.loading = false,
      this.completed = false,
      this.offline = false});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is HttpField &&
        o.data == data &&
        o.error == error &&
        o.genericError == genericError &&
        o.responseHeaders == responseHeaders &&
        o.status == status &&
        o.progress == progress &&
        o.errorType == errorType &&
        o.abortController == abortController &&
        o.optimistic == optimistic &&
        o.loading == loading &&
        o.completed == completed &&
        o.offline == offline;
  }

  @override
  int get hashCode =>
      data.hashCode ^
      error.hashCode ^
      genericError.hashCode ^
      responseHeaders.hashCode ^
      status.hashCode ^
      progress.hashCode ^
      errorType.hashCode ^
      abortController.hashCode ^
      optimistic.hashCode ^
      loading.hashCode ^
      completed.hashCode ^
      offline.hashCode;

  Map<String, dynamic> toMap() => <String, dynamic>{
        "data": this.data,
        "error": this.error,
        "genericError": this.genericError,
        "responseHeaders": this.responseHeaders,
        "status": this.status,
        "progress": this.progress,
        "errorType": this.errorType,
        "abortController": this.abortController,
        "optimistic": this.optimistic,
        "loading": this.loading,
        "completed": this.completed,
        "offline": this.offline
      };

  @override
  HttpField copyWithMap(Map<String, dynamic> map) => throw UnimplementedError();

  @override
  String toString() =>
      "HttpField(data: ${this.data}, error: ${this.error}, genericError: ${this.genericError}, responseHeaders: ${this.responseHeaders}, status: ${this.status}, progress: ${this.progress}, errorType: ${this.errorType}, abortController: ${this.abortController}, optimistic: ${this.optimistic}, loading: ${this.loading}, completed: ${this.completed}, offline: ${this.offline})";
}

abstract class $HttpFieldCopyWith<I, R, E, O> {
  factory $HttpFieldCopyWith(
          HttpField<I, R, E> value, O Function(HttpField<I, R, E>) then) =
      _$HttpFieldCopyWithImpl<I, R, E, O>;
  O call(
      {R? data,
      E? error,
      dynamic? genericError,
      Map<String, String>? responseHeaders,
      int? status,
      HttpProgress? progress,
      HttpErrorType? errorType,
      AbortController? abortController,
      bool optimistic,
      bool loading,
      bool completed,
      bool offline});
}

class _$HttpFieldCopyWithImpl<I, R, E, O>
    implements $HttpFieldCopyWith<I, R, E, O> {
  final HttpField<I, R, E> _value;
  final O Function(HttpField<I, R, E>) _then;
  _$HttpFieldCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? data = dimmutable,
      Object? error = dimmutable,
      Object? genericError = dimmutable,
      Object? responseHeaders = dimmutable,
      Object? status = dimmutable,
      Object? progress = dimmutable,
      Object? errorType = dimmutable,
      Object? abortController = dimmutable,
      Object? optimistic = dimmutable,
      Object? loading = dimmutable,
      Object? completed = dimmutable,
      Object? offline = dimmutable}) {
    return _then(_value.copyWith(
        data: data == dimmutable ? _value.data : data as R?,
        error: error == dimmutable ? _value.error : error as E?,
        genericError: genericError == dimmutable
            ? _value.genericError
            : genericError as dynamic?,
        responseHeaders: responseHeaders == dimmutable
            ? _value.responseHeaders
            : responseHeaders as Map<String, String>?,
        status: status == dimmutable ? _value.status : status as int?,
        progress: progress == dimmutable
            ? _value.progress
            : progress as HttpProgress?,
        errorType: errorType == dimmutable
            ? _value.errorType
            : errorType as HttpErrorType?,
        abortController: abortController == dimmutable
            ? _value.abortController
            : abortController as AbortController?,
        optimistic:
            optimistic == dimmutable ? _value.optimistic : optimistic as bool,
        loading: loading == dimmutable ? _value.loading : loading as bool,
        completed:
            completed == dimmutable ? _value.completed : completed as bool,
        offline: offline == dimmutable ? _value.offline : offline as bool));
  }
}

abstract class _$HttpFieldCopyWith<I, R, E, O>
    implements $HttpFieldCopyWith<I, R, E, O> {
  factory _$HttpFieldCopyWith(
          HttpField<I, R, E> value, O Function(HttpField<I, R, E>) then) =
      __$HttpFieldCopyWithImpl<I, R, E, O>;
  O call(
      {R? data,
      E? error,
      dynamic? genericError,
      Map<String, String>? responseHeaders,
      int? status,
      HttpProgress? progress,
      HttpErrorType? errorType,
      AbortController? abortController,
      bool optimistic,
      bool loading,
      bool completed,
      bool offline});
}

class __$HttpFieldCopyWithImpl<I, R, E, O>
    extends _$HttpFieldCopyWithImpl<I, R, E, O>
    implements _$HttpFieldCopyWith<I, R, E, O> {
  __$HttpFieldCopyWithImpl(
      HttpField<I, R, E> _value, O Function(HttpField<I, R, E>) _then)
      : super(_value, (v) => _then(v));

  @override
  HttpField<I, R, E> get _value => super._value;

  @override
  O call(
      {Object? data = dimmutable,
      Object? error = dimmutable,
      Object? genericError = dimmutable,
      Object? responseHeaders = dimmutable,
      Object? status = dimmutable,
      Object? progress = dimmutable,
      Object? errorType = dimmutable,
      Object? abortController = dimmutable,
      Object? optimistic = dimmutable,
      Object? loading = dimmutable,
      Object? completed = dimmutable,
      Object? offline = dimmutable}) {
    return _then(HttpField(
        data: data == dimmutable ? _value.data : data as R?,
        error: error == dimmutable ? _value.error : error as E?,
        genericError: genericError == dimmutable
            ? _value.genericError
            : genericError as dynamic?,
        responseHeaders: responseHeaders == dimmutable
            ? _value.responseHeaders
            : responseHeaders as Map<String, String>?,
        status: status == dimmutable ? _value.status : status as int?,
        progress: progress == dimmutable
            ? _value.progress
            : progress as HttpProgress?,
        errorType: errorType == dimmutable
            ? _value.errorType
            : errorType as HttpErrorType?,
        abortController: abortController == dimmutable
            ? _value.abortController
            : abortController as AbortController?,
        optimistic:
            optimistic == dimmutable ? _value.optimistic : optimistic as bool,
        loading: loading == dimmutable ? _value.loading : loading as bool,
        completed:
            completed == dimmutable ? _value.completed : completed as bool,
        offline: offline == dimmutable ? _value.offline : offline as bool));
  }
}

class HttpMeta<PP, QP, I, R, E, T> {
  final R Function(int status, dynamic resp) responseDeserializer;

  final dynamic Function(int, R)? responseSerializer;

  final Function? transformer;

  final Function? inputSerializer;

  final Future<dynamic> Function(I)? inputStorageSerializer;

  final I Function(dynamic)? inputDeserializer;

  final E Function(int status, dynamic resp)? errorDeserializer;

  final Future<bool> Function(Action)? canProcessOfflineAction;

  final PP Function(dynamic)? pathParamsDeserializer;

  final Map<String, dynamic> Function(dynamic)? pathParamsSerializer;

  final QP Function(dynamic)? queryParamsDeserializer;

  final Map<String, dynamic> Function(dynamic)? queryParamsSerializer;

  final bool persitDataBetweenFetches;

  _$HttpMetaCopyWith<PP, QP, I, R, E, T, HttpMeta<PP, QP, I, R, E, T>>
      get copyWith => __$HttpMetaCopyWithImpl<PP, QP, I, R, E, T,
          HttpMeta<PP, QP, I, R, E, T>>(this, IdentityFn);

  const HttpMeta(
      {required this.responseDeserializer,
      this.responseSerializer,
      this.transformer,
      this.inputSerializer,
      this.inputStorageSerializer,
      this.inputDeserializer,
      this.errorDeserializer,
      this.canProcessOfflineAction,
      this.pathParamsDeserializer,
      this.pathParamsSerializer,
      this.queryParamsDeserializer,
      this.queryParamsSerializer,
      this.persitDataBetweenFetches = false});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is HttpMeta &&
        o.responseDeserializer == responseDeserializer &&
        o.responseSerializer == responseSerializer &&
        o.transformer == transformer &&
        o.inputSerializer == inputSerializer &&
        o.inputStorageSerializer == inputStorageSerializer &&
        o.inputDeserializer == inputDeserializer &&
        o.errorDeserializer == errorDeserializer &&
        o.canProcessOfflineAction == canProcessOfflineAction &&
        o.pathParamsDeserializer == pathParamsDeserializer &&
        o.pathParamsSerializer == pathParamsSerializer &&
        o.queryParamsDeserializer == queryParamsDeserializer &&
        o.queryParamsSerializer == queryParamsSerializer &&
        o.persitDataBetweenFetches == persitDataBetweenFetches;
  }

  @override
  int get hashCode =>
      responseDeserializer.hashCode ^
      responseSerializer.hashCode ^
      transformer.hashCode ^
      inputSerializer.hashCode ^
      inputStorageSerializer.hashCode ^
      inputDeserializer.hashCode ^
      errorDeserializer.hashCode ^
      canProcessOfflineAction.hashCode ^
      pathParamsDeserializer.hashCode ^
      pathParamsSerializer.hashCode ^
      queryParamsDeserializer.hashCode ^
      queryParamsSerializer.hashCode ^
      persitDataBetweenFetches.hashCode;

  @override
  String toString() =>
      "HttpMeta(responseDeserializer: ${this.responseDeserializer}, responseSerializer: ${this.responseSerializer}, transformer: ${this.transformer}, inputSerializer: ${this.inputSerializer}, inputStorageSerializer: ${this.inputStorageSerializer}, inputDeserializer: ${this.inputDeserializer}, errorDeserializer: ${this.errorDeserializer}, canProcessOfflineAction: ${this.canProcessOfflineAction}, pathParamsDeserializer: ${this.pathParamsDeserializer}, pathParamsSerializer: ${this.pathParamsSerializer}, queryParamsDeserializer: ${this.queryParamsDeserializer}, queryParamsSerializer: ${this.queryParamsSerializer}, persitDataBetweenFetches: ${this.persitDataBetweenFetches})";
}

abstract class $HttpMetaCopyWith<PP, QP, I, R, E, T, O> {
  factory $HttpMetaCopyWith(HttpMeta<PP, QP, I, R, E, T> value,
          O Function(HttpMeta<PP, QP, I, R, E, T>) then) =
      _$HttpMetaCopyWithImpl<PP, QP, I, R, E, T, O>;
  O call(
      {R Function(int status, dynamic resp) responseDeserializer,
      dynamic Function(int, R)? responseSerializer,
      Function? transformer,
      Function? inputSerializer,
      Future<dynamic> Function(I)? inputStorageSerializer,
      I Function(dynamic)? inputDeserializer,
      E Function(int status, dynamic resp)? errorDeserializer,
      Future<bool> Function(Action)? canProcessOfflineAction,
      PP Function(dynamic)? pathParamsDeserializer,
      Map<String, dynamic> Function(dynamic)? pathParamsSerializer,
      QP Function(dynamic)? queryParamsDeserializer,
      Map<String, dynamic> Function(dynamic)? queryParamsSerializer,
      bool persitDataBetweenFetches});
}

class _$HttpMetaCopyWithImpl<PP, QP, I, R, E, T, O>
    implements $HttpMetaCopyWith<PP, QP, I, R, E, T, O> {
  final HttpMeta<PP, QP, I, R, E, T> _value;
  final O Function(HttpMeta<PP, QP, I, R, E, T>) _then;
  _$HttpMetaCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? responseDeserializer = dimmutable,
      Object? responseSerializer = dimmutable,
      Object? transformer = dimmutable,
      Object? inputSerializer = dimmutable,
      Object? inputStorageSerializer = dimmutable,
      Object? inputDeserializer = dimmutable,
      Object? errorDeserializer = dimmutable,
      Object? canProcessOfflineAction = dimmutable,
      Object? pathParamsDeserializer = dimmutable,
      Object? pathParamsSerializer = dimmutable,
      Object? queryParamsDeserializer = dimmutable,
      Object? queryParamsSerializer = dimmutable,
      Object? persitDataBetweenFetches = dimmutable}) {
    return _then(_value.copyWith(
        responseDeserializer: responseDeserializer == dimmutable
            ? _value.responseDeserializer
            : responseDeserializer as R Function(int status, dynamic resp),
        responseSerializer: responseSerializer == dimmutable
            ? _value.responseSerializer
            : responseSerializer as dynamic Function(int, R)?,
        transformer: transformer == dimmutable
            ? _value.transformer
            : transformer as Function?,
        inputSerializer: inputSerializer == dimmutable
            ? _value.inputSerializer
            : inputSerializer as Function?,
        inputStorageSerializer: inputStorageSerializer == dimmutable
            ? _value.inputStorageSerializer
            : inputStorageSerializer as Future<dynamic> Function(I)?,
        inputDeserializer: inputDeserializer == dimmutable
            ? _value.inputDeserializer
            : inputDeserializer as I Function(dynamic)?,
        errorDeserializer: errorDeserializer == dimmutable
            ? _value.errorDeserializer
            : errorDeserializer as E Function(int status, dynamic resp)?,
        canProcessOfflineAction: canProcessOfflineAction == dimmutable
            ? _value.canProcessOfflineAction
            : canProcessOfflineAction as Future<bool> Function(Action)?,
        pathParamsDeserializer: pathParamsDeserializer == dimmutable
            ? _value.pathParamsDeserializer
            : pathParamsDeserializer as PP Function(dynamic)?,
        pathParamsSerializer: pathParamsSerializer == dimmutable
            ? _value.pathParamsSerializer
            : pathParamsSerializer as Map<String, dynamic> Function(dynamic)?,
        queryParamsDeserializer: queryParamsDeserializer == dimmutable
            ? _value.queryParamsDeserializer
            : queryParamsDeserializer as QP Function(dynamic)?,
        queryParamsSerializer: queryParamsSerializer == dimmutable
            ? _value.queryParamsSerializer
            : queryParamsSerializer as Map<String, dynamic> Function(dynamic)?,
        persitDataBetweenFetches: persitDataBetweenFetches == dimmutable
            ? _value.persitDataBetweenFetches
            : persitDataBetweenFetches as bool));
  }
}

abstract class _$HttpMetaCopyWith<PP, QP, I, R, E, T, O>
    implements $HttpMetaCopyWith<PP, QP, I, R, E, T, O> {
  factory _$HttpMetaCopyWith(HttpMeta<PP, QP, I, R, E, T> value,
          O Function(HttpMeta<PP, QP, I, R, E, T>) then) =
      __$HttpMetaCopyWithImpl<PP, QP, I, R, E, T, O>;
  O call(
      {R Function(int status, dynamic resp) responseDeserializer,
      dynamic Function(int, R)? responseSerializer,
      Function? transformer,
      Function? inputSerializer,
      Future<dynamic> Function(I)? inputStorageSerializer,
      I Function(dynamic)? inputDeserializer,
      E Function(int status, dynamic resp)? errorDeserializer,
      Future<bool> Function(Action)? canProcessOfflineAction,
      PP Function(dynamic)? pathParamsDeserializer,
      Map<String, dynamic> Function(dynamic)? pathParamsSerializer,
      QP Function(dynamic)? queryParamsDeserializer,
      Map<String, dynamic> Function(dynamic)? queryParamsSerializer,
      bool persitDataBetweenFetches});
}

class __$HttpMetaCopyWithImpl<PP, QP, I, R, E, T, O>
    extends _$HttpMetaCopyWithImpl<PP, QP, I, R, E, T, O>
    implements _$HttpMetaCopyWith<PP, QP, I, R, E, T, O> {
  __$HttpMetaCopyWithImpl(HttpMeta<PP, QP, I, R, E, T> _value,
      O Function(HttpMeta<PP, QP, I, R, E, T>) _then)
      : super(_value, (v) => _then(v));

  @override
  HttpMeta<PP, QP, I, R, E, T> get _value => super._value;

  @override
  O call(
      {Object? responseDeserializer = dimmutable,
      Object? responseSerializer = dimmutable,
      Object? transformer = dimmutable,
      Object? inputSerializer = dimmutable,
      Object? inputStorageSerializer = dimmutable,
      Object? inputDeserializer = dimmutable,
      Object? errorDeserializer = dimmutable,
      Object? canProcessOfflineAction = dimmutable,
      Object? pathParamsDeserializer = dimmutable,
      Object? pathParamsSerializer = dimmutable,
      Object? queryParamsDeserializer = dimmutable,
      Object? queryParamsSerializer = dimmutable,
      Object? persitDataBetweenFetches = dimmutable}) {
    return _then(HttpMeta(
        responseDeserializer: responseDeserializer == dimmutable
            ? _value.responseDeserializer
            : responseDeserializer as R Function(int status, dynamic resp),
        responseSerializer: responseSerializer == dimmutable
            ? _value.responseSerializer
            : responseSerializer as dynamic Function(int, R)?,
        transformer: transformer == dimmutable
            ? _value.transformer
            : transformer as Function?,
        inputSerializer: inputSerializer == dimmutable
            ? _value.inputSerializer
            : inputSerializer as Function?,
        inputStorageSerializer: inputStorageSerializer == dimmutable
            ? _value.inputStorageSerializer
            : inputStorageSerializer as Future<dynamic> Function(I)?,
        inputDeserializer: inputDeserializer == dimmutable
            ? _value.inputDeserializer
            : inputDeserializer as I Function(dynamic)?,
        errorDeserializer: errorDeserializer == dimmutable
            ? _value.errorDeserializer
            : errorDeserializer as E Function(int status, dynamic resp)?,
        canProcessOfflineAction: canProcessOfflineAction == dimmutable
            ? _value.canProcessOfflineAction
            : canProcessOfflineAction as Future<bool> Function(Action)?,
        pathParamsDeserializer: pathParamsDeserializer == dimmutable
            ? _value.pathParamsDeserializer
            : pathParamsDeserializer as PP Function(dynamic)?,
        pathParamsSerializer: pathParamsSerializer == dimmutable
            ? _value.pathParamsSerializer
            : pathParamsSerializer as Map<String, dynamic> Function(dynamic)?,
        queryParamsDeserializer: queryParamsDeserializer == dimmutable
            ? _value.queryParamsDeserializer
            : queryParamsDeserializer as QP Function(dynamic)?,
        queryParamsSerializer: queryParamsSerializer == dimmutable
            ? _value.queryParamsSerializer
            : queryParamsSerializer as Map<String, dynamic> Function(dynamic)?,
        persitDataBetweenFetches: persitDataBetweenFetches == dimmutable
            ? _value.persitDataBetweenFetches
            : persitDataBetweenFetches as bool));
  }
}

class HttpPayload<PP, QP, I, R, E, T> {
  final String url;

  final I? data;

  final String method;

  final HttpResponseType responseType;

  final R? optimisticResponse;

  final int? optimisticHttpStatus;

  final bool offline;

  final Map<String, String>? headers;

  final QP? queryParams;

  final PP? pathParams;

  final int? sendTimeout;

  final int? receiveTieout;

  final bool listenSendProgress;

  final bool listenReceiveProgress;

  final bool abortable;

  _$HttpPayloadCopyWith<PP, QP, I, R, E, T, HttpPayload<PP, QP, I, R, E, T>>
      get copyWith => __$HttpPayloadCopyWithImpl<PP, QP, I, R, E, T,
          HttpPayload<PP, QP, I, R, E, T>>(this, IdentityFn);

  const HttpPayload(
      {required this.url,
      this.data,
      required this.method,
      required this.responseType,
      this.optimisticResponse,
      this.optimisticHttpStatus,
      this.offline = false,
      this.headers,
      this.queryParams,
      this.pathParams,
      this.sendTimeout,
      this.receiveTieout,
      this.listenSendProgress = false,
      this.listenReceiveProgress = false,
      this.abortable = false});

  static HttpPayload fromJson<PP, QP, I, R, E, T>(
      Map<String, dynamic> map, HttpMeta<PP, QP, I, R, E, T> meta) {
    final url = map["url"] as String;
    final method = map["method"] as String;
    final responseType =
        HttpResponseTypeExt.fromValue(map["responseType"] as String)!;
    final dataObj = map["data"] as Map<String, dynamic>?;
    I? data;
    if (dataObj != null) {
      if (meta.inputDeserializer == null) {
        throw ArgumentError.value(
            "You should provide inputDeserializer for http field");
      }
      data = meta.inputDeserializer!(data);
    }
    var optimisticResponse = map["optimisticResponse"] as R?;
    if (optimisticResponse != null) {
      optimisticResponse = meta.responseDeserializer(200, optimisticResponse);
    }
    final inputTypeS = map["inputType"] as String?;
    HttpInputType? inputType;
    if (inputTypeS != null) {
      inputType = HttpInputTypeExt.fromValue(inputTypeS);
    }
    final headers = map["headers"] as Map<String, String>?;
    var queryParamsObj = map["queryParams"] as Map<String, dynamic>?;
    QP? queryParams;
    if (queryParamsObj != null) {
      if (meta.queryParamsDeserializer == null) {
        throw ArgumentError.value(
            "You should specify queryParamsDeserializer in HttpMeta   to deserialize payload");
      }
      queryParams = meta.queryParamsDeserializer!(queryParams);
    }
    final pathParamsObj = map["pathParams"] as Map<String, dynamic>?;
    PP? pathParams;
    if (pathParamsObj != null) {
      if (meta.pathParamsDeserializer == null) {
        throw ArgumentError.value(
            "You should specify pathParamsDeserializer in HttpMeta to deserialize payload");
      }
      pathParams = meta.pathParamsDeserializer!(pathParamsObj);
    }
    final sendTimeout = map["sendTimeout"] as int?;
    final receiveTieout = map["receiveTieout"] as int?;
    final abortable = map["abortable"] as bool;
    return HttpPayload<PP, QP, I, R, E, T>(
        url: url,
        method: method,
        responseType: responseType,
        data: data,
        optimisticResponse: optimisticResponse,
        headers: headers,
        queryParams: queryParams,
        pathParams: pathParams,
        sendTimeout: sendTimeout,
        receiveTieout: receiveTieout,
        abortable: abortable);
  }

  Map<String, dynamic> toJson(HttpMeta meta) {
    final map = <String, dynamic>{};
    map["url"] = url;
    map["method"] = method;
    if (data != null) {
      if (meta.inputSerializer == null) {
        throw ArgumentError.value(
            "You should provide inputSerializer for http field");
      }
      map["data"] = meta.inputSerializer!(data);
    }
    map["responseType"] = responseType.value;
    if (optimisticResponse != null && optimisticHttpStatus != null) {
      if (meta.responseSerializer == null) {
        throw ArgumentError.value(
            "You should provide responseSerializer for http field");
      }
      map["optimisticResponse"] =
          meta.responseSerializer!(optimisticHttpStatus!, optimisticResponse);
    }
    if (headers != null) {
      map["headers"] = headers;
    }
    if (headers != null) {
      map["queryParams"] = queryParams;
    }
    if (sendTimeout != null) {
      map["sendTimeout"] = sendTimeout;
    }
    if (receiveTieout != null) {
      map["receiveTieout"] = receiveTieout;
    }
    if (queryParams != null) {
      if (meta.queryParamsSerializer == null) {
        throw ArgumentError.value(
            "You should provide queryParamsSerializer in HttpMeta to serialize payload");
      }
      map["queryParams"] = meta.queryParamsSerializer!(queryParams);
    }
    if (pathParams != null) {
      if (meta.pathParamsSerializer == null) {
        throw ArgumentError.value(
            "You should provide pathParamsSerializer in HttpMeta to serialize payload");
      }
      map["pathParams"] = meta.pathParamsSerializer!(pathParams);
    }
    map["abortable"] = abortable;
    return map;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is HttpPayload &&
        o.url == url &&
        o.data == data &&
        o.method == method &&
        o.responseType == responseType &&
        o.optimisticResponse == optimisticResponse &&
        o.optimisticHttpStatus == optimisticHttpStatus &&
        o.offline == offline &&
        o.headers == headers &&
        o.queryParams == queryParams &&
        o.pathParams == pathParams &&
        o.sendTimeout == sendTimeout &&
        o.receiveTieout == receiveTieout &&
        o.listenSendProgress == listenSendProgress &&
        o.listenReceiveProgress == listenReceiveProgress &&
        o.abortable == abortable;
  }

  @override
  int get hashCode =>
      url.hashCode ^
      data.hashCode ^
      method.hashCode ^
      responseType.hashCode ^
      optimisticResponse.hashCode ^
      optimisticHttpStatus.hashCode ^
      offline.hashCode ^
      headers.hashCode ^
      queryParams.hashCode ^
      pathParams.hashCode ^
      sendTimeout.hashCode ^
      receiveTieout.hashCode ^
      listenSendProgress.hashCode ^
      listenReceiveProgress.hashCode ^
      abortable.hashCode;

  @override
  String toString() =>
      "HttpPayload(url: ${this.url}, data: ${this.data}, method: ${this.method}, responseType: ${this.responseType}, optimisticResponse: ${this.optimisticResponse}, optimisticHttpStatus: ${this.optimisticHttpStatus}, offline: ${this.offline}, headers: ${this.headers}, queryParams: ${this.queryParams}, pathParams: ${this.pathParams}, sendTimeout: ${this.sendTimeout}, receiveTieout: ${this.receiveTieout}, listenSendProgress: ${this.listenSendProgress}, listenReceiveProgress: ${this.listenReceiveProgress}, abortable: ${this.abortable})";
}

abstract class $HttpPayloadCopyWith<PP, QP, I, R, E, T, O> {
  factory $HttpPayloadCopyWith(HttpPayload<PP, QP, I, R, E, T> value,
          O Function(HttpPayload<PP, QP, I, R, E, T>) then) =
      _$HttpPayloadCopyWithImpl<PP, QP, I, R, E, T, O>;
  O call(
      {String url,
      I? data,
      String method,
      HttpResponseType responseType,
      R? optimisticResponse,
      int? optimisticHttpStatus,
      bool offline,
      Map<String, String>? headers,
      QP? queryParams,
      PP? pathParams,
      int? sendTimeout,
      int? receiveTieout,
      bool listenSendProgress,
      bool listenReceiveProgress,
      bool abortable});
}

class _$HttpPayloadCopyWithImpl<PP, QP, I, R, E, T, O>
    implements $HttpPayloadCopyWith<PP, QP, I, R, E, T, O> {
  final HttpPayload<PP, QP, I, R, E, T> _value;
  final O Function(HttpPayload<PP, QP, I, R, E, T>) _then;
  _$HttpPayloadCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? url = dimmutable,
      Object? data = dimmutable,
      Object? method = dimmutable,
      Object? responseType = dimmutable,
      Object? optimisticResponse = dimmutable,
      Object? optimisticHttpStatus = dimmutable,
      Object? offline = dimmutable,
      Object? headers = dimmutable,
      Object? queryParams = dimmutable,
      Object? pathParams = dimmutable,
      Object? sendTimeout = dimmutable,
      Object? receiveTieout = dimmutable,
      Object? listenSendProgress = dimmutable,
      Object? listenReceiveProgress = dimmutable,
      Object? abortable = dimmutable}) {
    return _then(_value.copyWith(
        url: url == dimmutable ? _value.url : url as String,
        data: data == dimmutable ? _value.data : data as I?,
        method: method == dimmutable ? _value.method : method as String,
        responseType: responseType == dimmutable
            ? _value.responseType
            : responseType as HttpResponseType,
        optimisticResponse: optimisticResponse == dimmutable
            ? _value.optimisticResponse
            : optimisticResponse as R?,
        optimisticHttpStatus: optimisticHttpStatus == dimmutable
            ? _value.optimisticHttpStatus
            : optimisticHttpStatus as int?,
        offline: offline == dimmutable ? _value.offline : offline as bool,
        headers: headers == dimmutable
            ? _value.headers
            : headers as Map<String, String>?,
        queryParams:
            queryParams == dimmutable ? _value.queryParams : queryParams as QP?,
        pathParams:
            pathParams == dimmutable ? _value.pathParams : pathParams as PP?,
        sendTimeout: sendTimeout == dimmutable
            ? _value.sendTimeout
            : sendTimeout as int?,
        receiveTieout: receiveTieout == dimmutable
            ? _value.receiveTieout
            : receiveTieout as int?,
        listenSendProgress: listenSendProgress == dimmutable
            ? _value.listenSendProgress
            : listenSendProgress as bool,
        listenReceiveProgress: listenReceiveProgress == dimmutable
            ? _value.listenReceiveProgress
            : listenReceiveProgress as bool,
        abortable:
            abortable == dimmutable ? _value.abortable : abortable as bool));
  }
}

abstract class _$HttpPayloadCopyWith<PP, QP, I, R, E, T, O>
    implements $HttpPayloadCopyWith<PP, QP, I, R, E, T, O> {
  factory _$HttpPayloadCopyWith(HttpPayload<PP, QP, I, R, E, T> value,
          O Function(HttpPayload<PP, QP, I, R, E, T>) then) =
      __$HttpPayloadCopyWithImpl<PP, QP, I, R, E, T, O>;
  O call(
      {String url,
      I? data,
      String method,
      HttpResponseType responseType,
      R? optimisticResponse,
      int? optimisticHttpStatus,
      bool offline,
      Map<String, String>? headers,
      QP? queryParams,
      PP? pathParams,
      int? sendTimeout,
      int? receiveTieout,
      bool listenSendProgress,
      bool listenReceiveProgress,
      bool abortable});
}

class __$HttpPayloadCopyWithImpl<PP, QP, I, R, E, T, O>
    extends _$HttpPayloadCopyWithImpl<PP, QP, I, R, E, T, O>
    implements _$HttpPayloadCopyWith<PP, QP, I, R, E, T, O> {
  __$HttpPayloadCopyWithImpl(HttpPayload<PP, QP, I, R, E, T> _value,
      O Function(HttpPayload<PP, QP, I, R, E, T>) _then)
      : super(_value, (v) => _then(v));

  @override
  HttpPayload<PP, QP, I, R, E, T> get _value => super._value;

  @override
  O call(
      {Object? url = dimmutable,
      Object? data = dimmutable,
      Object? method = dimmutable,
      Object? responseType = dimmutable,
      Object? optimisticResponse = dimmutable,
      Object? optimisticHttpStatus = dimmutable,
      Object? offline = dimmutable,
      Object? headers = dimmutable,
      Object? queryParams = dimmutable,
      Object? pathParams = dimmutable,
      Object? sendTimeout = dimmutable,
      Object? receiveTieout = dimmutable,
      Object? listenSendProgress = dimmutable,
      Object? listenReceiveProgress = dimmutable,
      Object? abortable = dimmutable}) {
    return _then(HttpPayload(
        url: url == dimmutable ? _value.url : url as String,
        data: data == dimmutable ? _value.data : data as I?,
        method: method == dimmutable ? _value.method : method as String,
        responseType: responseType == dimmutable
            ? _value.responseType
            : responseType as HttpResponseType,
        optimisticResponse: optimisticResponse == dimmutable
            ? _value.optimisticResponse
            : optimisticResponse as R?,
        optimisticHttpStatus: optimisticHttpStatus == dimmutable
            ? _value.optimisticHttpStatus
            : optimisticHttpStatus as int?,
        offline: offline == dimmutable ? _value.offline : offline as bool,
        headers: headers == dimmutable
            ? _value.headers
            : headers as Map<String, String>?,
        queryParams:
            queryParams == dimmutable ? _value.queryParams : queryParams as QP?,
        pathParams:
            pathParams == dimmutable ? _value.pathParams : pathParams as PP?,
        sendTimeout: sendTimeout == dimmutable
            ? _value.sendTimeout
            : sendTimeout as int?,
        receiveTieout: receiveTieout == dimmutable
            ? _value.receiveTieout
            : receiveTieout as int?,
        listenSendProgress: listenSendProgress == dimmutable
            ? _value.listenSendProgress
            : listenSendProgress as bool,
        listenReceiveProgress: listenReceiveProgress == dimmutable
            ? _value.listenReceiveProgress
            : listenReceiveProgress as bool,
        abortable:
            abortable == dimmutable ? _value.abortable : abortable as bool));
  }
}
