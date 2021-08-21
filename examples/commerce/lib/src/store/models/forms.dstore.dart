// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'forms.dart';

// **************************************************************************
// FormModelGenerator
// **************************************************************************

@immutable
class LoginForm implements FormFieldObject<LoginForm> {
  @Validator(ValidationUtils.validateMobile)
  final String phonenUmber;

  final String otp;

  _$LoginFormCopyWith<LoginForm> get copyWith =>
      __$LoginFormCopyWithImpl<LoginForm>(this, IdentityFn);

  const LoginForm({this.phonenUmber = "", this.otp = ""});

  @override
  LoginForm copyWithMap(Map<String, dynamic> map) => LoginForm(
      phonenUmber: map.containsKey("phonenUmber")
          ? map["phonenUmber"] as String
          : this.phonenUmber,
      otp: map.containsKey("otp") ? map["otp"] as String : this.otp);

  Map<String, dynamic> toMap() =>
      <String, dynamic>{"phonenUmber": this.phonenUmber, "otp": this.otp};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LoginForm && o.phonenUmber == phonenUmber && o.otp == otp;
  }

  @override
  int get hashCode => phonenUmber.hashCode ^ otp.hashCode;

  @override
  String toString() =>
      "LoginForm(phonenUmber: ${this.phonenUmber}, otp: ${this.otp})";
}

abstract class $LoginFormCopyWith<O> {
  factory $LoginFormCopyWith(LoginForm value, O Function(LoginForm) then) =
      _$LoginFormCopyWithImpl<O>;
  O call({String phonenUmber, String otp});
}

class _$LoginFormCopyWithImpl<O> implements $LoginFormCopyWith<O> {
  final LoginForm _value;
  final O Function(LoginForm) _then;
  _$LoginFormCopyWithImpl(this._value, this._then);

  @override
  O call({Object? phonenUmber = dimmutable, Object? otp = dimmutable}) {
    return _then(_value.copyWith(
        phonenUmber: phonenUmber == dimmutable
            ? _value.phonenUmber
            : phonenUmber as String,
        otp: otp == dimmutable ? _value.otp : otp as String));
  }
}

abstract class _$LoginFormCopyWith<O> implements $LoginFormCopyWith<O> {
  factory _$LoginFormCopyWith(LoginForm value, O Function(LoginForm) then) =
      __$LoginFormCopyWithImpl<O>;
  O call({String phonenUmber, String otp});
}

class __$LoginFormCopyWithImpl<O> extends _$LoginFormCopyWithImpl<O>
    implements _$LoginFormCopyWith<O> {
  __$LoginFormCopyWithImpl(LoginForm _value, O Function(LoginForm) _then)
      : super(_value, (v) => _then(v));

  @override
  LoginForm get _value => super._value;

  @override
  O call({Object? phonenUmber = dimmutable, Object? otp = dimmutable}) {
    return _then(LoginForm(
        phonenUmber: phonenUmber == dimmutable
            ? _value.phonenUmber
            : phonenUmber as String,
        otp: otp == dimmutable ? _value.otp : otp as String));
  }
}

enum LoginFormKey { phonenUmber, otp }

const LoginFormValidators = <String, Function>{
  "phonenUmber": ValidationUtils.validateMobile
};
