import 'dart:async';
import 'dart:convert';

import 'package:dstore/dstore.dart';
import 'package:web_socket_channel_fork/web_socket_channel.dart';

enum GraphqlMessages {
  connection_init,
  connection_ack,
  connection_error,
  start,
  stop,
  ka, //CONNECTION_KEEP_ALIVE
  connection_terminate,
  data,
  error,
  complete
}

abstract class WebSocketReadyState {
  static const int CLOSED = 3;

  static const int CLOSING = 2;

  static const int CONNECTING = 0;

  static const int OPEN = 1;
}

const _WebSocket_Global_Group = "_DSTORE_WEBSCOKET_GLOBAL_GROUP";

extension GraphqlMessagesExt on GraphqlMessages {
  String get name => toString().split(".").last;
}

GraphqlMessages _convertStringToGraphlMessage(String name) {
  return GraphqlMessages.values.firstWhere(
      (m) => m.toString().split(".").last == name,
      orElse: () => GraphqlMessages.complete);
}

final _clients = <String, DWebSocket>{};

abstract class WebSocketGlobalActions {
  static Action<dynamic> close(String url) {
    return Action<dynamic>(
        name: "close",
        type: _WebSocket_Global_Group,
        ws: WebSocketPayload<dynamic, dynamic, dynamic>(
            url: url, responseDeserializer: IdentityFn));
  }

  static Action<dynamic> connect(String url) {
    return Action<dynamic>(
        name: "connect",
        type: _WebSocket_Global_Group,
        ws: WebSocketPayload<dynamic, dynamic, dynamic>(
            url: url, responseDeserializer: IdentityFn));
  }
}

class DWebSocketOptions {
  final List<String>? protocols;
  final bool reconnect;
  final int reconnectTimes;
  final dynamic Function()? onOpenMessage;
  final Map<String, dynamic>? headers;
  final dynamic Function(dynamic messagePassedFromAction, String id)?
      createMessage;
  final List<dynamic> Function(dynamic data)? parseMessage;

  DWebSocketOptions(
      {this.protocols,
      this.reconnect = false,
      this.createMessage,
      this.parseMessage,
      this.headers,
      this.reconnectTimes = 0,
      this.onOpenMessage});
}

class DWebSocket {
  late final DWebSocketOptions options;
  late final Store store;
  bool isReady = false;
  var subscriptions = <Action>[];
  var unsubscriptions = <Action>[];
  final queue = <Action>[];
  bool isForceClose = false;
  late final WebSocketChannel ws;
  late final bool isGraphql;
  late final String url;
  Timer? _onOpenMinitorTimer;
  int delay = 0;
  dynamic? _error;
  Timer? _reconnectedTimer;
  int receconnectedTimes = 1000;
  // DWebsocket();
  DWebSocket(
      {required String url,
      required DWebSocketOptions options,
      required Store store,
      bool isGraphql = false}) {
    // final ctor = DWebsocket();
    this.options = options;
    this.store = store;
    this.url = url;
    this.isGraphql = isGraphql;
    connect();
  }

  void connect() async {
    try {
      var protocols = isGraphql ? ["graphql-ws"] : <String>[];
      if (options.protocols != null) {
        protocols = options.protocols!;
      }
      isReady = false;
      ws = WebSocketChannel.connect(Uri.parse(url), protocols: protocols);
      ws.stream.listen(onMessage, onDone: onDone, onError: onError);
      if (ws.readyState == WebSocketReadyState.OPEN) {
        onOpen();
      } else {
        _monitorOnStart();
      }
    } catch (e) {
      cleanup(e);
    }
  }

  void _tryReconnect() {
    if (_reconnectedTimer != null && _reconnectedTimer!.isActive) {
      _reconnectedTimer!.cancel();
    }
    delay = delay * 2; //TODO exponential delay
    final duration = Duration(microseconds: delay);
    _reconnectedTimer = Timer(duration, () {
      connect();
    });
    receconnectedTimes++;
  }

  void onOpen() {
    isForceClose = false;
    receconnectedTimes = 0;
    delay = 1000;
    if (isGraphql) {
      ws.sink.add(jsonEncode({
        "type": GraphqlMessages.connection_init.name,
        "headers": options.headers
      }));
    } else {
      isReady = true;
      if (options.onOpenMessage != null) {
        ws.sink.add(options.onOpenMessage!());
      }
      _processQueue();
    }
  }

  void _processQueue() {
    if (queue.isNotEmpty) {
      queue.forEach((element) {
        handleAction(element);
      });
      queue.clear();
    }
  }

  void cleanup(dynamic error) {
    [...subscriptions, ...queue, ...unsubscriptions].forEach((a) {
      final field = store.getFieldFromAction(a) as WebSocketField;
      _dispatchActionToStore(a, field.copyWith(error: error, completed: true));
    });
    subscriptions.clear();
    queue.clear();
    unsubscriptions.clear();
    isReady = false;
    _error = null;
  }

