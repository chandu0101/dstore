import 'package:collection/collection.dart';

enum HttpErrorType {
  Default,
  Response,
  Aborted,
  ConnectTimeout, // offline
  SendTimeout,
  ReceiveTimeout
}

enum HttpResponseType { JSON, STRING, BYTES, STREAM }

extension HttpResponseTypeExt on HttpResponseType {
  String get value => toString().split(".").last;
  static HttpResponseType? fromValue(String value) {
    return HttpResponseType.values
        .singleWhereOrNull((e) => e.toString().split(".")[1] == value);
  }
}

enum HttpInputType { JSON, FORM, TEXT }

extension HttpInputTypeExt on HttpInputType {
  String get value => toString().split(".").last;
  static HttpInputType? fromValue(String value) {
    return HttpInputType.values
        .singleWhereOrNull((e) => e.toString().split(".")[1] == value);
  }
}

class HttpRequest {
  final String method;
  final String url;
  final Function? responseDeserializer;
  final Function? inputSerializer;
  final Function? responseSerializer;
  final Function? inputDeserializer;
  final Function? errorDeserializer;
  final HttpResponseType? responseType;
  final GraphqlRequestPart? graphqlQuery;
  final Map<String, String>? headers;
  final String? queryParamsType;
  final String? pathParamsType;
  final String? originalResponseType;

  const HttpRequest({
    required this.method,
    required this.url,
    this.responseSerializer,
    this.responseDeserializer,
    this.inputSerializer,
    this.responseType,
    this.headers,
    this.pathParamsType,
    this.queryParamsType,
    this.inputDeserializer,
    this.errorDeserializer,
    this.originalResponseType,
    this.graphqlQuery,
  });
}

class GraphqlRequestPart {
  final String query;
  final String? hash;
  final bool useGetForPersist;

  const GraphqlRequestPart(
      {required this.query, this.hash, this.useGetForPersist = false});
  @override
  String toString() =>
      'GraphqlRequestPart(query: $query, hash: $hash, useGetForPersist: $useGetForPersist)';
}

class HttpRequestExtension {
  final Function? transformer; // make sure input and return type are HttpField
  final Future<bool> Function(dynamic)? canProcessOfflineAction;
  final bool persitDataBetweenFetches;

  const HttpRequestExtension(
      {this.transformer,
      this.canProcessOfflineAction,
      this.persitDataBetweenFetches = false});
}
