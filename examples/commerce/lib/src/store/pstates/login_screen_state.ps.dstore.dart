// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_state.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class LoginScreenState extends PStateModel<LoginScreenState> {
  final FormField<LoginForm> loginForm;

  final StreamField<FirebasePhoneVerification, Object> phoneVerification;

  _$LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      __$LoginScreenStateCopyWithImpl<LoginScreenState>(this, IdentityFn);

  LoginScreenState(
      {FormField<LoginForm>? loginForm,
      this.phoneVerification = const StreamField()})
      : loginForm = loginForm ??
            FormField(
                value: LoginForm(),
                validateOnChange: true,
                validators: LoginFormValidators);

  @override
  LoginScreenState copyWithMap(Map<String, dynamic> map) => LoginScreenState(
      loginForm: map.containsKey("loginForm")
          ? map["loginForm"] as FormField<LoginForm>
          : this.loginForm,
      phoneVerification: map.containsKey("phoneVerification")
          ? map["phoneVerification"]
              as StreamField<FirebasePhoneVerification, Object>
          : this.phoneVerification);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "loginForm": this.loginForm,
        "phoneVerification": this.phoneVerification
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LoginScreenState &&
        o.loginForm == loginForm &&
        o.phoneVerification == phoneVerification;
  }

  @override
  int get hashCode => loginForm.hashCode ^ phoneVerification.hashCode;

  @override
  String toString() =>
      "LoginScreenState(loginForm: ${this.loginForm}, phoneVerification: ${this.phoneVerification})";
}

abstract class $LoginScreenStateCopyWith<O> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, O Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<O>;
  O call(
      {FormField<LoginForm> loginForm,
      StreamField<FirebasePhoneVerification, Object> phoneVerification});
}

class _$LoginScreenStateCopyWithImpl<O>
    implements $LoginScreenStateCopyWith<O> {
  final LoginScreenState _value;
  final O Function(LoginScreenState) _then;
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? loginForm = dimmutable,
      Object? phoneVerification = dimmutable}) {
    return _then(_value.copyWith(
        loginForm: loginForm == dimmutable
            ? _value.loginForm
            : loginForm as FormField<LoginForm>,
        phoneVerification: phoneVerification == dimmutable
            ? _value.phoneVerification
            : phoneVerification
                as StreamField<FirebasePhoneVerification, Object>));
  }
}

abstract class _$LoginScreenStateCopyWith<O>
    implements $LoginScreenStateCopyWith<O> {
  factory _$LoginScreenStateCopyWith(
          LoginScreenState value, O Function(LoginScreenState) then) =
      __$LoginScreenStateCopyWithImpl<O>;
  O call(
      {FormField<LoginForm> loginForm,
      StreamField<FirebasePhoneVerification, Object> phoneVerification});
}

class __$LoginScreenStateCopyWithImpl<O>
    extends _$LoginScreenStateCopyWithImpl<O>
    implements _$LoginScreenStateCopyWith<O> {
  __$LoginScreenStateCopyWithImpl(
      LoginScreenState _value, O Function(LoginScreenState) _then)
      : super(_value, (v) => _then(v));

  @override
  LoginScreenState get _value => super._value;

  @override
  O call(
      {Object? loginForm = dimmutable,
      Object? phoneVerification = dimmutable}) {
    return _then(LoginScreenState(
        loginForm: loginForm == dimmutable
            ? _value.loginForm
            : loginForm as FormField<LoginForm>,
        phoneVerification: phoneVerification == dimmutable
            ? _value.phoneVerification
            : phoneVerification
                as StreamField<FirebasePhoneVerification, Object>));
  }
}

const _LoginScreenState_FullPath =
    "/store/pstates/login_screen_state/LoginScreenState";

abstract class LoginScreenStateActions {
  static Action<dynamic> loginForm(FormReq req) {
    return Action<dynamic>(
        name:
            "Field(Name : loginForm Type : FormField<LoginForm> Value : FormField(value: LoginForm(), validateOnChange: true, validators: LoginFormValidators) isOptional : false annotations : [] isNamed: false).name}",
        type: _LoginScreenState_FullPath,
        form: req);
  }

  static Action<Iterable<FirebasePhoneVerification>> phoneVerification(
      {required Stream<FirebasePhoneVerification> stream,
      bool cancelOnError = false,
      Iterable<FirebasePhoneVerification>? mock}) {
    return Action<Iterable<FirebasePhoneVerification>>(
        name: "phoneVerification",
        type: _LoginScreenState_FullPath,
        mock: mock,
        stream: StreamPayload(stream: stream, cancelOnError: cancelOnError));
  }
}

LoginScreenState LoginScreenState_DS() => LoginScreenState(
    loginForm: FormField(
        value: LoginForm(),
        validateOnChange: true,
        validators: LoginFormValidators,
        internalAName: "loginForm",
        internalAType: _LoginScreenState_FullPath),
    phoneVerification: StreamField());

final LoginScreenStateMeta = PStateMeta<LoginScreenState>(
    type: _LoginScreenState_FullPath, ds: LoginScreenState_DS);
