// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_async_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleAsync extends PStateModel<SimpleAsync> {
  final int x;

  final AsyncActionField delayedSet;

  final AsyncActionField shouldCatchErrors;

  @RegularMethod()
  Future<dynamic> delay(int milliseconds) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    print("after delay");
  }

  _$SimpleAsyncCopyWith<SimpleAsync> get copyWith =>
      __$SimpleAsyncCopyWithImpl<SimpleAsync>(this, IdentityFn);

  SimpleAsync(
      {this.x = 0,
      this.delayedSet = const AsyncActionField(),
      this.shouldCatchErrors = const AsyncActionField()});

  @override
  SimpleAsync copyWithMap(Map<String, dynamic> map) => SimpleAsync(
      x: map.containsKey("x") ? map["x"] as int : this.x,
      delayedSet: map.containsKey("delayedSet")
          ? map["delayedSet"] as AsyncActionField
          : this.delayedSet,
      shouldCatchErrors: map.containsKey("shouldCatchErrors")
          ? map["shouldCatchErrors"] as AsyncActionField
          : this.shouldCatchErrors);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "x": this.x,
        "delayedSet": this.delayedSet,
        "shouldCatchErrors": this.shouldCatchErrors
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleAsync &&
        o.x == x &&
        o.delayedSet == delayedSet &&
        o.shouldCatchErrors == shouldCatchErrors;
  }

  @override
  int get hashCode =>
      x.hashCode ^ delayedSet.hashCode ^ shouldCatchErrors.hashCode;

  @override
  String toString() =>
      "SimpleAsync(x: ${this.x}, delayedSet: ${this.delayedSet}, shouldCatchErrors: ${this.shouldCatchErrors})";
}

abstract class $SimpleAsyncCopyWith<O> {
  factory $SimpleAsyncCopyWith(
          SimpleAsync value, O Function(SimpleAsync) then) =
      _$SimpleAsyncCopyWithImpl<O>;
  O call(
      {int x, AsyncActionField delayedSet, AsyncActionField shouldCatchErrors});
}

class _$SimpleAsyncCopyWithImpl<O> implements $SimpleAsyncCopyWith<O> {
  final SimpleAsync _value;
  final O Function(SimpleAsync) _then;
  _$SimpleAsyncCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? x = dimmutable,
      Object? delayedSet = dimmutable,
      Object? shouldCatchErrors = dimmutable}) {
    return _then(_value.copyWith(
        x: x == dimmutable ? _value.x : x as int,
        delayedSet: delayedSet == dimmutable
            ? _value.delayedSet
            : delayedSet as AsyncActionField,
        shouldCatchErrors: shouldCatchErrors == dimmutable
            ? _value.shouldCatchErrors
            : shouldCatchErrors as AsyncActionField));
  }
}

abstract class _$SimpleAsyncCopyWith<O> implements $SimpleAsyncCopyWith<O> {
  factory _$SimpleAsyncCopyWith(
          SimpleAsync value, O Function(SimpleAsync) then) =
      __$SimpleAsyncCopyWithImpl<O>;
  O call(
      {int x, AsyncActionField delayedSet, AsyncActionField shouldCatchErrors});
}

class __$SimpleAsyncCopyWithImpl<O> extends _$SimpleAsyncCopyWithImpl<O>
    implements _$SimpleAsyncCopyWith<O> {
  __$SimpleAsyncCopyWithImpl(SimpleAsync _value, O Function(SimpleAsync) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleAsync get _value => super._value;

  @override
  O call(
      {Object? x = dimmutable,
      Object? delayedSet = dimmutable,
      Object? shouldCatchErrors = dimmutable}) {
    return _then(SimpleAsync(
        x: x == dimmutable ? _value.x : x as int,
        delayedSet: delayedSet == dimmutable
            ? _value.delayedSet
            : delayedSet as AsyncActionField,
        shouldCatchErrors: shouldCatchErrors == dimmutable
            ? _value.shouldCatchErrors
            : shouldCatchErrors as AsyncActionField));
  }
}

const _SimpleAsync_FullPath = "/store/pstates/simple_async_ps/SimpleAsync";

class SimpleAsyncDelayedSetResult
    implements ToMap<SimpleAsyncDelayedSetResult> {
  final int? x;

  const SimpleAsyncDelayedSetResult({this.x});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (x != null) {
      map["x"] = x;
    }

    return map;
  }

  @override
  SimpleAsyncDelayedSetResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleAsyncShouldCatchErrorsResult
    implements ToMap<SimpleAsyncShouldCatchErrorsResult> {
  final int? x;

  const SimpleAsyncShouldCatchErrorsResult({this.x});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (x != null) {
      map["x"] = x;
    }

    return map;
  }

  @override
  SimpleAsyncShouldCatchErrorsResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimpleAsyncActions {
  static Action<SimpleAsyncDelayedSetResult> delayedSet(
      {Duration? debounce, bool silent = false}) {
    return Action<SimpleAsyncDelayedSetResult>(
        name: "delayedSet",
        silent: silent,
        type: _SimpleAsync_FullPath,
        isAsync: true,
        debounce: debounce);
  }

  static Action<SimpleAsyncDelayedSetResult> delayedSetMock(
      SimpleAsyncDelayedSetResult mock) {
    return Action<SimpleAsyncDelayedSetResult>(
        name: "delayedSet", type: _SimpleAsync_FullPath, mock: mock);
  }

  static Action<SimpleAsyncShouldCatchErrorsResult> shouldCatchErrors(
      {Duration? debounce, bool silent = false}) {
    return Action<SimpleAsyncShouldCatchErrorsResult>(
        name: "shouldCatchErrors",
        silent: silent,
        type: _SimpleAsync_FullPath,
        isAsync: true,
        debounce: debounce);
  }

  static Action<SimpleAsyncShouldCatchErrorsResult> shouldCatchErrorsMock(
      SimpleAsyncShouldCatchErrorsResult mock) {
    return Action<SimpleAsyncShouldCatchErrorsResult>(
        name: "shouldCatchErrors", type: _SimpleAsync_FullPath, mock: mock);
  }
}

Future<dynamic> SimpleAsync_AsyncReducer(
    dynamic _DStoreState, Action _DstoreAction) async {
  _DStoreState = _DStoreState as SimpleAsync;
  final name = _DstoreAction.name;
  switch (name) {
    case "delayedSet":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_x = _DStoreState.x;
        await _DStoreState.delay(500);
        _DStore_x = 5;
        return _DStoreState.copyWith(x: _DStore_x);
      }

    case "shouldCatchErrors":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_x = _DStoreState.x;
        await _DStoreState.delay(600);
        throw asyncException;
        _DStore_x = 6;
        return _DStoreState.copyWith(x: _DStore_x);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimpleAsync SimpleAsync_DS() => SimpleAsync(
    x: 0,
    delayedSet: AsyncActionField(),
    shouldCatchErrors: AsyncActionField());

final SimpleAsyncMeta = PStateMeta<SimpleAsync>(
    type: _SimpleAsync_FullPath,
    aReducer: SimpleAsync_AsyncReducer,
    ds: SimpleAsync_DS);
