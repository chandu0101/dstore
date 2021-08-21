// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_selector_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleSelectorPS extends PStateModel<SimpleSelectorPS> {
  final int count;

  final StreamField<String, dynamic> streamField;

  final SimpleSelectorWS websocketField;

  _$SimpleSelectorPSCopyWith<SimpleSelectorPS> get copyWith =>
      __$SimpleSelectorPSCopyWithImpl<SimpleSelectorPS>(this, IdentityFn);

  SimpleSelectorPS(
      {this.count = 0,
      this.streamField = const StreamField<String, dynamic>(),
      this.websocketField = const SimpleSelectorWS()});

  @override
  SimpleSelectorPS copyWithMap(Map<String, dynamic> map) => SimpleSelectorPS(
      count: map.containsKey("count") ? map["count"] as int : this.count,
      streamField: map.containsKey("streamField")
          ? map["streamField"] as StreamField<String, dynamic>
          : this.streamField,
      websocketField: map.containsKey("websocketField")
          ? map["websocketField"] as SimpleSelectorWS
          : this.websocketField);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "count": this.count,
        "streamField": this.streamField,
        "websocketField": this.websocketField
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleSelectorPS &&
        o.count == count &&
        o.streamField == streamField &&
        o.websocketField == websocketField;
  }

  @override
  int get hashCode =>
      count.hashCode ^ streamField.hashCode ^ websocketField.hashCode;

  @override
  String toString() =>
      "SimpleSelectorPS(count: ${this.count}, streamField: ${this.streamField}, websocketField: ${this.websocketField})";
}

abstract class $SimpleSelectorPSCopyWith<O> {
  factory $SimpleSelectorPSCopyWith(
          SimpleSelectorPS value, O Function(SimpleSelectorPS) then) =
      _$SimpleSelectorPSCopyWithImpl<O>;
  O call(
      {int count,
      StreamField<String, dynamic> streamField,
      SimpleSelectorWS websocketField});
}

class _$SimpleSelectorPSCopyWithImpl<O>
    implements $SimpleSelectorPSCopyWith<O> {
  final SimpleSelectorPS _value;
  final O Function(SimpleSelectorPS) _then;
  _$SimpleSelectorPSCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? count = dimmutable,
      Object? streamField = dimmutable,
      Object? websocketField = dimmutable}) {
    return _then(_value.copyWith(
        count: count == dimmutable ? _value.count : count as int,
        streamField: streamField == dimmutable
            ? _value.streamField
            : streamField as StreamField<String, dynamic>,
        websocketField: websocketField == dimmutable
            ? _value.websocketField
            : websocketField as SimpleSelectorWS));
  }
}

abstract class _$SimpleSelectorPSCopyWith<O>
    implements $SimpleSelectorPSCopyWith<O> {
  factory _$SimpleSelectorPSCopyWith(
          SimpleSelectorPS value, O Function(SimpleSelectorPS) then) =
      __$SimpleSelectorPSCopyWithImpl<O>;
  O call(
      {int count,
      StreamField<String, dynamic> streamField,
      SimpleSelectorWS websocketField});
}

