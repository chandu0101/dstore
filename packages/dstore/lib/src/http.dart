import 'package:collection/collection.dart';
import 'package:dstore/dstore.dart';
import 'package:dstore_annotation/dstore_annotation.dart';

part "http.dstore.dart";

mixin EmptyMixin {}

class Stuff<T> {
  T value;
  Stuff(this.value);
}

abstract class AbortController {
  void abort();
}

class HttpProgress {
  final int current;
  final int total;

  HttpProgress({required this.current, required this.total});

  @override
  String toString() => 'HttpProgress(current: $current, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HttpProgress &&
        other.current == current &&
        other.total == total;
  }

  @override
  int get hashCode => current.hashCode ^ total.hashCode;
}

@DImmutable(toMap: true)
void $_HttpField<I, R, E>(
    R? data,
    E? error, // always check for error type is null or not to find error is there or not ,in case of cors errors error will be null but errorType will not be null
    dynamic? genericError,
    Map<String, String>? responseHeaders,
    int? status,
    HttpProgress? progress,
    HttpErrorType? errorType,
    AbortController? abortController,
    {bool optimistic = false,
    bool loading = false,
    bool completed = false,
    bool offline = false}) {}

@DImmutable()
class $_HttpMeta<PP, QP, I, R, E, T> {
  late R Function(int status, dynamic resp) responseDeserializer;
  dynamic Function(int, R)? responseSerializer;
  Function? transformer;
  Function? inputSerializer;
  Future<dynamic> Function(I)? inputStorageSerializer;
  I Function(dynamic)? inputDeserializer;
  E Function(int status, dynamic resp)? errorDeserializer;
  Future<bool> Function(Action)? canProcessOfflineAction;
  PP Function(dynamic)? pathParamsDeserializer;
  Map<String, dynamic> Function(dynamic)? pathParamsSerializer;
  QP Function(dynamic)? queryParamsDeserializer;
  Map<String, dynamic> Function(dynamic)? queryParamsSerializer;
  bool persitDataBetweenFetches = false;
}

@DImmutable()
@optionalTypeArgs
class $_HttpPayload<PP, QP, I, R, E, T> {
  late String url;
  I? data;
  late String method;
  late HttpResponseType responseType;
  late R? optimisticResponse;
  int? optimisticHttpStatus;
  bool offline = false;
  Map<String, String>? headers;
  QP? queryParams;
  PP? pathParams;
  int? sendTimeout;
  int? receiveTieout;
  bool listenSendProgress = false;
  bool listenReceiveProgress = false;
  bool abortable = false;

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
    // if (inputType != null) {
    //   map["inputType"] = inputType!.value;
    // }
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
}

class GlobalHttpOptions {
  Map<String, String> headers;

  GlobalHttpOptions({this.headers = const <String, String>{}});
}
