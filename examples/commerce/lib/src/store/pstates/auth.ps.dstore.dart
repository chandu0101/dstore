// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class Auth extends PStateModel<Auth> {
  final bool loggedout;

  final StreamField<User?, Object> user;

  final String? verificationId;

  final DocumentSnapshot? userDetails;

  final AsyncActionField getUserDetails;

  final AsyncActionField signout;

  _$AuthCopyWith<Auth> get copyWith =>
      __$AuthCopyWithImpl<Auth>(this, IdentityFn);

  Auth(
      {this.loggedout = false,
      this.user = const StreamField(),
      this.verificationId,
      this.userDetails,
      this.getUserDetails = const AsyncActionField(),
      this.signout = const AsyncActionField()});

  @override
  Auth copyWithMap(Map<String, dynamic> map) => Auth(
      loggedout: map.containsKey("loggedout")
          ? map["loggedout"] as bool
          : this.loggedout,
      user: map.containsKey("user")
          ? map["user"] as StreamField<User?, Object>
          : this.user,
      verificationId: map.containsKey("verificationId")
          ? map["verificationId"] as String?
          : this.verificationId,
      userDetails: map.containsKey("userDetails")
          ? map["userDetails"] as DocumentSnapshot?
          : this.userDetails,
      getUserDetails: map.containsKey("getUserDetails")
          ? map["getUserDetails"] as AsyncActionField
          : this.getUserDetails,
      signout: map.containsKey("signout")
          ? map["signout"] as AsyncActionField
          : this.signout);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "loggedout": this.loggedout,
        "user": this.user,
        "verificationId": this.verificationId,
        "userDetails": this.userDetails,
        "getUserDetails": this.getUserDetails,
        "signout": this.signout
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Auth &&
        o.loggedout == loggedout &&
        o.user == user &&
        o.verificationId == verificationId &&
        o.userDetails == userDetails &&
        o.getUserDetails == getUserDetails &&
        o.signout == signout;
  }

  @override
  int get hashCode =>
      loggedout.hashCode ^
      user.hashCode ^
      verificationId.hashCode ^
      userDetails.hashCode ^
      getUserDetails.hashCode ^
      signout.hashCode;

  @override
  String toString() =>
      "Auth(loggedout: ${this.loggedout}, user: ${this.user}, verificationId: ${this.verificationId}, userDetails: ${this.userDetails}, getUserDetails: ${this.getUserDetails}, signout: ${this.signout})";
}

abstract class $AuthCopyWith<O> {
  factory $AuthCopyWith(Auth value, O Function(Auth) then) =
      _$AuthCopyWithImpl<O>;
  O call(
      {bool loggedout,
      StreamField<User?, Object> user,
      String? verificationId,
      DocumentSnapshot? userDetails,
      AsyncActionField getUserDetails,
      AsyncActionField signout});
}

class _$AuthCopyWithImpl<O> implements $AuthCopyWith<O> {
  final Auth _value;
  final O Function(Auth) _then;
  _$AuthCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? loggedout = dimmutable,
      Object? user = dimmutable,
      Object? verificationId = dimmutable,
      Object? userDetails = dimmutable,
      Object? getUserDetails = dimmutable,
      Object? signout = dimmutable}) {
    return _then(_value.copyWith(
        loggedout:
            loggedout == dimmutable ? _value.loggedout : loggedout as bool,
        user: user == dimmutable
            ? _value.user
            : user as StreamField<User?, Object>,
        verificationId: verificationId == dimmutable
            ? _value.verificationId
            : verificationId as String?,
        userDetails: userDetails == dimmutable
            ? _value.userDetails
            : userDetails as DocumentSnapshot?,
        getUserDetails: getUserDetails == dimmutable
            ? _value.getUserDetails
            : getUserDetails as AsyncActionField,
        signout: signout == dimmutable
            ? _value.signout
            : signout as AsyncActionField));
  }
}

abstract class _$AuthCopyWith<O> implements $AuthCopyWith<O> {
  factory _$AuthCopyWith(Auth value, O Function(Auth) then) =
      __$AuthCopyWithImpl<O>;
  O call(
      {bool loggedout,
      StreamField<User?, Object> user,
      String? verificationId,
      DocumentSnapshot? userDetails,
      AsyncActionField getUserDetails,
      AsyncActionField signout});
}

class __$AuthCopyWithImpl<O> extends _$AuthCopyWithImpl<O>
    implements _$AuthCopyWith<O> {
  __$AuthCopyWithImpl(Auth _value, O Function(Auth) _then)
      : super(_value, (v) => _then(v));

  @override
  Auth get _value => super._value;

  @override
  O call(
      {Object? loggedout = dimmutable,
      Object? user = dimmutable,
      Object? verificationId = dimmutable,
      Object? userDetails = dimmutable,
      Object? getUserDetails = dimmutable,
      Object? signout = dimmutable}) {
    return _then(Auth(
        loggedout:
            loggedout == dimmutable ? _value.loggedout : loggedout as bool,
        user: user == dimmutable
            ? _value.user
            : user as StreamField<User?, Object>,
        verificationId: verificationId == dimmutable
            ? _value.verificationId
            : verificationId as String?,
        userDetails: userDetails == dimmutable
            ? _value.userDetails
            : userDetails as DocumentSnapshot?,
        getUserDetails: getUserDetails == dimmutable
            ? _value.getUserDetails
            : getUserDetails as AsyncActionField,
        signout: signout == dimmutable
            ? _value.signout
            : signout as AsyncActionField));
  }
}

