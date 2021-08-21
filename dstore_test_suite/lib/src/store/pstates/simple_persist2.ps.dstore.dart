// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_persist2.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
@JsonSerializable()
class SimplePersist2 extends PStateModel<SimplePersist2> {
  final int p2;

  _$SimplePersist2CopyWith<SimplePersist2> get copyWith =>
      __$SimplePersist2CopyWithImpl<SimplePersist2>(this, IdentityFn);

  SimplePersist2({this.p2 = 0});

  @override
  SimplePersist2 copyWithMap(Map<String, dynamic> map) =>
      SimplePersist2(p2: map.containsKey("p2") ? map["p2"] as int : this.p2);

  Map<String, dynamic> toMap() => <String, dynamic>{"p2": this.p2};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimplePersist2 && o.p2 == p2;
  }

  @override
  int get hashCode => p2.hashCode;

  @override
  String toString() => "SimplePersist2(p2: ${this.p2})";

  factory SimplePersist2.fromJson(Map<String, dynamic> json) =>
      _$SimplePersist2FromJson(json);

  Map<String, dynamic> toJson() => _$SimplePersist2ToJson(this);
}

abstract class $SimplePersist2CopyWith<O> {
  factory $SimplePersist2CopyWith(
          SimplePersist2 value, O Function(SimplePersist2) then) =
      _$SimplePersist2CopyWithImpl<O>;
  O call({int p2});
}

class _$SimplePersist2CopyWithImpl<O> implements $SimplePersist2CopyWith<O> {
  final SimplePersist2 _value;
  final O Function(SimplePersist2) _then;
  _$SimplePersist2CopyWithImpl(this._value, this._then);

  @override
  O call({Object? p2 = dimmutable}) {
    return _then(_value.copyWith(p2: p2 == dimmutable ? _value.p2 : p2 as int));
  }
}

abstract class _$SimplePersist2CopyWith<O>
    implements $SimplePersist2CopyWith<O> {
  factory _$SimplePersist2CopyWith(
          SimplePersist2 value, O Function(SimplePersist2) then) =
      __$SimplePersist2CopyWithImpl<O>;
  O call({int p2});
}

class __$SimplePersist2CopyWithImpl<O> extends _$SimplePersist2CopyWithImpl<O>
    implements _$SimplePersist2CopyWith<O> {
  __$SimplePersist2CopyWithImpl(
      SimplePersist2 _value, O Function(SimplePersist2) _then)
      : super(_value, (v) => _then(v));

  @override
  SimplePersist2 get _value => super._value;

  @override
  O call({Object? p2 = dimmutable}) {
    return _then(SimplePersist2(p2: p2 == dimmutable ? _value.p2 : p2 as int));
  }
}

const _SimplePersist2_FullPath =
    "/store/pstates/simple_persist2/SimplePersist2";

class SimplePersist2SetP2Result implements ToMap<SimplePersist2SetP2Result> {
  final int? p2;

  const SimplePersist2SetP2Result({this.p2});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (p2 != null) {
      map["p2"] = p2;
    }

    return map;
  }

  @override
  SimplePersist2SetP2Result copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimplePersist2Actions {
  static Action<SimplePersist2SetP2Result> setP2(
      {required int v, bool silent = false}) {
    return Action<SimplePersist2SetP2Result>(
        name: "setP2",
        silent: silent,
        type: _SimplePersist2_FullPath,
        payload: <String, dynamic>{
          "v": v,
        },
        isAsync: false);
  }

  static Action<SimplePersist2SetP2Result> setP2Mock(
      SimplePersist2SetP2Result mock) {
    return Action<SimplePersist2SetP2Result>(
        name: "setP2", type: _SimplePersist2_FullPath, mock: mock);
  }
}

dynamic SimplePersist2_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SimplePersist2;
  final name = _DstoreAction.name;
  switch (name) {
    case "setP2":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final v = _DstoreActionPayload["v"] as int;

        var _DStore_p2 = _DStoreState.p2;
        _DStore_p2 = v;
        return _DStoreState.copyWith(p2: _DStore_p2);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimplePersist2 SimplePersist2_DS() => SimplePersist2(p2: 0);

final SimplePersist2Meta = PStateMeta<SimplePersist2>(
    type: _SimplePersist2_FullPath,
    reducer: SimplePersist2_SyncReducer,
    ds: SimplePersist2_DS,
    sm: PStateStorageMeta<SimplePersist2, Map<String, dynamic>>(
        serializer: SimplePersist2StorageSerializer,
        deserializer: SimplePersist2StorageDeserializer));

dynamic SimplePersist2StorageSerializer(dynamic value) {
  final s = value as SimplePersist2;
  return s.toJson();
}

SimplePersist2 SimplePersist2StorageDeserializer(dynamic value) {
  return SimplePersist2.fromJson(value as Map<String, dynamic>);
}
