import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/src/navigation/history/history.dart';
import 'package:flutter/material.dart' hide Action;

import "configuration/confiure_native.dart"
    if (dart.library.html) "configuration/configure_web.dart";
export "router_deleagte.dart";
export "route_information_parser.dart";
export "nested_router.dart";
export "middleware.dart";
export "url_builder.dart";

typedef BeforeLeaveFn<S> = BeforeLeaveResult Function(AppStateI appState);

class BeforeLeaveResult {
  final bool allowToLeave;
  final WidgetBuilder? dialogBuilder;

  BeforeLeaveResult({required this.allowToLeave, this.dialogBuilder});
}

enum HistoryUpdate { push, replace }

enum HistoryMode { tabs, stack }

class NavConfigMeta {
  BeforeLeaveFn? beforeLeave;
  Action? redirectToAction;
  Action?
      originAction; // let say user entered protected route ,then he will be redirected to login page ,after that instead of going to home page lets redirect to origin url
  // Action? initialStateAction; // only for nested navs
  NavConfigMeta({
    this.beforeLeave,
    this.redirectToAction,
    this.originAction,
  });

  @override
  String toString() {
    return 'NavConfigMeta(beforeLeave: $beforeLeave, redirectToAction: $redirectToAction, originAction: $originAction,, )';
  }
}

class NavUrlMeta {
  final String url;
  final UrlToAction urlToAction;
  final bool isProtected;

  NavUrlMeta(
      {required this.url,
      required this.urlToAction,
      required this.isProtected});
}

class NavStateDontTouchMe {
  String? url;
  late final Map<String, NavUrlMeta> staticMeta;
  late final Map<String, NavUrlMeta> dynamicMeta;
  late History hisotry;
  String typeName = ""; // empty in main navigation
  Action? initialSetup; // not null for all nested navs
  late HistoryMode historyMode;
  String? rootUrl;
  bool isDirty = false;
  final List<String?> previousStackedUrls =
      []; // only for   nestednav with stack history mode

  @override
  String toString() {
    return 'NavStateDontTouchMe(url: $url, staticMeta: $staticMeta, dynamicMeta: $dynamicMeta, hisotry: $hisotry, typeName: $typeName, initialSetup: $initialSetup, historyMode: $historyMode, rootUrl: $rootUrl, isDirty: $isDirty)';
  }
}

abstract class NavCommonI {
  late final Page? page;
  List<Page> buildPages() => [];
  Action notFoundAction(Uri uri);
  Action fallBackNestedStackNonInitializationAction(NavCommonI navState) {
    throw UnimplementedError();
  }

  NavConfigMeta meta = NavConfigMeta();
  NavStateDontTouchMe dontTouchMe = NavStateDontTouchMe();
  List<NestedNavStateMeta> getNestedNavs() => [];
}

class AuthMeta {
  final Action action;
  final bool Function(dynamic appState) isAuthenticated;

  AuthMeta({required this.action, required this.isAuthenticated});
}

abstract class NavStateI<M> extends PStateModel<M> with NavCommonI {
  @override
  Map<String, dynamic> toMap() => throw UnimplementedError();
  @override
  M copyWithMap(Map<String, dynamic> map) => throw UnimplementedError();
  // If you dont have any protected routes/urls just put unimplemented error block;
  AuthMeta authMeta(NavCommonI navState);
}

class NestedNavStateMeta {
  final NestedNavStateI state;
  final Action rootAction;

  NestedNavStateMeta({required this.state, required this.rootAction});
}

class RouteInput {
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? queryParams;

  RouteInput({this.params, this.queryParams});
}

typedef UrlToAction = dynamic Function(Uri, Dispatch);

abstract class NestedNavStateI<M> extends PStateModel<M> with NavCommonI {
  @override
  Action notFoundAction(Uri uri) {
    throw UnimplementedError();
  }

  @override
  Action fallBackNestedStackNonInitializationAction(NavCommonI navState) {
    throw UnimplementedError();
  }

  void initialSetup();

  bool mounted = false;

  @override
  Map<String, dynamic> toMap() => throw UnimplementedError();
  @override
  M copyWithMap(Map<String, dynamic> map) => throw UnimplementedError();
}

void configureNav() {
  configurePlatForm();
}

class NavOptions<E> {
  final HistoryUpdate? historyUpdate;

  final bool blockSameUrl;
  final E?
      extraOptions; // use this to pass extra options to navigation action , remember you should handle null case , because when user entered via url extraOptions will be null

  NavOptions({this.historyUpdate, this.blockSameUrl = true, this.extraOptions});
}

extension StoreExt on Store {
  History get flutterNavHistory => this.navHistory! as History;
}
