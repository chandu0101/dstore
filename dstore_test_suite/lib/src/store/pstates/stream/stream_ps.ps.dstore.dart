// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_stream_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class StreamPS extends PStateModel<StreamPS> {
  final StreamField<String, dynamic> stream1;

  _$StreamPSCopyWith<StreamPS> get copyWith =>
      __$StreamPSCopyWithImpl<StreamPS>(this, IdentityFn);

  StreamPS({this.stream1 = const StreamField<String, dynamic>()});

  @override
  StreamPS copyWithMap(Map<String, dynamic> map) => StreamPS(
      stream1: map.containsKey("stream1")
          ? map["stream1"] as StreamField<String, dynamic>
          : this.stream1);

  Map<String, dynamic> toMap() => <String, dynamic>{"stream1": this.stream1};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is StreamPS && o.stream1 == stream1;
  }

  @override
  int get hashCode => stream1.hashCode;

  @override
  String toString() => "StreamPS(stream1: ${this.stream1})";
}

abstract class $StreamPSCopyWith<O> {
  factory $StreamPSCopyWith(StreamPS value, O Function(StreamPS) then) =
      _$StreamPSCopyWithImpl<O>;
  O call({StreamField<String, dynamic> stream1});
}

class _$StreamPSCopyWithImpl<O> implements $StreamPSCopyWith<O> {
  final StreamPS _value;
  final O Function(StreamPS) _then;
  _$StreamPSCopyWithImpl(this._value, this._then);

  @override
  O call({Object? stream1 = dimmutable}) {
    return _then(_value.copyWith(
        stream1: stream1 == dimmutable
            ? _value.stream1
            : stream1 as StreamField<String, dynamic>));
  }
}

abstract class _$StreamPSCopyWith<O> implements $StreamPSCopyWith<O> {
  factory _$StreamPSCopyWith(StreamPS value, O Function(StreamPS) then) =
      __$StreamPSCopyWithImpl<O>;
  O call({StreamField<String, dynamic> stream1});
}

class __$StreamPSCopyWithImpl<O> extends _$StreamPSCopyWithImpl<O>
    implements _$StreamPSCopyWith<O> {
  __$StreamPSCopyWithImpl(StreamPS _value, O Function(StreamPS) _then)
      : super(_value, (v) => _then(v));

  @override
  StreamPS get _value => super._value;

  @override
  O call({Object? stream1 = dimmutable}) {
    return _then(StreamPS(
        stream1: stream1 == dimmutable
            ? _value.stream1
            : stream1 as StreamField<String, dynamic>));
  }
}

const _StreamPS_FullPath = "/store/pstates/stream/stream_ps/StreamPS";

abstract class StreamPSActions {
  static Action<Iterable<String>> stream1(
      {required Stream<String> stream,
      bool cancelOnError = false,
      Iterable<String>? mock}) {
    return Action<Iterable<String>>(
        name: "stream1",
        type: _StreamPS_FullPath,
        mock: mock,
        stream: StreamPayload(stream: stream, cancelOnError: cancelOnError));
  }
}

StreamPS StreamPS_DS() => StreamPS(stream1: StreamField<String, dynamic>());

final StreamPSMeta =
    PStateMeta<StreamPS>(type: _StreamPS_FullPath, ds: StreamPS_DS);