class __$SimpleSelectorPSCopyWithImpl<O>
    extends _$SimpleSelectorPSCopyWithImpl<O>
    implements _$SimpleSelectorPSCopyWith<O> {
  __$SimpleSelectorPSCopyWithImpl(
      SimpleSelectorPS _value, O Function(SimpleSelectorPS) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleSelectorPS get _value => super._value;

  @override
  O call(
      {Object? count = dimmutable,
      Object? streamField = dimmutable,
      Object? websocketField = dimmutable}) {
    return _then(SimpleSelectorPS(
        count: count == dimmutable ? _value.count : count as int,
        streamField: streamField == dimmutable
            ? _value.streamField
            : streamField as StreamField<String, dynamic>,
        websocketField: websocketField == dimmutable
            ? _value.websocketField
            : websocketField as SimpleSelectorWS));
  }
}

const _SimpleSelectorPS_FullPath =
    "/store/pstates/selectors/simple_selector_ps/SimpleSelectorPS";

class SimpleSelectorPSIncrementResult
    implements ToMap<SimpleSelectorPSIncrementResult> {
  final int? count;

  const SimpleSelectorPSIncrementResult({this.count});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (count != null) {
      map["count"] = count;
    }

    return map;
  }

  @override
  SimpleSelectorPSIncrementResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleSelectorPSDecrementResult
    implements ToMap<SimpleSelectorPSDecrementResult> {
  final int? count;

  const SimpleSelectorPSDecrementResult({this.count});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (count != null) {
      map["count"] = count;
    }

    return map;
  }

  @override
  SimpleSelectorPSDecrementResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimpleSelectorPSActions {
  static Action<SimpleSelectorPSIncrementResult> increment(
      {bool silent = false}) {
    return Action<SimpleSelectorPSIncrementResult>(
        name: "increment",
        silent: silent,
        type: _SimpleSelectorPS_FullPath,
        isAsync: false);
  }

  static Action<SimpleSelectorPSIncrementResult> incrementMock(
      SimpleSelectorPSIncrementResult mock) {
    return Action<SimpleSelectorPSIncrementResult>(
        name: "increment", type: _SimpleSelectorPS_FullPath, mock: mock);
  }

  static Action<SimpleSelectorPSDecrementResult> decrement(
      {bool silent = false}) {
    return Action<SimpleSelectorPSDecrementResult>(
        name: "decrement",
        silent: silent,
        type: _SimpleSelectorPS_FullPath,
        isAsync: false);
  }

  static Action<SimpleSelectorPSDecrementResult> decrementMock(
      SimpleSelectorPSDecrementResult mock) {
    return Action<SimpleSelectorPSDecrementResult>(
        name: "decrement", type: _SimpleSelectorPS_FullPath, mock: mock);
  }

  static Action<Iterable<String>> streamField(
      {required Stream<String> stream,
      bool cancelOnError = false,
      bool appendDataToList = false,
      Iterable<String>? mock}) {
    return Action<Iterable<String>>(
        name: "streamField",
        type: _SimpleSelectorPS_FullPath,
        mock: mock,
        stream: StreamPayload<String>(
            stream: stream,
            cancelOnError: cancelOnError,
            appendDataToList: appendDataToList));
  }

  static Action<Iterable<String>> streamFieldResult(Iterable<String> mock) {
    return Action<Iterable<String>>(
      name: "streamField",
      type: _SimpleSelectorPS_FullPath,
      mock: mock,
    );
  }

  static Action<dynamic> websocketField(
      {required String data,
      Map<String, dynamic>? headers,
      bool unsubscribe = false}) {
    return Action<dynamic>(
        name: "websocketField",
        type: _SimpleSelectorPS_FullPath,
        ws: WebSocketPayload<String, String, String>(
            url: "1",
            data: data,
            responseDeserializer: IdentityFn,
            inputSerializer: null,
            transformer: null,
            headers: headers,
            unsubscribe: unsubscribe));
  }
}

dynamic SimpleSelectorPS_SyncReducer(
    dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SimpleSelectorPS;
  final name = _DstoreAction.name;
  switch (name) {
    case "increment":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_count = _DStoreState.count;
        _DStore_count += 1;
        return _DStoreState.copyWith(count: _DStore_count);
      }

    case "decrement":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_count = _DStoreState.count;
        _DStore_count -= 1;
        return _DStoreState.copyWith(count: _DStore_count);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimpleSelectorPS SimpleSelectorPS_DS() => SimpleSelectorPS(
    count: 0,
    streamField: StreamField<String, dynamic>(),
    websocketField: SimpleSelectorWS());

final SimpleSelectorPSMeta = PStateMeta<SimpleSelectorPS>(
    type: _SimpleSelectorPS_FullPath,
    reducer: SimpleSelectorPS_SyncReducer,
    ds: SimpleSelectorPS_DS);
