// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class DFirebaseAuth extends PStateModel<DFirebaseAuth> {
  final StreamField<User, Object> user;

  _$DFirebaseAuthCopyWith<DFirebaseAuth> get copyWith =>
      __$DFirebaseAuthCopyWithImpl<DFirebaseAuth>(this, IdentityFn);

  DFirebaseAuth({this.user = const StreamField()});

  @override
  DFirebaseAuth copyWithMap(Map<String, dynamic> map) => DFirebaseAuth(
      user: map.containsKey("user")
          ? map["user"] as StreamField<User, Object>
          : this.user);

  Map<String, dynamic> toMap() => <String, dynamic>{"user": this.user};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is DFirebaseAuth && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => "DFirebaseAuth(user: ${this.user})";
}

abstract class $DFirebaseAuthCopyWith<O> {
  factory $DFirebaseAuthCopyWith(
          DFirebaseAuth value, O Function(DFirebaseAuth) then) =
      _$DFirebaseAuthCopyWithImpl<O>;
  O call({StreamField<User, Object> user});
}

class _$DFirebaseAuthCopyWithImpl<O> implements $DFirebaseAuthCopyWith<O> {
  final DFirebaseAuth _value;
  final O Function(DFirebaseAuth) _then;
  _$DFirebaseAuthCopyWithImpl(this._value, this._then);

  @override
  O call({Object? user = dimmutable}) {
    return _then(_value.copyWith(
        user: user == dimmutable
            ? _value.user
            : user as StreamField<User, Object>));
  }
}

abstract class _$DFirebaseAuthCopyWith<O> implements $DFirebaseAuthCopyWith<O> {
  factory _$DFirebaseAuthCopyWith(
          DFirebaseAuth value, O Function(DFirebaseAuth) then) =
      __$DFirebaseAuthCopyWithImpl<O>;
  O call({StreamField<User, Object> user});
}

class __$DFirebaseAuthCopyWithImpl<O> extends _$DFirebaseAuthCopyWithImpl<O>
    implements _$DFirebaseAuthCopyWith<O> {
  __$DFirebaseAuthCopyWithImpl(
      DFirebaseAuth _value, O Function(DFirebaseAuth) _then)
      : super(_value, (v) => _then(v));

  @override
  DFirebaseAuth get _value => super._value;

  @override
  O call({Object? user = dimmutable}) {
    return _then(DFirebaseAuth(
        user: user == dimmutable
            ? _value.user
            : user as StreamField<User, Object>));
  }
}

const _DFirebaseAuth_FullPath = "/pstates/auth/DFirebaseAuth";

abstract class DFirebaseAuthActions {
  static Action<Iterable<User>> user(
      {required Stream<User> stream,
      bool cancelOnError = false,
      Iterable<User>? mock}) {
    return Action<Iterable<User>>(
        name: "user",
        type: _DFirebaseAuth_FullPath,
        mock: mock,
        stream:
            StreamPayload<User>(stream: stream, cancelOnError: cancelOnError));
  }

  static Action<Iterable<User>> userResult(Iterable<User> mock) {
    return Action<Iterable<User>>(
      name: "user",
      type: _DFirebaseAuth_FullPath,
      mock: mock,
    );
  }
}

DFirebaseAuth DFirebaseAuth_DS() => DFirebaseAuth(user: StreamField());

final DFirebaseAuthMeta = PStateMeta<DFirebaseAuth>(
    type: _DFirebaseAuth_FullPath, ds: DFirebaseAuth_DS);