  void onMessage(dynamic message) {
    if (isGraphql) {
      _handleGraphqlMessage(message);
    } else {
      final dynamic data = message["data"];
      if (options.parseMessage == null) {
        throw Exception(
            "You should provide a parseMessage function which should return unique id that was passed as input to createMessage while sending");
      }
      final list = options.parseMessage!(data);
      final rData = list.first as WebSocketField;
      final id = list.last as String;
      final a = _getActiveSubscriptionActionFromId(id);
      if (a != null) {
        _dispatchActionToStore(a, rData);
      }
    }
  }

  void _handleGraphqlMessage(dynamic message) {
    print("Message runtime type ${message.runtimeType}");
    final data = jsonDecode(message as String) as Map<String, dynamic>;
    print("data $data");
    final type = data["type"] as String;
    final gmType = _convertStringToGraphlMessage(type);
    switch (gmType) {
      case GraphqlMessages.connection_init:
        // TODO: Handle this case.
        break;
      case GraphqlMessages.connection_ack:
        isReady = true;
        _processQueue();
        break;
      case GraphqlMessages.connection_error:
        // This may occur:
        // 1. In response to GQL.CONNECTION_INIT
        // 2. In case of parsing errors in the client which will not disconnect.
        //TODO
        break;

      case GraphqlMessages.start:
        // TODO: Handle this case.
        break;
      case GraphqlMessages.stop:
        print("got graphql subscription stop signal");
        // TODO: Handle this case. see if we're getting stop signal
        break;
      case GraphqlMessages.connection_terminate:
        // TODO: Handle this case.
        break;
      case GraphqlMessages.data:
        // This message is sent after GQL.START to transfer the result of the GraphQL subscription.
        final id = data["id"] as String;
        final a = _getActiveSubscriptionActionFromId(id);

        if (a != null) {
          final pError =
              data["payload"]["errors"] as List<Map<String, dynamic>>?;
          final dynamic pData = data["payload"]["data"];
          dynamic error;
          if (pError != null) {
            error = pError.map((e) => GraphqlError.fromJson(e)).toList();
          }
          dynamic rData;
          if (pData != null) {
            print("wspayalod ${a.ws}");
            rData = a.ws!.responseDeserializer(pData);
          }
          final field = store.getFieldFromAction(a) as WebSocketField;
          _dispatchActionToStore(a, field.copyWith(error: error, data: rData));
        }
        break;
      case GraphqlMessages.error:
        // This method is sent when a subscription fails. This is usually dues to validation errors
        // as resolver errors are returned in GQL.DATA messages.
        final id = data["id"] as String;
        final a = _getActiveSubscriptionActionFromId(id);
        if (a != null) {
          final field = store.getFieldFromAction(a) as WebSocketField;
          _dispatchActionToStore(a, field.copyWith(error: data["payload"]));
          //TODO do we need remove subscription from here ...
        }
        break;
      case GraphqlMessages.complete:
        // This is sent when the operation is done and no more dta will be sent.
        print("graphql subscription completed");
        final id = data["id"] as String;
        var ac = _getActiveSubscriptionActionFromId(id, removeFromList: true);
        ac = ac ?? _getActiveUnsubscriptionFromId(id);
        if (ac != null) {
          final field = store.getFieldFromAction(ac) as WebSocketField;
          _dispatchActionToStore(ac, field.copyWith(completed: true));
        }
        break;
      case GraphqlMessages.ka:
        // This may occur:
        // 1. After GQL.CONNECTION_ACK,
        // 2. Periodically to keep the connection alive.
        break;
    }
  }

  void onDone() {
    if (isForceClose ||
        !options.reconnect ||
        (options.reconnect && options.reconnectTimes < receconnectedTimes)) {
      cleanup(_error);
    } else {
      _tryReconnect();
    }
  }

  void onError(dynamic error) {
    // on done is called after onError so do clean up there
    _error = error;
  }

  void _monitorOnStart() {
    if (_onOpenMinitorTimer != null && _onOpenMinitorTimer!.isActive) {
      return;
    }
    const timeout = Duration(milliseconds: 500);
    _onOpenMinitorTimer = Timer.periodic(timeout, (timer) {
      if (ws.readyState == WebSocketReadyState.OPEN) {
        timer.cancel();
        _onOpenMinitorTimer = null;
        onOpen();
      } else if (ws.readyState == WebSocketReadyState.CLOSING ||
          ws.readyState == WebSocketReadyState.CLOSED) {
        timer.cancel();
        _onOpenMinitorTimer = null;
      }
    });
  }

