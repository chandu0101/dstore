import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dstore/dstore.dart';

class _DioAbort extends AbortController {
  final CancelToken token;
  _DioAbort(this.token);
  @override
  void abort() {
    token.cancel();
  }
}

Options _getOptions(
    HttpPayload payload, DioMiddlewareOptions? middlewareOptions) {
  final url = payload.url;
  GlobalHttpOptions? go;
  if (middlewareOptions != null) {
    for (final me in middlewareOptions.urlOptions.entries) {
      if (url.startsWith(me.key)) {
        go = me.value();
      }
    }
  }
  ResponseType responseType;
  switch (payload.responseType) {
    case HttpResponseType.JSON:
      responseType = ResponseType.json;
      break;
    case HttpResponseType.STRING:
      responseType = ResponseType.plain;
      break;
    case HttpResponseType.BYTES:
      responseType = ResponseType.bytes;
      break;
    case HttpResponseType.STREAM:
      responseType = ResponseType.stream;
      break;
  }
  final headers = <String, dynamic>{};
  if (go?.headers != null) {
    headers.addAll(go!.headers);
  }
  headers.addAll(payload.headers ?? <String, String>{});
  var method = payload.method;
  if (payload.data is GraphqlRequestInput) {
    final greq = payload.data as GraphqlRequestInput;
    if (greq.extensions != null &&
        greq.useGetForPersitent &&
        greq.variables == null) {
      method = "GET";
    }
  }
  return Options(
      method: method,
      headers: headers,
      responseType: responseType,
      sendTimeout: payload.sendTimeout,
      receiveTimeout: payload.receiveTieout);
}

void _handleDioError(
    {required DioError e, required Action action, required Store store}) {
  print("handling dio Error $e");
  final psm = store.getPStateMetaFromAction(action);
  final payload = action.http!;
  final meta = psm.httpMetaMap?[action.name];
  var field = store.getFieldFromAction(action) as HttpField;
  final persistDataBetweenFetches = meta?.persitDataBetweenFetches ?? false;
  dynamic error;
  late HttpErrorType errorType;
  switch (e.type) {
    case DioErrorType.connectTimeout:
      errorType = HttpErrorType.ConnectTimeout;
      break;
    case DioErrorType.sendTimeout:
      errorType = HttpErrorType.SendTimeout;

      break;
    case DioErrorType.receiveTimeout:
      errorType = HttpErrorType.ReceiveTimeout;
      break;
    case DioErrorType.response:
      if (e.response != null) {
        dynamic re = e.response!.data;
        print("Response Error $re");
        if (meta?.errorDeserializer != null) {
          re = meta?.errorDeserializer!(e.response!.statusCode ?? 500, re);
        }
        error = re;
      } else {
        error = null;
      }

      errorType = HttpErrorType.Response;

      break;
    case DioErrorType.cancel:
      errorType = HttpErrorType.Aborted;
      break;

    default:
      errorType = HttpErrorType.Default;
      break;
  }
  if (payload.offline &&
      (errorType == HttpErrorType.Default ||
          errorType == HttpErrorType.ConnectTimeout)) {
    store.addOfflineAction(action);
    store.dispatch(action.copyWith(
        offlinedAt: DateTime.now(),
        internal: ActionInternal(
            processed: true,
            type: ActionInternalType.FIELD,
            data: field.copyWith(
                loading: false,
                offline: true,
                error: null,
                completed: true,
                data: persistDataBetweenFetches ? field.data : null))));
  } else {
    final c = field.copyWith(
        error: error,
        errorType: errorType,
        loading: false,
        offline: false,
        completed: true,
        data: persistDataBetweenFetches ? field.data : null);
    dynamic ef;
    if (meta?.transformer != null) {
      ef = meta?.transformer!(c, null);
    } else {
      ef = c;
    }
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true, type: ActionInternalType.FIELD, data: ef)));
  }
}

