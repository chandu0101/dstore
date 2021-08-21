import 'package:dstore/src/action.dart';
import 'package:dstore/src/store.dart';

dynamic loggingMiddleware<S extends AppStateI<S>>(
    Store<S> store, Dispatch next, Action<dynamic> action) {
  print(action);
  next(action);
}
