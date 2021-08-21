import 'package:basic/src/store/pstates/simple_ps.dart';
import 'package:dstore/dstore.dart';
part "app_state.dstore.dart";

@AppStateAnnotation()
void $_AppState(SimplePS simplePS) {}

final store = createStore(handleError: (error) {
  print("Uncaught exception in store $error");
});
