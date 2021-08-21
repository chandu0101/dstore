// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_stream_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleStreamPS extends PStateModel<SimpleStreamPS> {
  final StreamField<String, dynamic> stream1;

  _$SimpleStreamPSCopyWith<SimpleStreamPS> get copyWith =>
      __$SimpleStreamPSCopyWithImpl<SimpleStreamPS>(this, IdentityFn);

  SimpleStreamPS({this.stream1 = const StreamField<String, dynamic>()});

  @override
  SimpleStreamPS copyWithMap(Map<String, dynamic> map) => SimpleStreamPS(
      stream1: map.containsKey("stream1")
          ? map["stream1"] as StreamField<String, dynamic>
          : this.stream1);

  Map<String, dynamic> toMap() => <String, dynamic>{"stream1": this.stream1};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleStreamPS && o.stream1 == stream1;
  }

  @override
  int get hashCode => stream1.hashCode;

  @override
  String toString() => "SimpleStreamPS(stream1: ${this.stream1})";
}

abstract class $SimpleStreamPSCopyWith<O> {
  factory $SimpleStreamPSCopyWith(
          SimpleStreamPS value, O Function(SimpleStreamPS) then) =
      _$SimpleStreamPSCopyWithImpl<O>;
  O call({StreamField<String, dynamic> stream1});
}

class _$SimpleStreamPSCopyWithImpl<O> implements $SimpleStreamPSCopyWith<O> {
  final SimpleStreamPS _value;
  final O Function(SimpleStreamPS) _then;
  _$SimpleStreamPSCopyWithImpl(this._value, this._then);

  @override
  O call({Object? stream1 = dimmutable}) {
    return _then(_value.copyWith(
        stream1: stream1 == dimmutable
            ? _value.stream1
            : stream1 as StreamField<String, dynamic>));
  }
}

abstract class _$SimpleStreamPSCopyWith<O>
    implements $SimpleStreamPSCopyWith<O> {
  factory _$SimpleStreamPSCopyWith(
          SimpleStreamPS value, O Function(SimpleStreamPS) then) =
      __$SimpleStreamPSCopyWithImpl<O>;
  O call({StreamField<String, dynamic> stream1});
}

class __$SimpleStreamPSCopyWithImpl<O> extends _$SimpleStreamPSCopyWithImpl<O>
    implements _$SimpleStreamPSCopyWith<O> {
  __$SimpleStreamPSCopyWithImpl(
      SimpleStreamPS _value, O Function(SimpleStreamPS) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleStreamPS get _value => super._value;

  @override
  O call({Object? stream1 = dimmutable}) {
    return _then(SimpleStreamPS(
        stream1: stream1 == dimmutable
            ? _value.stream1
            : stream1 as StreamField<String, dynamic>));
  }
}

const _SimpleStreamPS_FullPath =
    "/store/pstates/stream/simple_stream_ps/SimpleStreamPS";

abstract class SimpleStreamPSActions {
  static Action<Iterable<String>> stream1(
      {required Stream<String> stream,
      bool cancelOnError = false,
      bool appendDataToList = false,
      Iterable<String>? mock}) {
    return Action<Iterable<String>>(
        name: "stream1",
        type: _SimpleStreamPS_FullPath,
        mock: mock,
        stream: StreamPayload<String>(
            stream: stream,
            cancelOnError: cancelOnError,
            appendDataToList: appendDataToList));
  }

  static Action<Iterable<String>> stream1Result(Iterable<String> mock) {
    return Action<Iterable<String>>(
      name: "stream1",
      type: _SimpleStreamPS_FullPath,
      mock: mock,
    );
  }
}

SimpleStreamPS SimpleStreamPS_DS() =>
    SimpleStreamPS(stream1: StreamField<String, dynamic>());

final SimpleStreamPSMeta = PStateMeta<SimpleStreamPS>(
    type: _SimpleStreamPS_FullPath, ds: SimpleStreamPS_DS);