  void _dispatchActionToStore(Action action, WebSocketField data) {
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            data: data.copyWith(
                internalUnsubscribe: _getUnSunscribeFuntion(action)),
            processed: true,
            type: ActionInternalType.FIELD)));
  }

  bool removeFromSubscriptions(Action action,
      {bool addToUnSubscriptions = false}) {
    var result = false;
    subscriptions.removeWhere((a) {
      if (a.id == action.id) {
        if (addToUnSubscriptions) {
          unsubscriptions.add(a);
        }
        result = true;
        return true;
      }
      return false;
    });
    return result;
  }

  void handleGlobalAction(Action action) {
    if (action.name == "close") {
      isForceClose = true;
      ws.sink.close();
    } else if (action.name == "connect") {
      connect();
    }
  }

  Action? _getActiveSubscriptionActionFromId(String id,
      {bool removeFromList = false}) {
    Action? result;
    if (removeFromList) {
      subscriptions.removeWhere((element) {
        if (element.id == id) {
          result = element;
          return true;
        }
        return false;
      });
      return result;
    }

    return subscriptions.firstWhereOrNull((element) => element.id == id);
  }

  Action? _getActiveUnsubscriptionFromId(String id) {
    Action? result;
    unsubscriptions.removeWhere((element) {
      if (element.id == id) {
        result = element;
        return true;
      }
      return false;
    });
    return result;
  }

  // String getId(Action a) {
  //   return "${a.type.hashCode}.${a.name}";
  // }

  void handleUnsubscribe(Action action) {
    final isRemoved =
        removeFromSubscriptions(action, addToUnSubscriptions: true);
    print("isRemoved $isRemoved");
    if (isRemoved) {
      final id = action.id;
      if (isGraphql) {
        final message =
            jsonEncode({"type": GraphqlMessages.stop.name, "id": id});
        print("sending graphqlunsubscribe message $message");
        ws.sink.add(message);
      }
    }
    //TODO check if this sends a complete event.
  }

  void Function() _getUnSunscribeFuntion(Action action) {
    return () => store.dispatch(Action<dynamic>(
        name: action.name,
        type: action.type,
        ws: WebSocketPayload<dynamic, dynamic, dynamic>(
            url: url, responseDeserializer: IdentityFn, unsubscribe: true)));
  }

  void handleAction(Action<dynamic> action) {
    final wsp = action.ws!;
    if (action.type == _WebSocket_Global_Group) {
      return handleGlobalAction(action);
    } else {
      if (wsp.unsubscribe) {
        print("unsubscribing action $action");
        handleUnsubscribe(action);
        return;
      }
      final field = store.getFieldFromAction(action) as WebSocketField;
      _dispatchActionToStore(action, field.copyWith(loading: true));
      if (!isReady) {
        queue.add(action);
        return;
      }
      final id = action.id;
      final sa = _getActiveSubscriptionActionFromId(id);
      dynamic payload = wsp.data;
      if (wsp.inputSerializer != null) {
        payload = wsp.inputSerializer!(payload);
      }
      if (isGraphql) {
        ws.sink.add(jsonEncode(<String, dynamic>{
          "type": GraphqlMessages.start.name,
          "id": id,
          "payload": payload
        }));
      } else {
        if (options.createMessage == null) {
          throw Exception(
              "You should provide a createMessage function which takes an unique id for action and send it back in response from server");
        }

        payload = options.createMessage!(payload, id);
        ws.sink.add(payload);
      }
      if (sa == null) {
        // if already there is a subscription for that id dont add it again
        subscriptions.add(action);
      }
    }
  }
}

// final ds =
//     DWebSocket(url: "", options: null as dynamic, store: null as dynamic);

class WebsocketMiddlewareOptions {
  final Map<String, DWebSocketOptions Function()> urlOptions;

  WebsocketMiddlewareOptions({required this.urlOptions});
}

void _processWebsocketAction(
    {required WebsocketMiddlewareOptions? options,
    required Action action,
    required Store store}) {
  final isGlobal = action.type == _WebSocket_Global_Group;
  final isGraphql = action.ws!.data is GraphqlRequestInput;
  final url = action.ws!.url;
  var client = _clients[url];
  if (client == null &&
      isGlobal &&
      (action.name == "close" || action.name == "connect")) {
    // do nothing or throw error ?
    return;
  }
  if (client == null) {
    var dwOptions = DWebSocketOptions();
    if (options != null) {
      final of = options.urlOptions[url];
      if (of != null) {
        dwOptions = of();
      }
    }
    client = DWebSocket(
        url: url, options: dwOptions, isGraphql: isGraphql, store: store);
    _clients[url] = client;
  }

  client.handleAction(action);
}

Middleware<S> createWebsocketMiddleware<S extends AppStateI<S>>(
    [WebsocketMiddlewareOptions? options]) {
  return (Store<S> store, Dispatch next, Action action) {
    if (action.isProcessed || action.ws == null) {
      return next(action);
    }
    _processWebsocketAction(options: options, store: store, action: action);
  };
}
