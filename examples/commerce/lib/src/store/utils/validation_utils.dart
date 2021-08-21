import 'package:commerce/src/store/models/forms.dart';

abstract class ValidationUtils {
  static String? validateMobile(String value, LoginForm fv) {
    var pattern = r'(^[0-9]*$)';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Phone number is Required";
    } else if (value.length != 10) {
      return "Phone number must be 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Phone number must be digits";
    }
  }
}
