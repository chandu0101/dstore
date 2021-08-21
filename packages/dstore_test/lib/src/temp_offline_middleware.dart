import 'package:dstore/dstore.dart';

class TempNetworkStatusListener extends NetworkStatusListener {
  late void Function(bool status) _listener;

  @override
  void Function() listen(void Function(bool status) cb) {
    _listener = cb;
    return () {};
  }

  void setOnline() {
    _listener(true);
  }

  void setOffline() {
    _listener(false);
  }
}

dynamic tempOfflineMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) async {
  print("tempOfflineMiddleware  middleware $action next $next store $store ");
  if (action.isProcessed || action.http == null) {
    return next(action);
  }
  final http = action.http!;
  if (http.offline && action.offlinedAt == null) {
    final field = store.getFieldFromAction(action) as HttpField;
    final a = action.copyWith(
        offlinedAt: DateTime.now(),
        internal: ActionInternal(
            processed: true,
            type: ActionInternalType.FIELD,
            data: field.copyWith(offline: true, completed: true)));
    await store.addOfflineAction(a);
    next(a);
  } else {
    next(action);
  }
}
