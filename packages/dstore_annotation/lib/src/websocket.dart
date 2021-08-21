import 'package:dstore_annotation/dstore_annotation.dart';

class WebSocketRequest {
  final String url;
  final GraphqlRequestPart? graphqlQuery;
  final Function? inputSerializer;
  final Function responseDeserializer;

  const WebSocketRequest(
      {required this.url,
      this.graphqlQuery,
      this.inputSerializer,
      required this.responseDeserializer});
}

class WebSocketRequestExtension<T> {
  final T Function(T)? transformer;

  const WebSocketRequestExtension({this.transformer});
}
