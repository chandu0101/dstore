import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_flutter/src/navigation/history/history_nonweb.dart'
    if (dart.library.html) 'package:dstore_flutter/src/navigation/history/history_web.dart';
import 'package:flutter/material.dart' hide Action;

typedef UriListener = void Function(Uri uri);

abstract class History {
  VoidCallback listen(UriListener listener);
  HistoryUpdate? urlUpdateMode;
  bool urlChangedInSystem = false;
  void push(String url, {bool nested = false});
  void replace(String url, {bool nested = false});
  void goBack({String? burl, bool reloadBack = false});
  String? get backUrl;
  String? get currentUrl;
  bool get canGoBack;
  bool isPreventModal = false;
  bool isBrowserBackPreventModal = false;
  void go(int number);
  void setInitialUrl(String url);
  void informUrlListeners([String? url]);
  String url = "";
  VoidCallback listenUrl(UriListener uriListener);
  Action? originAction;
  Action? authOriginAction;
  String? currentActiveNestedNav;
  late HistoryMode historyMode;
  
  GlobalKey<NavigatorState>? currentNavKey;
  BeforeLeaveFn? beforeLeave;
  late final GlobalKey<NavigatorState> globalNavKey;

  late Action Function(NavStateI navState)
      fallBackNestedStackNonInitializationAction;
  late AuthMeta? authMeta;

  final nestedNavsHistory = <String, NestedNavHistory>{};

  final nestedNavOrigins = <String, Action?>{};
  final nestedNavMeta = <String, Action>{};
}

abstract class NestedNavHistory {
  late History history;
  late String rootUrl;
  Action? originAction;
  late HistoryMode historyMode;
  String? parentStackTypeName;
  GlobalKey<NavigatorState>? parentNavKey;
  final nestedNavMeta = <String, Action>{};
  bool get canGoBack;
  void goBack();
  void push(String url);
  void replace(String url);
}

History createHistory() => HistoryImpl();

NestedNavHistory createNestedNavHistory(History history) =>
    NestedNavHistoryImpl(history: history);
