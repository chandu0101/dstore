// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_persist3_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
@JsonSerializable()
class SimplePersist3 extends PStateModel<SimplePersist3> {
  final int p3;

  _$SimplePersist3CopyWith<SimplePersist3> get copyWith =>
      __$SimplePersist3CopyWithImpl<SimplePersist3>(this, IdentityFn);

  SimplePersist3({this.p3 = 0});

  @override
  SimplePersist3 copyWithMap(Map<String, dynamic> map) =>
      SimplePersist3(p3: map.containsKey("p3") ? map["p3"] as int : this.p3);

  Map<String, dynamic> toMap() => <String, dynamic>{"p3": this.p3};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimplePersist3 && o.p3 == p3;
  }

  @override
  int get hashCode => p3.hashCode;

  @override
  String toString() => "SimplePersist3(p3: ${this.p3})";

  factory SimplePersist3.fromJson(Map<String, dynamic> json) =>
      _$SimplePersist3FromJson(json);

  Map<String, dynamic> toJson() => _$SimplePersist3ToJson(this);
}

abstract class $SimplePersist3CopyWith<O> {
  factory $SimplePersist3CopyWith(
          SimplePersist3 value, O Function(SimplePersist3) then) =
      _$SimplePersist3CopyWithImpl<O>;
  O call({int p3});
}

class _$SimplePersist3CopyWithImpl<O> implements $SimplePersist3CopyWith<O> {
  final SimplePersist3 _value;
  final O Function(SimplePersist3) _then;
  _$SimplePersist3CopyWithImpl(this._value, this._then);

  @override
  O call({Object? p3 = dimmutable}) {
    return _then(_value.copyWith(p3: p3 == dimmutable ? _value.p3 : p3 as int));
  }
}

abstract class _$SimplePersist3CopyWith<O>
    implements $SimplePersist3CopyWith<O> {
  factory _$SimplePersist3CopyWith(
          SimplePersist3 value, O Function(SimplePersist3) then) =
      __$SimplePersist3CopyWithImpl<O>;
  O call({int p3});
}

class __$SimplePersist3CopyWithImpl<O> extends _$SimplePersist3CopyWithImpl<O>
    implements _$SimplePersist3CopyWith<O> {
  __$SimplePersist3CopyWithImpl(
      SimplePersist3 _value, O Function(SimplePersist3) _then)
      : super(_value, (v) => _then(v));

  @override
  SimplePersist3 get _value => super._value;

  @override
  O call({Object? p3 = dimmutable}) {
    return _then(SimplePersist3(p3: p3 == dimmutable ? _value.p3 : p3 as int));
  }
}

const _SimplePersist3_FullPath =
    "/store/pstates/simple_persist3_ps/SimplePersist3";

class SimplePersist3SetP3Result implements ToMap<SimplePersist3SetP3Result> {
  final int? p3;

  const SimplePersist3SetP3Result({this.p3});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (p3 != null) {
      map["p3"] = p3;
    }

    return map;
  }

  @override
  SimplePersist3SetP3Result copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimplePersist3Actions {
  static Action<SimplePersist3SetP3Result> setP3(
      {required int v, bool silent = false}) {
    return Action<SimplePersist3SetP3Result>(
        name: "setP3",
        silent: silent,
        type: _SimplePersist3_FullPath,
        payload: <String, dynamic>{
          "v": v,
        },
        isAsync: false);
  }

  static Action<SimplePersist3SetP3Result> setP3Mock(
      SimplePersist3SetP3Result mock) {
    return Action<SimplePersist3SetP3Result>(
        name: "setP3", type: _SimplePersist3_FullPath, mock: mock);
  }
}

dynamic SimplePersist3_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SimplePersist3;
  final name = _DstoreAction.name;
  switch (name) {
    case "setP3":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final v = _DstoreActionPayload["v"] as int;

        var _DStore_p3 = _DStoreState.p3;
        _DStore_p3 = v;
        return _DStoreState.copyWith(p3: _DStore_p3);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimplePersist3 SimplePersist3_DS() => SimplePersist3(p3: 0);

final SimplePersist3Meta = PStateMeta<SimplePersist3>(
    type: _SimplePersist3_FullPath,
    reducer: SimplePersist3_SyncReducer,
    ds: SimplePersist3_DS,
    sm: PStateStorageMeta<SimplePersist3, Map<String, dynamic>>(
        serializer: SimplePersist3StorageSerializer,
        deserializer: SimplePersist3StorageDeserializer));

dynamic SimplePersist3StorageSerializer(dynamic value) {
  final s = value as SimplePersist3;
  return s.toJson();
}

SimplePersist3 SimplePersist3StorageDeserializer(dynamic value) {
  return SimplePersist3.fromJson(value as Map<String, dynamic>);
}
