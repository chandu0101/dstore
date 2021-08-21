import 'package:dstore/dstore.dart';
part "websocket.dstore.dart";

@dimmutable
class $_WebSocketField<I, R, E> {
  bool loading = false;
  R? data;
  E? error;
  bool completed = false;
  void Function()? internalUnsubscribe;
}

class WebSocketPayload<I, R, E> {
  final String url;
  final I? data;
  final Function responseDeserializer;
  final WebSocketField Function(WebSocketField)? transformer;
  final Function? inputSerializer;
  final Function? errorDeserializer;
  final Map<String, dynamic>? headers;
  final bool unsubscribe;

  WebSocketPayload(
      {required this.url,
      this.data,
      required this.responseDeserializer,
      this.transformer,
      this.inputSerializer,
      this.unsubscribe = false,
      this.errorDeserializer,
      this.headers});
}
