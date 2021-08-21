// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_flutter_selectors.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleFlutterSelectors extends PStateModel<SimpleFlutterSelectors> {
  final int count;

  _$SimpleFlutterSelectorsCopyWith<SimpleFlutterSelectors> get copyWith =>
      __$SimpleFlutterSelectorsCopyWithImpl<SimpleFlutterSelectors>(
          this, IdentityFn);

  SimpleFlutterSelectors({this.count = 0});

  @override
  SimpleFlutterSelectors copyWithMap(Map<String, dynamic> map) =>
      SimpleFlutterSelectors(
          count: map.containsKey("count") ? map["count"] as int : this.count);

  Map<String, dynamic> toMap() => <String, dynamic>{"count": this.count};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleFlutterSelectors && o.count == count;
  }

  @override
  int get hashCode => count.hashCode;

  @override
  String toString() => "SimpleFlutterSelectors(count: ${this.count})";
}

abstract class $SimpleFlutterSelectorsCopyWith<O> {
  factory $SimpleFlutterSelectorsCopyWith(SimpleFlutterSelectors value,
          O Function(SimpleFlutterSelectors) then) =
      _$SimpleFlutterSelectorsCopyWithImpl<O>;
  O call({int count});
}

class _$SimpleFlutterSelectorsCopyWithImpl<O>
    implements $SimpleFlutterSelectorsCopyWith<O> {
  final SimpleFlutterSelectors _value;
  final O Function(SimpleFlutterSelectors) _then;
  _$SimpleFlutterSelectorsCopyWithImpl(this._value, this._then);

  @override
  O call({Object? count = dimmutable}) {
    return _then(_value.copyWith(
        count: count == dimmutable ? _value.count : count as int));
  }
}

abstract class _$SimpleFlutterSelectorsCopyWith<O>
    implements $SimpleFlutterSelectorsCopyWith<O> {
  factory _$SimpleFlutterSelectorsCopyWith(SimpleFlutterSelectors value,
          O Function(SimpleFlutterSelectors) then) =
      __$SimpleFlutterSelectorsCopyWithImpl<O>;
  O call({int count});
}

class __$SimpleFlutterSelectorsCopyWithImpl<O>
    extends _$SimpleFlutterSelectorsCopyWithImpl<O>
    implements _$SimpleFlutterSelectorsCopyWith<O> {
  __$SimpleFlutterSelectorsCopyWithImpl(
      SimpleFlutterSelectors _value, O Function(SimpleFlutterSelectors) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleFlutterSelectors get _value => super._value;

  @override
  O call({Object? count = dimmutable}) {
    return _then(SimpleFlutterSelectors(
        count: count == dimmutable ? _value.count : count as int));
  }
}

const _SimpleFlutterSelectors_FullPath =
    "/store/pstates/selectors/simple_flutter_selectors/SimpleFlutterSelectors";

class SimpleFlutterSelectorsIncrementResult
    implements ToMap<SimpleFlutterSelectorsIncrementResult> {
  final int? count;

  const SimpleFlutterSelectorsIncrementResult({this.count});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (count != null) {
      map["count"] = count;
    }

    return map;
  }

  @override
  SimpleFlutterSelectorsIncrementResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimpleFlutterSelectorsActions {
  static Action<SimpleFlutterSelectorsIncrementResult> increment(
      {bool silent = false}) {
    return Action<SimpleFlutterSelectorsIncrementResult>(
        name: "increment",
        silent: silent,
        type: _SimpleFlutterSelectors_FullPath,
        isAsync: false);
  }

  static Action<SimpleFlutterSelectorsIncrementResult> incrementMock(
      SimpleFlutterSelectorsIncrementResult mock) {
    return Action<SimpleFlutterSelectorsIncrementResult>(
        name: "increment", type: _SimpleFlutterSelectors_FullPath, mock: mock);
  }
}

dynamic SimpleFlutterSelectors_SyncReducer(
    dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SimpleFlutterSelectors;
  final name = _DstoreAction.name;
  switch (name) {
    case "increment":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_count = _DStoreState.count;
        _DStore_count += 1;
        return _DStoreState.copyWith(count: _DStore_count);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimpleFlutterSelectors SimpleFlutterSelectors_DS() =>
    SimpleFlutterSelectors(count: 0);

final SimpleFlutterSelectorsMeta = PStateMeta<SimpleFlutterSelectors>(
    type: _SimpleFlutterSelectors_FullPath,
    reducer: SimpleFlutterSelectors_SyncReducer,
    ds: SimpleFlutterSelectors_DS);
