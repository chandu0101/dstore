import "package:dstore/dstore.dart";
import 'package:dstore_flutter/dstore_flutter.dart';

void _handleNavAction<S extends AppStateI<S>>(
    Action action, Dispatch next, Store<S> store) async {
  print("field ${store.getFieldFromAction(action)}");
  final navState = store.getPStateModelFromAction(action) as NavCommonI;
  final history = navState.dontTouchMe.hisotry;
  final navPayload = action.nav!;
  if (navPayload.isProtected) {
    final authMeta = history.authMeta;
    if (authMeta == null) {
      throw ArgumentError.value(
          "Action ${action.id} is protected but authmeta is null make sure you implemented ");
    }
    final isAuthenticated = authMeta.isAuthenticated(store.state);
    if (!isAuthenticated) {
      history.authOriginAction = action;
      store.dispatch(authMeta.action);
      return;
    }
  }
  if(history.authOriginAction != null) {
    final a = history.authOriginAction!;
    history.authOriginAction = null;
    store.dispatch(a);
    return;
  } 
  final navOptions = navPayload.navOptions as NavOptions?;

  print("navPayload $navPayload");

  String? typeName;
  if (navState is NestedNavStateI) {
    typeName = navState.dontTouchMe.typeName;
  }

  history.urlUpdateMode = navOptions?.historyUpdate;
  print(
      "nav middleware typeName $typeName navHistory  ${history.nestedNavsHistory} before leave ${history.beforeLeave}");
  final allowToLeave =
      handleBeforeLeave(history: history, store: store, action: action);
  if (!allowToLeave) {
    print(
        "Skiping nav action $action , because its prevent by beforeLeave function");
    return;
  }

  if (navPayload.rawUrl != null &&
      typeName != null &&
      !history.nestedNavsHistory.containsKey(typeName)) {
    // nested stack not initialized yet
    print("Parent stack not initialized for type $typeName ");
    history.nestedNavOrigins[typeName] = action;
    final a = history.nestedNavMeta[typeName]!;
    print("modified a $a");
    store.dispatch(a);
    return;
  }
  final blockSameUrl = navOptions?.blockSameUrl ?? false;
  if (!blockSameUrl) {
    //
    next(action);
    return;
  }
  final uri = Uri.parse(history.url);
  print("path ${uri.path}");
  if (blockSameUrl) {
    // do nothing
    next(action.copyWith(beforeStateUpdate: (cs) {
      final csNav = cs as NavCommonI;
      if (uri.path == csNav.dontTouchMe.url) {
        print("blocking same url");
        return false;
      }
      return true;
    }));
  }
}

dynamic navigaionMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) {
  if (action.isProcessed || action.nav == null) {
    next(action);
  } else {
    _handleNavAction(action, next, store);
  }
}
