import 'package:commerce/src/store/pstates/auth.dart';
import 'package:commerce/src/store/pstates/login_screen_state.dart';
import 'package:commerce/src/store/pstates/snack.dart';
import 'package:dstore/dstore.dart';

part "app_state.dstore.dart";

@AppStateAnnotation()
void $_AppState(Auth auth, LoginScreenState loginScreen, SnackState snack) {}

final Store<AppState> store = createStore(
    handleError: (derror) {
      print("Error ${derror.e}");
      print("Stacktrace ${derror.st}");
      store.dispatch(
          SnackStateActions.setMessage(message: "Something went wrong :("));
      // throw derror.e;
    },
    middlewares: [loggingMiddleware, formMiddleware, streamMiddleware]);
