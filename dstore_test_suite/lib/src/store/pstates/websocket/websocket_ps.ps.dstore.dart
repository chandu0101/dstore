// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleWebsocket extends PStateModel<SimpleWebsocket> {
  final LocalGraphqlOps_subscriptionMessage message;

  _$SimpleWebsocketCopyWith<SimpleWebsocket> get copyWith =>
      __$SimpleWebsocketCopyWithImpl<SimpleWebsocket>(this, IdentityFn);

  SimpleWebsocket({this.message = const LocalGraphqlOps_subscriptionMessage()});

  @override
  SimpleWebsocket copyWithMap(Map<String, dynamic> map) => SimpleWebsocket(
      message: map.containsKey("message")
          ? map["message"] as LocalGraphqlOps_subscriptionMessage
          : this.message);

  Map<String, dynamic> toMap() => <String, dynamic>{"message": this.message};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleWebsocket && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => "SimpleWebsocket(message: ${this.message})";
}

abstract class $SimpleWebsocketCopyWith<O> {
  factory $SimpleWebsocketCopyWith(
          SimpleWebsocket value, O Function(SimpleWebsocket) then) =
      _$SimpleWebsocketCopyWithImpl<O>;
  O call({LocalGraphqlOps_subscriptionMessage message});
}

class _$SimpleWebsocketCopyWithImpl<O> implements $SimpleWebsocketCopyWith<O> {
  final SimpleWebsocket _value;
  final O Function(SimpleWebsocket) _then;
  _$SimpleWebsocketCopyWithImpl(this._value, this._then);

  @override
  O call({Object? message = dimmutable}) {
    return _then(_value.copyWith(
        message: message == dimmutable
            ? _value.message
            : message as LocalGraphqlOps_subscriptionMessage));
  }
}

abstract class _$SimpleWebsocketCopyWith<O>
    implements $SimpleWebsocketCopyWith<O> {
  factory _$SimpleWebsocketCopyWith(
          SimpleWebsocket value, O Function(SimpleWebsocket) then) =
      __$SimpleWebsocketCopyWithImpl<O>;
  O call({LocalGraphqlOps_subscriptionMessage message});
}

class __$SimpleWebsocketCopyWithImpl<O> extends _$SimpleWebsocketCopyWithImpl<O>
    implements _$SimpleWebsocketCopyWith<O> {
  __$SimpleWebsocketCopyWithImpl(
      SimpleWebsocket _value, O Function(SimpleWebsocket) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleWebsocket get _value => super._value;

  @override
  O call({Object? message = dimmutable}) {
    return _then(SimpleWebsocket(
        message: message == dimmutable
            ? _value.message
            : message as LocalGraphqlOps_subscriptionMessage));
  }
}

const _SimpleWebsocket_FullPath =
    "/store/pstates/websocket/websocket_ps/SimpleWebsocket";

abstract class SimpleWebsocketActions {
  static Action<dynamic> message(
      {Map<String, dynamic>? headers, bool unsubscribe = false}) {
    return Action<dynamic>(
        name: "message",
        type: _SimpleWebsocket_FullPath,
        ws: WebSocketPayload<GraphqlRequestInput<Null>,
                LocalGraphqlOps_subscriptionMessageData, List<GraphqlError>>(
            url: "ws://localhost:4000/graphql",
            data: GraphqlRequestInput(
                query: """subscription LocalGraphqlOps_subscriptionMessage { 
 messageCreated  {  
 text }

 }"""),
            responseDeserializer:
                LocalGraphqlOps_subscriptionMessageDataDeserializer,
            inputSerializer: GraphqlRequestInput.toJson,
            transformer: null,
            headers: headers,
            unsubscribe: unsubscribe));
  }
}

SimpleWebsocket SimpleWebsocket_DS() =>
    SimpleWebsocket(message: LocalGraphqlOps_subscriptionMessage());

final SimpleWebsocketMeta = PStateMeta<SimpleWebsocket>(
    type: _SimpleWebsocket_FullPath, ds: SimpleWebsocket_DS);
