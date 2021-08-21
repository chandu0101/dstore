import 'package:dstore/src/action.dart';
import 'package:dstore/src/store.dart';
import 'package:dstore/src/stream.dart';
import 'package:dstore/src/types.dart';
import 'package:dstore/src/utils/utils.dart';

dynamic streamMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) async {
  if (action.isProcessed || action.stream == null) {
    return next(action);
  }
  DstoreDevUtils.handleUnCaughtError(
      store: store,
      action: action,
      callback: () => _processStreamAction(store, next, action));
}

void _processStreamAction<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) {
  final field = store.getFieldFromAction(action) as StreamField;
  if (field.listening == true) {
    //  already listening
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true, type: ActionInternalType.FIELD, data: field)));
  } else {
    final payload = action.stream!;
    final stream = payload.stream;
    final cancelOnError = payload.cancelOnError;
    final sub = stream.listen((dynamic event) {
      print("got stream data $event");
      var field = store.getFieldFromAction(action) as StreamField;
      var list = field.dataList;
      if (payload.appendDataToList) {
        if (list.isEmpty) {
          // convert const list to mutable list
          list = list.toList();
        }
        list.add(event);
      }
      store.dispatch(action.copyWith(
          internal: ActionInternal(
        processed: true,
        data: field.copyWith(
            data: event, firstEventArrived: true, dataList: list, error: null),
        type: ActionInternalType.FIELD,
      )));
    },
        // cancelOnError: cancelOnError,
        onError: (dynamic e) {
      print("stream errored ${e} cancelOnError $cancelOnError");
      final field = store.getFieldFromAction(action) as StreamField;
      store.dispatch(action.copyWith(
          internal: ActionInternal(
        processed: true,
        data: field.copyWith(
            error: Optional<dynamic>(e),
            completed: cancelOnError ? true : false),
        type: ActionInternalType.FIELD,
      )));
    }, onDone: () {
      print("stream done");
      final field = store.getFieldFromAction(action) as StreamField;
      store.dispatch(action.copyWith(
          internal: ActionInternal(
        processed: true,
        data: field.copyWith(listening: false, completed: true),
        type: ActionInternalType.FIELD,
      )));
    });
    store.dispatch(action.copyWith(
        internal: ActionInternal(
            processed: true,
            type: ActionInternalType.FIELD,
            data: field.copyWith(internalSubscription: sub, listening: true))));
  }
}
