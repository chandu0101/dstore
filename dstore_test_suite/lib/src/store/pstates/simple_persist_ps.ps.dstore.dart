// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_persist_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
@JsonSerializable()
class SimplePersist extends PStateModel<SimplePersist> {
  final int x;

  _$SimplePersistCopyWith<SimplePersist> get copyWith =>
      __$SimplePersistCopyWithImpl<SimplePersist>(this, IdentityFn);

  SimplePersist({this.x = 0});

  @override
  SimplePersist copyWithMap(Map<String, dynamic> map) =>
      SimplePersist(x: map.containsKey("x") ? map["x"] as int : this.x);

  Map<String, dynamic> toMap() => <String, dynamic>{"x": this.x};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimplePersist && o.x == x;
  }

  @override
  int get hashCode => x.hashCode;

  @override
  String toString() => "SimplePersist(x: ${this.x})";

  factory SimplePersist.fromJson(Map<String, dynamic> json) =>
      _$SimplePersistFromJson(json);

  Map<String, dynamic> toJson() => _$SimplePersistToJson(this);
}

abstract class $SimplePersistCopyWith<O> {
  factory $SimplePersistCopyWith(
          SimplePersist value, O Function(SimplePersist) then) =
      _$SimplePersistCopyWithImpl<O>;
  O call({int x});
}

class _$SimplePersistCopyWithImpl<O> implements $SimplePersistCopyWith<O> {
  final SimplePersist _value;
  final O Function(SimplePersist) _then;
  _$SimplePersistCopyWithImpl(this._value, this._then);

  @override
  O call({Object? x = dimmutable}) {
    return _then(_value.copyWith(x: x == dimmutable ? _value.x : x as int));
  }
}

abstract class _$SimplePersistCopyWith<O> implements $SimplePersistCopyWith<O> {
  factory _$SimplePersistCopyWith(
          SimplePersist value, O Function(SimplePersist) then) =
      __$SimplePersistCopyWithImpl<O>;
  O call({int x});
}

class __$SimplePersistCopyWithImpl<O> extends _$SimplePersistCopyWithImpl<O>
    implements _$SimplePersistCopyWith<O> {
  __$SimplePersistCopyWithImpl(
      SimplePersist _value, O Function(SimplePersist) _then)
      : super(_value, (v) => _then(v));

  @override
  SimplePersist get _value => super._value;

  @override
  O call({Object? x = dimmutable}) {
    return _then(SimplePersist(x: x == dimmutable ? _value.x : x as int));
  }
}

const _SimplePersist_FullPath =
    "/store/pstates/simple_persist_ps/SimplePersist";

class SimplePersistSetXResult implements ToMap<SimplePersistSetXResult> {
  final int? x;

  const SimplePersistSetXResult({this.x});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (x != null) {
      map["x"] = x;
    }

    return map;
  }

  @override
  SimplePersistSetXResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimplePersistActions {
  static Action<SimplePersistSetXResult> setX(
      {required int v, bool silent = false}) {
    return Action<SimplePersistSetXResult>(
        name: "setX",
        silent: silent,
        type: _SimplePersist_FullPath,
        payload: <String, dynamic>{
          "v": v,
        },
        isAsync: false);
  }

  static Action<SimplePersistSetXResult> setXMock(
      SimplePersistSetXResult mock) {
    return Action<SimplePersistSetXResult>(
        name: "setX", type: _SimplePersist_FullPath, mock: mock);
  }
}

dynamic SimplePersist_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SimplePersist;
  final name = _DstoreAction.name;
  switch (name) {
    case "setX":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final v = _DstoreActionPayload["v"] as int;

        var _DStore_x = _DStoreState.x;
        _DStore_x = v;
        return _DStoreState.copyWith(x: _DStore_x);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimplePersist SimplePersist_DS() => SimplePersist(x: 0);

final SimplePersistMeta = PStateMeta<SimplePersist>(
    type: _SimplePersist_FullPath,
    reducer: SimplePersist_SyncReducer,
    ds: SimplePersist_DS,
    sm: PStateStorageMeta<SimplePersist, Map<String, dynamic>>(
        serializer: SimplePersistStorageSerializer,
        deserializer: SimplePersistStorageDeserializer));

dynamic SimplePersistStorageSerializer(dynamic value) {
  final s = value as SimplePersist;
  return s.toJson();
}

SimplePersist SimplePersistStorageDeserializer(dynamic value) {
  return SimplePersist.fromJson(value as Map<String, dynamic>);
}
