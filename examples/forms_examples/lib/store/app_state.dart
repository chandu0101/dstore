import 'package:dstore/dstore.dart';
import 'package:forms_examples/store/pstates/form_state.dart';

part "app_state.dstore.dart";

@AppStateAnnotation()
void $_AppState(FormState formState) {}

final store = createStore(
    handleError: (e) {
      print("Error in store $e");
    },
    middlewares: [formMiddleware]);
