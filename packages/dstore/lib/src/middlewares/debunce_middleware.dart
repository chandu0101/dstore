import 'dart:async';

import 'package:dstore/src/action.dart';
import 'package:dstore/src/store.dart';

dynamic debounceMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) async {
  print("debounceMiddleware $action");
  if (action.isProcessed || action.debounce == null) {
    next(action);
    return;
  } else {
    final duration = action.debounce!;
    final id = action.id;
    if (duration == Duration.zero) {
      // if duration is zero then execute immediatley
      store.internalDebounceTimers[id]?.cancel();
      store.internalDebounceTimers.remove(id);
      next(action);
      return;
    } else {
      print("prev timer ${store.internalDebounceTimers[id]}");
      store.internalDebounceTimers[id]?.cancel();
      store.internalDebounceTimers[id] = Timer(duration, () {
        store.internalDebounceTimers[id]?.cancel();
        store.internalDebounceTimers.remove(id);
        print("prcoessing debounce action $action");
        next(action);
        return;
      });
    }
  }
}