String _getUrlFromPayload({required Action action, required HttpMeta? meta}) {
  final payload = action.http!;
  var result = payload.url;
  final dynamic queryParams = payload.queryParams;
  final dynamic pathParams = payload.pathParams;
  if (queryParams != null || pathParams != null) {
    if (pathParams != null) {
      if (meta?.pathParamsSerializer == null) {
        throw ArgumentError.value(
            "pathParamsSerializer is missing in HttpMeta for action :  ${action.id}");
      }
      final pp = meta!.pathParamsSerializer!(pathParams);
      pp.forEach((key, dynamic value) {
        result = result.replaceFirst('{${key}}', value.toString());
      });
    }
    if (queryParams != null) {
      if (meta?.queryParamsSerializer == null) {
        throw ArgumentError.value(
            "queryParamsSerializer is missing in HttpMeta for action :  ${action.id}");
      }
      final qp = meta!.queryParamsSerializer!(queryParams);
      final uri = Uri(path: result, queryParameters: qp);
      result = "$result?${uri.query}";
    }
  }
  return result;
}

Future<bool> _canProcessHtpAction(
    {required HttpMeta? meta, required Action action}) async {
  if (action.offlinedAt != null && meta?.canProcessOfflineAction != null) {
    return meta!.canProcessOfflineAction!(action);
  } else {
    return true;
  }
}

void _processHttpAction(DioMiddlewareOptions? middlewareOptions, Store store,
    Action action, Dio dio) async {
  final psm = store.getPStateMetaFromAction(action);
  final payload = action.http!;
  final meta = psm.httpMetaMap?[action.name];
  final field = store.getFieldFromAction(action) as HttpField;

  final canProcess = await _canProcessHtpAction(meta: meta, action: action);
  if (!canProcess) {
    print(
        "Action $action is skipped because its blocked by offline can process  action");
    return;
  }
  final persistDataBetweenFetches = meta?.persitDataBetweenFetches ?? false;
  action = action.copyWith(offlinedAt: null);
  CancelToken? cancelToken;
  AbortController? abortController;
  if (payload.abortable) {
    cancelToken = CancelToken();
    abortController = _DioAbort(cancelToken);
  }
  final options = _getOptions(payload, middlewareOptions);
  if (payload.optimisticResponse != null) {
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true,
            type: ActionInternalType.FIELD,
            data: field.copyWith(
              error: null,
              completed: false,
              data: payload.optimisticResponse,
              abortController: abortController,
              optimistic: true,
            ))));
  } else {
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true,
            type: ActionInternalType.FIELD,
            data: field.copyWith(
                loading: true,
                completed: false,
                error: null,
                offline: false,
                optimistic: false,
                abortController: abortController,
                data: persistDataBetweenFetches ? field.data : null))));
  }
  late final Response? response;
  try {
    var url = _getUrlFromPayload(action: action, meta: meta);
    dynamic data = payload.data;
    if (data != null && meta?.inputSerializer != null) {
      data = meta?.inputSerializer!(data);
    }
    if (payload.data is GraphqlRequestInput) {
      final greq = payload.data as GraphqlRequestInput;
      if (greq.extensions != null) {
        if (greq.useGetForPersitent && greq.variables == null) {
          url = "$url?extensions=${jsonEncode(greq.extensions)}";
          data = null;
        } else {
          data = data as Map<String, dynamic>;
          data.remove("query");
          data.remove("useGetForPersitent");
        }
      }
    }
    void Function(int, int)? onReceiveProgress;
    if (payload.listenReceiveProgress) {
      onReceiveProgress = (int got, int total) {
        store.dispatch(action.copyWith(
            internal: ActionInternal(
                processed: true,
                type: ActionInternalType.FIELD,
                data: field.copyWith(
                    loading: true,
                    progress: HttpProgress(current: got, total: total)))));
      };
    }
    void Function(int, int)? onSendProgress;
    if (payload.listenSendProgress) {
      onSendProgress = (int sent, int total) {
        store.dispatch(action.copyWith(
            internal: ActionInternal(
                processed: true,
                type: ActionInternalType.FIELD,
                data: field.copyWith(
                    loading: true,
                    progress: HttpProgress(current: sent, total: total)))));
      };
    }
    print("Sending request to server $url ");
    print("data $data");
    response = await dio.request<dynamic>(url,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: options);
    print(
        "Response from server ${response.data} status : ${response.statusCode}");
  } on DioError catch (e) {
    _handleDioError(e: e, action: action, store: store);
    return;
  } catch (e) {
    print("uncaught error in http $e");
    rethrow;
  }
  void handleGraphqlResponse(Response response) {
    // late HttpField hf;
    dynamic error;
    HttpErrorType? errorType;
    if (response.data["errors"] != null) {
      // in graphql response we will get errors from successfull response also
      errorType = HttpErrorType.Response;
      error = (response.data["errors"] as List<dynamic>)
          .map((dynamic e) => GraphqlError.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    dynamic rdata;
    if (response.data["data"] != null) {
      rdata = meta!.responseDeserializer(200, response.data["data"]);
    }
    var hf = field.copyWith(
        error: error, errorType: errorType, data: rdata, completed: true);
    if (meta?.transformer != null) {
      hf = meta!.transformer!(field.copyWith(completed: true), hf) as HttpField;
    }
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true, type: ActionInternalType.FIELD, data: hf)));
  }

  if (response != null) {
    if (payload.data is GraphqlRequestInput) {
      // graphql request
      if (isPersistQueryNotFoundError(response)) {
        try {
          final presp = await createPersistedGraphqlQuery(
              payload: payload, options: options, meta: meta);
          handleGraphqlResponse(presp);
        } on DioError catch (e) {
          _handleDioError(e: e, action: action, store: store);
        } catch (e) {
          rethrow;
        }
      } else {
        handleGraphqlResponse(response);
      }
    } else {
      dynamic data =
          meta!.responseDeserializer(response.statusCode ?? 200, response.data);

      dynamic hf;
      if (meta.transformer != null) {
        hf = meta.transformer!(field.copyWith(completed: true), data);
      } else {
        hf = field.copyWith(data: data, completed: true);
      }
      print("Sending response $hf");
      store.dispatch(action.copyWith(
          internal: ActionInternal(
              processed: true, type: ActionInternalType.FIELD, data: hf)));
    }
  }
}

