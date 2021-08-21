import 'package:dstore/dstore.dart';
import 'package:dstore/src/http.dart';
import 'package:dstore/src/nav.dart';
import 'package:dstore/src/stream.dart';
import 'package:dstore/src/utils/utils.dart';
import 'package:dstore/src/websocket.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dstore_annotation/dstore_annotation.dart';

part "action.dstore.dart";

@dimmutable
class $_PSHistoryPayload {
  late List<String> keysModified;
}

@dimmutable
@optionalTypeArgs
abstract class $_Action<M> {
  late String name;
  late String type;
  bool isAsync = false;
  NavPayload? nav;
  Map<String, dynamic>? payload;
  HttpPayload? http;
  WebSocketPayload<dynamic, dynamic, dynamic>? ws;
  dynamic? extra;
  ActionInternal? internal;
  PSHistoryPayload? psHistoryPayload;
  StreamPayload? stream;
  Duration? debounce;
  void Function(PStateModel state)? afterComplete;
  bool silent = false;
  M? mock;
  FormReq? form;
  DateTime? offlinedAt;
  bool Function(PStateModel ps)? beforeStateUpdate;
  bool get isProcessed => internal?.processed ?? false;

  // currently only http actions support offline functionality
  Map<String, dynamic> toJson({HttpMeta? httpMeta}) {
    final map = <String, dynamic>{};
    if (http != null && httpMeta == null) {
      throw ArgumentError.value(
          "You should provide httpmeta if action has http field");
    }
    map["name"] = name;
    map["type"] = type;
    map["http"] = http?.toJson(httpMeta!);
    map["offlinedAt"] = offlinedAt?.millisecondsSinceEpoch;
    return map;
  }

  String get id => "$type.$name";
  static Action fromJson<M>(Map<String, dynamic> map, HttpMeta? httpMeta) {
    final name = map["name"] as String;
    final type = map["type"] as String;
    final offlinedAtInt = map["offlinedAt"] as int?;
    final offlinedAt = offlinedAtInt != null
        ? DateTime.fromMillisecondsSinceEpoch(offlinedAtInt)
        : null;
    final httpMap = map["http"] as Map<String, dynamic>?;
    HttpPayload? http;
    if (httpMap != null) {
      if (httpMeta == null) {
        throw ArgumentError.value(
            "You should provide httpMeta for http actions");
      }
      http = HttpPayload.fromJson<dynamic, dynamic, dynamic, dynamic, dynamic,
          dynamic>(httpMap, httpMeta);
    }
    return Action<M>(
        name: name, type: type, http: http, offlinedAt: offlinedAt);
  }
}

@dimmutable
abstract class $_ActionInternal {
  late bool processed;
  late ActionInternalType type;
  late dynamic data;
}

enum ActionInternalType { FIELD, PSTATE }