const _Auth_FullPath = "/store/pstates/auth/Auth";

class AuthGetUserDetailsResult implements ToMap {
  final Optional<DocumentSnapshot?> userDetails;

  const AuthGetUserDetailsResult({this.userDetails = optionalDefault});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (userDetails != optionalDefault) {
      map["userDetails"] = userDetails.value;
    }

    return map;
  }
}

class AuthSignoutResult implements ToMap {
  final bool? loggedout;

  const AuthSignoutResult({this.loggedout});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (loggedout != null) {
      map["loggedout"] = loggedout;
    }

    return map;
  }
}

class AuthSetVerificationIdResult implements ToMap {
  final Optional<String?> verificationId;

  const AuthSetVerificationIdResult({this.verificationId = optionalDefault});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (verificationId != optionalDefault) {
      map["verificationId"] = verificationId.value;
    }

    return map;
  }
}

abstract class AuthActions {
  static Action<AuthGetUserDetailsResult> getUserDetails(
      {Duration? debounce, bool silent = false}) {
    return Action<AuthGetUserDetailsResult>(
        name: "getUserDetails",
        silent: silent,
        type: _Auth_FullPath,
        isAsync: true,
        debounce: debounce);
  }

  static Action<AuthGetUserDetailsResult> getUserDetailsMock(
      AuthGetUserDetailsResult mock) {
    return Action<AuthGetUserDetailsResult>(
        name: "getUserDetails", type: _Auth_FullPath, mock: mock);
  }

  static Action<AuthSignoutResult> signout(
      {Duration? debounce, bool silent = false}) {
    return Action<AuthSignoutResult>(
        name: "signout",
        silent: silent,
        type: _Auth_FullPath,
        isAsync: true,
        debounce: debounce);
  }

  static Action<AuthSignoutResult> signoutMock(AuthSignoutResult mock) {
    return Action<AuthSignoutResult>(
        name: "signout", type: _Auth_FullPath, mock: mock);
  }

  static Action<AuthSetVerificationIdResult> setVerificationId(
      {required String verificationId, bool silent = false}) {
    return Action<AuthSetVerificationIdResult>(
        name: "setVerificationId",
        silent: silent,
        type: _Auth_FullPath,
        payload: <String, dynamic>{"verificationId": verificationId},
        isAsync: false);
  }

  static Action<AuthSetVerificationIdResult> setVerificationIdMock(
      AuthSetVerificationIdResult mock) {
    return Action<AuthSetVerificationIdResult>(
        name: "setVerificationId", type: _Auth_FullPath, mock: mock);
  }

  static Action<Iterable<User?>> user(
      {required Stream<User?> stream,
      bool cancelOnError = false,
      Iterable<User?>? mock}) {
    return Action<Iterable<User?>>(
        name: "user",
        type: _Auth_FullPath,
        mock: mock,
        stream: StreamPayload(stream: stream, cancelOnError: cancelOnError));
  }
}

dynamic Auth_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as Auth;
  final name = _DstoreAction.name;
  switch (name) {
    case "setVerificationId":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final verificationId = _DstoreActionPayload["verificationId"] as String;

        var _DStore_verificationId = _DStoreState.verificationId;
        _DStore_verificationId = verificationId;
        return _DStoreState.copyWith(verificationId: _DStore_verificationId);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

Future<dynamic> Auth_AsyncReducer(
    dynamic _DStoreState, Action _DstoreAction) async {
  _DStoreState = _DStoreState as Auth;
  final name = _DstoreAction.name;
  switch (name) {
    case "getUserDetails":
      {
        var _DStore_userDetails = _DStoreState.userDetails;
        final documentSnapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(_DStoreState.user.data!.uid)
            .collection("account")
            .doc("details")
            .get();
        _DStore_userDetails = documentSnapshot;
        return _DStoreState.copyWith(userDetails: _DStore_userDetails);
      }

    case "signout":
      {
        var _DStore_loggedout = _DStoreState.loggedout;
        await FirebaseAuth.instance.signOut();
        _DStore_loggedout = true;
        return _DStoreState.copyWith(loggedout: _DStore_loggedout);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

Auth Auth_DS() => Auth(
    loggedout: false,
    user: StreamField(),
    verificationId: null,
    userDetails: null,
    getUserDetails: AsyncActionField(),
    signout: AsyncActionField());

final AuthMeta = PStateMeta<Auth>(
    type: _Auth_FullPath,
    reducer: Auth_SyncReducer,
    aReducer: Auth_AsyncReducer,
    ds: Auth_DS);
