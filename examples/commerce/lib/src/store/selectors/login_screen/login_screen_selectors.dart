import 'package:commerce/src/store/app_state.dart';
import 'package:commerce/src/store/models/forms.dart';
import 'package:commerce/src/store/pstates/login_screen_state.dart';
import 'package:dstore/dstore.dart';
part 'login_screen_selectors.dstore.dart';

@Selectors()
class $_LoginScreenSelectors {
  static FormField<LoginForm> loginForm(AppState state) {
    return state.loginScreen.loginForm;
  }
}
