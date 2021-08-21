// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'models.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

class FirebasePhoneVerification {
  final dynamic _value;

  FirebasePhoneVerification.phoneAuthCredential(PhoneAuthCredential value)
      : _value = value;
  FirebasePhoneVerification.phoneVerificationFailed(FirebaseAuthException value)
      : _value = value;
  FirebasePhoneVerification.codeSent(
      {required String verificationId, int? forceResendingToken})
      : _value = _FirebasePhoneVerification_codeSent(
            verificationId: verificationId,
            forceResendingToken: forceResendingToken);
  FirebasePhoneVerification.codeAutoRetrievalTimeout(
      {required String verificationId})
      : _value = _FirebasePhoneVerification_codeAutoRetrievalTimeout(
            verificationId: verificationId);

  PhoneAuthCredential? get phoneAuthCredential =>
      _value is PhoneAuthCredential ? _value as PhoneAuthCredential : null;
  FirebaseAuthException? get phoneVerificationFailed =>
      _value is FirebaseAuthException ? _value as FirebaseAuthException : null;
  _FirebasePhoneVerification_codeSent? get codeSent =>
      _value is _FirebasePhoneVerification_codeSent
          ? _value as _FirebasePhoneVerification_codeSent
          : null;
  _FirebasePhoneVerification_codeAutoRetrievalTimeout?
      get codeAutoRetrievalTimeout =>
          _value is _FirebasePhoneVerification_codeAutoRetrievalTimeout
              ? _value as _FirebasePhoneVerification_codeAutoRetrievalTimeout
              : null;

  T when<T>(
      {required T Function(PhoneAuthCredential value) phoneAuthCredential,
      required T Function(FirebaseAuthException value) phoneVerificationFailed,
      required T Function(_FirebasePhoneVerification_codeSent value) codeSent,
      required T Function(
              _FirebasePhoneVerification_codeAutoRetrievalTimeout value)
          codeAutoRetrievalTimeout}) {
    if (_value is PhoneAuthCredential) {
      return phoneAuthCredential(_value as PhoneAuthCredential);
    } else if (_value is FirebaseAuthException) {
      return phoneVerificationFailed(_value as FirebaseAuthException);
    } else if (_value is _FirebasePhoneVerification_codeSent) {
      return codeSent(_value as _FirebasePhoneVerification_codeSent);
    } else {
      return codeAutoRetrievalTimeout(
          _value as _FirebasePhoneVerification_codeAutoRetrievalTimeout);
    }
  }
}

class _FirebasePhoneVerification_codeSent {
  final String verificationId;

  final int? forceResendingToken;

  _$_FirebasePhoneVerification_codeSentCopyWith<
          _FirebasePhoneVerification_codeSent>
      get copyWith => __$_FirebasePhoneVerification_codeSentCopyWithImpl<
          _FirebasePhoneVerification_codeSent>(this, IdentityFn);

  _FirebasePhoneVerification_codeSent(
      {required this.verificationId, this.forceResendingToken});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is _FirebasePhoneVerification_codeSent &&
        o.verificationId == verificationId &&
        o.forceResendingToken == forceResendingToken;
  }

  @override
  int get hashCode => verificationId.hashCode ^ forceResendingToken.hashCode;

  @override
  String toString() =>
      "_FirebasePhoneVerification_codeSent(verificationId: ${this.verificationId}, forceResendingToken: ${this.forceResendingToken})";
}

abstract class $_FirebasePhoneVerification_codeSentCopyWith<O> {
  factory $_FirebasePhoneVerification_codeSentCopyWith(
          _FirebasePhoneVerification_codeSent value,
          O Function(_FirebasePhoneVerification_codeSent) then) =
      _$_FirebasePhoneVerification_codeSentCopyWithImpl<O>;
  O call({String verificationId, int? forceResendingToken});
}

class _$_FirebasePhoneVerification_codeSentCopyWithImpl<O>
    implements $_FirebasePhoneVerification_codeSentCopyWith<O> {
  final _FirebasePhoneVerification_codeSent _value;
  final O Function(_FirebasePhoneVerification_codeSent) _then;
  _$_FirebasePhoneVerification_codeSentCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? verificationId = dimmutable,
      Object? forceResendingToken = dimmutable}) {
    return _then(_value.copyWith(
        verificationId: verificationId == dimmutable
            ? _value.verificationId
            : verificationId as String,
        forceResendingToken: forceResendingToken == dimmutable
            ? _value.forceResendingToken
            : forceResendingToken as int?));
  }
}

