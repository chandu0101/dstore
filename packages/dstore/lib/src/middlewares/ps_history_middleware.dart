import 'package:dstore/src/action.dart';
import 'package:dstore/src/pstate.dart';
import 'package:dstore/src/store.dart';
import 'package:dstore/src/types.dart';
import 'package:dstore/src/utils/utils.dart';

dynamic _handlePsHistoryAction<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) {
  Map<String, dynamic> getUndoRedoMap(PStateHistory psHistory) {
    return <String, dynamic>{
      "canUndo": psHistory.canUndo,
      "canRedo": psHistory.canRedo
    };
  }

  final payload = action.psHistoryPayload!;
  final currentState =
      store.getPStateModelFromAction(action) as PStateHistoryMixin;
  print("_handlePsHistoryAction $currentState");
  if (action.name == "undo") {
    if (currentState.dontTouchMePSHistory.canUndo) {
      final initialState = store.getDefaultStateForAcion(action);
      var state = currentState.dontTouchMePSHistory.internalUndo(initialState)!;
      final map = getUndoRedoMap(currentState.dontTouchMePSHistory);
      state = state.copyWithMap(map) as PStateModel;
      (state as PStateHistoryMixin).dontTouchMePSHistory =
          currentState.dontTouchMePSHistory;
      store.dispatch(action.copyWith(
          internal: ActionInternal(
              processed: true, type: ActionInternalType.PSTATE, data: state)));
      return;
    } else {
      print("nothing to undo");
      return;
    }
  }

  if (action.name == "redo") {
    print("executing ");
    if (currentState.dontTouchMePSHistory.canRedo) {
      var state = currentState.dontTouchMePSHistory
          .internalRedo(currentState as PStateModel)!;
      final map = getUndoRedoMap(currentState.dontTouchMePSHistory);
      state = state.copyWithMap(map) as PStateModel;
      store.dispatch(action.copyWith(
          internal: ActionInternal(
              processed: true, type: ActionInternalType.PSTATE, data: state)));
      return;
    } else {
      print("nothing to redo");
      return;
    }
  }
  if (action.name == "clearHistory") {
    if (currentState.dontTouchMePSHistory.canUndo ||
        currentState.dontTouchMePSHistory.canRedo) {
      currentState.dontTouchMePSHistory.internalClear();
      final currentPS = currentState as PStateModel;
      final map = <String, dynamic>{};
      map["canUndo"] = false;
      map["canRedo"] = false;
      final dynamic news = currentPS.copyWithMap(map);
      store.dispatch(action.copyWith(
          internal: ActionInternal(
              processed: true, type: ActionInternalType.PSTATE, data: news)));
      print("cleared history");
      return;
    } else {
      print("nothing to clear");
      return;
    }
  }
  next(action);
}

dynamic psHistoryMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) {
  print("psHistoryMiddleware $action next $next store $store ");
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
  if (action.psHistoryPayload == null) {
    return next(action);
  }
  DstoreDevUtils.handleUnCaughtError(
      store: store,
      action: action,
      callback: () => _handlePsHistoryAction(store, next, action));
}
