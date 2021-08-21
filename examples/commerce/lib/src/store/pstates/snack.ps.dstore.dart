// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SnackState extends PStateModel<SnackState> {
  final String message;

  _$SnackStateCopyWith<SnackState> get copyWith =>
      __$SnackStateCopyWithImpl<SnackState>(this, IdentityFn);

  SnackState({this.message = ""});

  @override
  SnackState copyWithMap(Map<String, dynamic> map) => SnackState(
      message:
          map.containsKey("message") ? map["message"] as String : this.message);

  Map<String, dynamic> toMap() => <String, dynamic>{"message": this.message};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SnackState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => "SnackState(message: ${this.message})";
}

abstract class $SnackStateCopyWith<O> {
  factory $SnackStateCopyWith(SnackState value, O Function(SnackState) then) =
      _$SnackStateCopyWithImpl<O>;
  O call({String message});
}

class _$SnackStateCopyWithImpl<O> implements $SnackStateCopyWith<O> {
  final SnackState _value;
  final O Function(SnackState) _then;
  _$SnackStateCopyWithImpl(this._value, this._then);

  @override
  O call({Object? message = dimmutable}) {
    return _then(_value.copyWith(
        message: message == dimmutable ? _value.message : message as String));
  }
}

abstract class _$SnackStateCopyWith<O> implements $SnackStateCopyWith<O> {
  factory _$SnackStateCopyWith(SnackState value, O Function(SnackState) then) =
      __$SnackStateCopyWithImpl<O>;
  O call({String message});
}

class __$SnackStateCopyWithImpl<O> extends _$SnackStateCopyWithImpl<O>
    implements _$SnackStateCopyWith<O> {
  __$SnackStateCopyWithImpl(SnackState _value, O Function(SnackState) _then)
      : super(_value, (v) => _then(v));

  @override
  SnackState get _value => super._value;

  @override
  O call({Object? message = dimmutable}) {
    return _then(SnackState(
        message: message == dimmutable ? _value.message : message as String));
  }
}

const _SnackState_FullPath = "/store/pstates/snack/SnackState";

class SnackStateSetMessageResult implements ToMap {
  final String? message;

  const SnackStateSetMessageResult({this.message});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (message != null) {
      map["message"] = message;
    }

    return map;
  }
}

abstract class SnackStateActions {
  static Action<SnackStateSetMessageResult> setMessage(
      {required String message, bool silent = false}) {
    return Action<SnackStateSetMessageResult>(
        name: "setMessage",
        silent: silent,
        type: _SnackState_FullPath,
        payload: <String, dynamic>{"message": message},
        isAsync: false);
  }

  static Action<SnackStateSetMessageResult> setMessageMock(
      SnackStateSetMessageResult mock) {
    return Action<SnackStateSetMessageResult>(
        name: "setMessage", type: _SnackState_FullPath, mock: mock);
  }
}

dynamic SnackState_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SnackState;
  final name = _DstoreAction.name;
  switch (name) {
    case "setMessage":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final message = _DstoreActionPayload["message"] as String;

        var _DStore_message = _DStoreState.message;
        _DStore_message = message;
        return _DStoreState.copyWith(message: _DStore_message);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SnackState SnackState_DS() => SnackState(message: "");

final SnackStateMeta = PStateMeta<SnackState>(
    type: _SnackState_FullPath,
    reducer: SnackState_SyncReducer,
    ds: SnackState_DS);