Future<Response> createPersistedGraphqlQuery(
    {required HttpPayload payload,
    required Options options,
    required HttpMeta? meta}) async {
  final req = payload.data as GraphqlRequestInput;
  var url = payload.url;
  dynamic data;
  if (req.useGetForPersitent && req.variables == null) {
    url =
        '${payload.url}?query=${req.query}&extensions=${jsonEncode(req.extensions)}';
  } else {
    data = meta?.inputSerializer!(req);
  }

  final dio = Dio();
  print("sending persit query $url");
  print("data $data");
  print("optioans $options");
  final resp = await dio.request<dynamic>(url, options: options, data: data);
  return resp;
}

bool isPersistQueryNotFoundError(Response response) {
  var result = false;
  final data = response.data as Map<String, dynamic>?;
  if (data != null && data["errors"] != null) {
    dynamic errors = data["errors"];
    print("Errors $errors ${errors.runtimeType} ");
    errors = errors as List<dynamic>;

    result = errors
        .map((dynamic e) => GraphqlError.fromJson(e as Map<String, dynamic>))
        .where((e) => e.message == "PersistedQueryNotFound")
        .isNotEmpty;
  }
  return result;
}

class DioMiddlewareOptions {
  final Map<String, GlobalHttpOptions Function()> urlOptions;

  DioMiddlewareOptions({required this.urlOptions});
}

Middleware<S> createDioMiddleware<S extends AppStateI<S>>(
    [DioMiddlewareOptions? options]) {
  final dio = Dio();
  return (Store<S> store, Dispatch next, Action action) {
    if (action.isProcessed) {
      return next(action);
    }
    dynamic mock = store.internalMocksMap[action.id]?.mock;
    if (mock != null) {
      // final mock
      mock = mock as HttpField;
      return store.dispatch(action.copyWith(
          internal: ActionInternal(
              processed: true, data: mock, type: ActionInternalType.FIELD)));
    }
    if (action.http == null) {
      return next(action);
    }

    DstoreDevUtils.handleUnCaughtError(
        store: store,
        action: action,
        callback: () => _processHttpAction(options, store, action, dio));
  };
}
