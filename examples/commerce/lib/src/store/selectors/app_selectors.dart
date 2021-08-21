import 'package:commerce/src/store/app_state.dart';
import 'package:commerce/src/store/pstates/auth.dart';
import 'package:commerce/src/store/pstates/login_screen_state.dart';
import 'package:commerce/src/store/pstates/snack.dart';
import 'package:dstore/dstore.dart';
part 'app_selectors.dstore.dart';

@Selectors()
class $_AppSelectors {
  static SnackState snack(AppState state) => state.snack;
  static Auth auth(AppState state) => state.auth;

  static LoginScreenState loginScreen(AppState state) {
    return state.loginScreen;
  }
}
