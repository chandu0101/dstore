import 'package:dstore/src/action.dart';
import 'package:dstore/src/pstate.dart';
import 'package:dstore/src/store.dart';
import 'package:dstore/src/types.dart';
import 'package:dstore/src/utils/utils.dart';

void _handleAsyncAction<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) async {
  final sk = store.getStateKeyForPstateType(action.type);
  final psm = store.internalMeta[sk]!;
  store.dispatch(action.copyWith(
      internal: ActionInternal(
          processed: true,
          type: ActionInternalType.FIELD,
          data: AsyncActionField(loading: true))));
  try {
    final cs = store.getPStateModelFromAction(action);
    final s = await psm.aReducer!(cs, action) as PStateModel;
    final asm = s.toMap();
    asm[action.name] = AsyncActionField(completed: true);
    final newS = s.copyWithMap(asm) as PStateModel;
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true, data: newS, type: ActionInternalType.PSTATE)));
  } catch (e, st) {
    print("Exception in async $e");
    print(st);
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true,
            type: ActionInternalType.FIELD,
            data:
                AsyncActionField(error: e, loading: false, completed: true))));
  }
}

dynamic asyncMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) {
  print("Async middleware $action next $next store $store ");
  if (action.isProcessed) {
    return next(action);
  }
  dynamic mock = store.internalMocksMap[action.id]?.mock;
  if (mock != null) {
    // final mock
    mock = mock as ToMap;
    final model = store.getPStateModelFromAction(action);
    dynamic newS = model.copyWithMap(mock.toMap());
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true, data: newS, type: ActionInternalType.PSTATE)));
    return;
  }
  if (!action.isAsync) {
    print("going to next in async");
    return next(action);
  }
  DstoreDevUtils.handleUnCaughtError(
      store: store,
      action: action,
      callback: () => _handleAsyncAction(store, next, action));
}
