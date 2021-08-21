import 'package:commerce/src/store/utils/validation_utils.dart';
import 'package:dstore/dstore.dart';
import "package:meta/meta.dart";

part "forms.dstore.dart";

@FormModel()
class $_LoginForm {
  @Validator(ValidationUtils.validateMobile)
  final String phonenUmber = "";
  final String otp = "";
}