abstract class _$_FirebasePhoneVerification_codeSentCopyWith<O>
    implements $_FirebasePhoneVerification_codeSentCopyWith<O> {
  factory _$_FirebasePhoneVerification_codeSentCopyWith(
          _FirebasePhoneVerification_codeSent value,
          O Function(_FirebasePhoneVerification_codeSent) then) =
      __$_FirebasePhoneVerification_codeSentCopyWithImpl<O>;
  O call({String verificationId, int? forceResendingToken});
}

class __$_FirebasePhoneVerification_codeSentCopyWithImpl<O>
    extends _$_FirebasePhoneVerification_codeSentCopyWithImpl<O>
    implements _$_FirebasePhoneVerification_codeSentCopyWith<O> {
  __$_FirebasePhoneVerification_codeSentCopyWithImpl(
      _FirebasePhoneVerification_codeSent _value,
      O Function(_FirebasePhoneVerification_codeSent) _then)
      : super(_value, (v) => _then(v));

  @override
  _FirebasePhoneVerification_codeSent get _value => super._value;

  @override
  O call(
      {Object? verificationId = dimmutable,
      Object? forceResendingToken = dimmutable}) {
    return _then(_FirebasePhoneVerification_codeSent(
        verificationId: verificationId == dimmutable
            ? _value.verificationId
            : verificationId as String,
        forceResendingToken: forceResendingToken == dimmutable
            ? _value.forceResendingToken
            : forceResendingToken as int?));
  }
}

class _FirebasePhoneVerification_codeAutoRetrievalTimeout {
  final String verificationId;

  _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith<
          _FirebasePhoneVerification_codeAutoRetrievalTimeout>
      get copyWith =>
          __$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl<
                  _FirebasePhoneVerification_codeAutoRetrievalTimeout>(
              this, IdentityFn);

  _FirebasePhoneVerification_codeAutoRetrievalTimeout(
      {required this.verificationId});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is _FirebasePhoneVerification_codeAutoRetrievalTimeout &&
        o.verificationId == verificationId;
  }

  @override
  int get hashCode => verificationId.hashCode;

  @override
  String toString() =>
      "_FirebasePhoneVerification_codeAutoRetrievalTimeout(verificationId: ${this.verificationId})";
}

abstract class $_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith<O> {
  factory $_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith(
          _FirebasePhoneVerification_codeAutoRetrievalTimeout value,
          O Function(_FirebasePhoneVerification_codeAutoRetrievalTimeout)
              then) =
      _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl<O>;
  O call({String verificationId});
}

class _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl<O>
    implements $_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith<O> {
  final _FirebasePhoneVerification_codeAutoRetrievalTimeout _value;
  final O Function(_FirebasePhoneVerification_codeAutoRetrievalTimeout) _then;
  _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? verificationId = dimmutable}) {
    return _then(_value.copyWith(
        verificationId: verificationId == dimmutable
            ? _value.verificationId
            : verificationId as String));
  }
}

abstract class _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith<O>
    implements $_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith<O> {
  factory _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith(
          _FirebasePhoneVerification_codeAutoRetrievalTimeout value,
          O Function(_FirebasePhoneVerification_codeAutoRetrievalTimeout)
              then) =
      __$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl<O>;
  O call({String verificationId});
}

class __$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl<O>
    extends _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl<O>
    implements
        _$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWith<O> {
  __$_FirebasePhoneVerification_codeAutoRetrievalTimeoutCopyWithImpl(
      _FirebasePhoneVerification_codeAutoRetrievalTimeout _value,
      O Function(_FirebasePhoneVerification_codeAutoRetrievalTimeout) _then)
      : super(_value, (v) => _then(v));

  @override
  _FirebasePhoneVerification_codeAutoRetrievalTimeout get _value =>
      super._value;

  @override
  O call({Object? verificationId = dimmutable}) {
    return _then(_FirebasePhoneVerification_codeAutoRetrievalTimeout(
        verificationId: verificationId == dimmutable
            ? _value.verificationId
            : verificationId as String));
  }
}
