import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import "package:http/http.dart";
import 'package:dstore/dstore.dart';

class HttpMiddlewareOptions {
  final Map<String, GlobalHttpOptions Function()> urlOptions;

  HttpMiddlewareOptions({required this.urlOptions});
}

class HttpAbortController extends AbortController {
  @override
  void abort() {
    throw UnimplementedError(
        "once this https://github.com/dart-lang/http/issues/424 finished we'll implement.");
  }
}

class _CoreHttpOptions {
  final String method;
  final HttpResponseType responseType;
  final Map<String, String>? headers;
  final Encoding? encoding;

  _CoreHttpOptions(
      {required this.method,
      required this.responseType,
      this.encoding,
      this.headers});
}

class _HttpResponseError {
  final Response response;
  _HttpResponseError({required this.response});
}

_CoreHttpOptions _getOptions(
    HttpPayload payload, HttpMiddlewareOptions? middlewareOptions) {
  final url = payload.url;
  GlobalHttpOptions? go;
  if (middlewareOptions != null) {
    for (final me in middlewareOptions.urlOptions.entries) {
      if (url.startsWith(me.key)) {
        go = me.value();
      }
    }
  }

  final headers = <String, String>{};
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
  return _CoreHttpOptions(
    method: method,
    headers: headers,
    responseType: payload.responseType,
  );
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

void _handleHttpError(
    {required dynamic e, required Action action, required Store store}) {
  print("handling http error $e");
  final psm = store.getPStateMetaFromAction(action);
  final payload = action.http!;
  final meta = psm.httpMetaMap?[action.name];
  final field = store.getFieldFromAction(action) as HttpField;
  final persistDataBetweenFetches = meta?.persitDataBetweenFetches ?? false;
  HttpErrorType errorType;
  dynamic error;
  dynamic genericError;
  if (e is _HttpResponseError) {
    errorType = HttpErrorType.Response;
    final resp = e.response;
    dynamic re = resp.body;
    if (payload.responseType == HttpResponseType.JSON) {
      re = jsonDecode(re as String);
    }
    print("Response Error $re");
    if (meta?.errorDeserializer != null) {
      re = meta?.errorDeserializer!(resp.statusCode, re);
    }
    error = re;
  } else if (e is SocketException && e.osError?.errorCode == 8) {
    errorType = HttpErrorType.ConnectTimeout;
    // offline in native platforms
    genericError = "$e";
  } else if (e is ClientException) {
    if (store.networkStatus == false) {
      // in http package for web platform XMLHTtp Error doesnt return any info whether its offline or not
      errorType = HttpErrorType.ConnectTimeout;
    } else {
      errorType = HttpErrorType.Default;
    }
    genericError = "$e";
  } else {
    errorType = HttpErrorType.Default;
    genericError = "$e";
  }
  if (payload.offline && errorType == HttpErrorType.ConnectTimeout) {
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
        genericError: genericError,
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

void _processHttpAction<S extends AppStateI<S>>(
    HttpMiddlewareOptions? middlewareOptions,
    Store<S> store,
    Action action,
    Client client) async {
  final psm = store.getPStateMetaFromAction(action);
  final payload = action.http!;
  final meta = psm.httpMetaMap?[action.name];
  var field = store.getFieldFromAction(action) as HttpField;

  final canProcess = await _canProcessHtpAction(meta: meta, action: action);
  if (!canProcess) {
    print(
        "Action $action is skipped because its blocked by offline can process  action");
    return;
  }
  final persistDataBetweenFetches = meta?.persitDataBetweenFetches ?? false;
  action = action.copyWith(offlinedAt: null);

  AbortController? abortController;
  if (payload.abortable) {
    throw ArgumentError.value(
        "Currently http package doesnt support aborting req , check https://github.com/dart-lang/http/issues/424");
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
    print(
        "Sending request to server $url  lp ${payload.listenReceiveProgress}");
    print("data $data");
    try {
      if (payload.listenReceiveProgress) {
        print("sending request with listenSendProgres");
        final completer = Completer<Uint8List>();
        final result = <int>[];
        final responseStream = await _streamRequest(
            url: url, options: options, body: data, client: client);

        responseStream.stream.listen((value) {
          result.addAll(value);
          store.dispatch(action.copyWith(
              internal: ActionInternal(
                  processed: true,
                  type: ActionInternalType.FIELD,
                  data: field.copyWith(
                      loading: true,
                      progress: HttpProgress(
                          current: result.length,
                          total: responseStream.contentLength ?? 0)))));
          print("got value from r $value ");
        }, onError: (dynamic error) {
          //TODO test download error wit hactual down load error and connection errors
          completer.completeError(_HttpResponseError(
              response: Response.bytes(result, responseStream.statusCode,
                  request: responseStream.request,
                  headers: responseStream.headers,
                  isRedirect: responseStream.isRedirect,
                  persistentConnection: responseStream.persistentConnection,
                  reasonPhrase: responseStream.reasonPhrase)));
        }, onDone: () {
          print("http stream done");
          completer.complete(Uint8List.fromList(result));
        });
        final body = await completer.future;
        response = Response.bytes(body, responseStream.statusCode,
            request: responseStream.request,
            headers: responseStream.headers,
            isRedirect: responseStream.isRedirect,
            persistentConnection: responseStream.persistentConnection,
            reasonPhrase: responseStream.reasonPhrase);
        if (response.statusCode < 200 || response.statusCode >= 300) {
          throw _HttpResponseError(response: response);
        }
        ;
      } else {
        if (payload.listenSendProgress) {
          print(
              "sendProgress updates are not supported by http package , but there is PR in waiting https://github.com/dart-lang/http/pull/579");
        }
        response = await _unstreamedRequest(
            url: url,
            options: options,
            body: data,
            client: client); //TODO upload download progress
        if (response.statusCode < 200 || response.statusCode >= 300) {
          throw _HttpResponseError(response: response);
        }
      }
    } catch (e) {
      _handleHttpError(e: e, store: store, action: action);
      return;
    }
  } catch (e) {
    print("uncaught error in http $e");
    rethrow;
  }
  void handleGraphqlResponse(Response response) {
    // late HttpField hf;
    dynamic error;
    HttpErrorType? errorType;
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    if (data["errors"] != null) {
      // in graphql response we will get errors from successfull response also
      errorType = HttpErrorType.Response;
      error = (data["errors"] as List<dynamic>)
          .map((dynamic e) => GraphqlError.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    dynamic rdata;
    if (data["data"] != null) {
      rdata = meta!.responseDeserializer(200, data["data"]);
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
              payload: payload, options: options, meta: meta, client: client);
          handleGraphqlResponse(presp);
        } catch (e) {
          _handleHttpError(e: e, action: action, store: store);
        }
      } else {
        handleGraphqlResponse(response);
      }
    } else {
      dynamic rData = response.body;
      if (payload.responseType == HttpResponseType.JSON) {
        rData = jsonDecode(rData as String) as Map<String, dynamic>;
      } else if (payload.responseType == HttpResponseType.BYTES) {
        rData = response.bodyBytes;
      }
      dynamic data = meta!.responseDeserializer(response.statusCode, rData);

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
    required HttpMeta? meta,
    required _CoreHttpOptions options,
    required Client client}) async {
  final req = payload.data as GraphqlRequestInput;
  var url = payload.url;
  dynamic data;
  if (req.useGetForPersitent && req.variables == null) {
    url =
        '${payload.url}?query=${req.query}&extensions=${jsonEncode(req.extensions)}';
  } else {
    data = meta?.inputSerializer!(req);
  }

  print("sending persit query $url");
  print("data $data");
  return _unstreamedRequest(
      url: url, options: options, body: data, client: client);
}

Future<Response> _unstreamedRequest(
    {required String url,
    required _CoreHttpOptions options,
    required Object? body,
    required Client client}) async {
  final req = Request(options.method, Uri.parse(url));
  if (options.headers != null) {
    req.headers.addAll(options.headers!);
  }
  if (options.encoding != null) {
    req.encoding = options.encoding!;
  }

  if (body != null) {
    if (body is String) {
      req.body = body;
    } else if (body is List) {
      req.bodyBytes = body as List<int>;
    } else if (body is Map) {
      // TODO handle form fields case
      req.body = jsonEncode(body);
    }
  }
  req.body = "";
  final resp = await client.send(req);

  return Response.fromStream(resp);
}

Future<StreamedResponse> _streamRequest(
    {required String url,
    required _CoreHttpOptions options,
    required Object? body,
    required Client client}) async {
  final req = Request(options.method, Uri.parse(url));
  if (options.headers != null) {
    req.headers.addAll(options.headers!);
  }
  if (options.encoding != null) {
    req.encoding = options.encoding!;
  }

  if (body != null) {
    if (body is String) {
      req.body = body;
    } else if (body is List) {
      req.bodyBytes = body as List<int>;
    } else if (body is Map) {
      // TODO handle form fields case
      req.body = jsonEncode(body);
    }
  }
  req.body = "";
  final resp = await client.send(req);

  return resp;
}

bool isPersistQueryNotFoundError(Response response) {
  var result = false;
  final data = jsonDecode(response.body) as Map<String, dynamic>?;
  if (data != null && data["errors"] != null) {
    var errors = data["errors"] as List<dynamic>;
    result = errors
        .map((dynamic e) => GraphqlError.fromJson(e as Map<String, dynamic>))
        .where((e) => e.message == "PersistedQueryNotFound")
        .isNotEmpty;
  }
  return result;
}

Middleware<S> createHttpMiddleware<S extends AppStateI<S>>(
    [HttpMiddlewareOptions? options]) {
  final client = Client();

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
        callback: () => _processHttpAction(options, store, action, client));
  };
}
