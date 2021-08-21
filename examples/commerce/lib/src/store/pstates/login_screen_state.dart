import 'package:commerce/src/store/models/forms.dart';
import 'package:commerce/src/store/utils/validation_utils.dart';
import 'package:dstore/dstore.dart';
import 'package:dstore_firebase/firebase.dart';
import 'package:meta/meta.dart';
part 'login_screen_state.ps.dstore.dart';

@PState()
class $_LoginScreenState {
  FormField<LoginForm> loginForm = FormField(
      value: LoginForm(),
      validateOnChange: true,
      validators: LoginFormValidators);

  StreamField<FirebasePhoneVerification, Object> phoneVerification =
      StreamField();
}
