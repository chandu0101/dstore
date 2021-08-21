// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'stream.dart';

// **************************************************************************
// DImmutableGenerator
// **************************************************************************

class StreamField<D, E> {
  final D? data;

  final List<D> dataList;

  final StreamSubscription<dynamic>? internalSubscription;

  final E? error;

  final bool listening;

  final bool firstEventArrived;

  final bool completed;

  _$StreamFieldCopyWith<D, E, StreamField<D, E>> get copyWith =>
      __$StreamFieldCopyWithImpl<D, E, StreamField<D, E>>(this, IdentityFn);

  const StreamField(
      {this.data,
      this.dataList = const [],
      this.internalSubscription,
      this.error,
      this.listening = false,
      this.firstEventArrived = false,
      this.completed = false});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is StreamField &&
        o.data == data &&
        o.dataList == dataList &&
        o.internalSubscription == internalSubscription &&
        o.error == error &&
        o.listening == listening &&
        o.firstEventArrived == firstEventArrived &&
        o.completed == completed;
  }

  @override
  int get hashCode =>
      data.hashCode ^
      dataList.hashCode ^
      internalSubscription.hashCode ^
      error.hashCode ^
      listening.hashCode ^
      firstEventArrived.hashCode ^
      completed.hashCode;

  @override
  String toString() =>
      "StreamField(data: ${this.data}, dataList: ${this.dataList}, internalSubscription: ${this.internalSubscription}, error: ${this.error}, listening: ${this.listening}, firstEventArrived: ${this.firstEventArrived}, completed: ${this.completed})";
}

abstract class $StreamFieldCopyWith<D, E, O> {
  factory $StreamFieldCopyWith(
          StreamField<D, E> value, O Function(StreamField<D, E>) then) =
      _$StreamFieldCopyWithImpl<D, E, O>;
  O call(
      {D? data,
      List<D> dataList,
      StreamSubscription<dynamic>? internalSubscription,
      E? error,
      bool listening,
      bool firstEventArrived,
      bool completed});
}

class _$StreamFieldCopyWithImpl<D, E, O>
    implements $StreamFieldCopyWith<D, E, O> {
  final StreamField<D, E> _value;
  final O Function(StreamField<D, E>) _then;
  _$StreamFieldCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? data = dimmutable,
      Object? dataList = dimmutable,
      Object? internalSubscription = dimmutable,
      Object? error = dimmutable,
      Object? listening = dimmutable,
      Object? firstEventArrived = dimmutable,
      Object? completed = dimmutable}) {
    return _then(_value.copyWith(
        data: data == dimmutable ? _value.data : data as D?,
        dataList:
            dataList == dimmutable ? _value.dataList : dataList as List<D>,
        internalSubscription: internalSubscription == dimmutable
            ? _value.internalSubscription
            : internalSubscription as StreamSubscription<dynamic>?,
        error: error == dimmutable ? _value.error : error as E?,
        listening:
            listening == dimmutable ? _value.listening : listening as bool,
        firstEventArrived: firstEventArrived == dimmutable
            ? _value.firstEventArrived
            : firstEventArrived as bool,
        completed:
            completed == dimmutable ? _value.completed : completed as bool));
  }
}

abstract class _$StreamFieldCopyWith<D, E, O>
    implements $StreamFieldCopyWith<D, E, O> {
  factory _$StreamFieldCopyWith(
          StreamField<D, E> value, O Function(StreamField<D, E>) then) =
      __$StreamFieldCopyWithImpl<D, E, O>;
  O call(
      {D? data,
      List<D> dataList,
      StreamSubscription<dynamic>? internalSubscription,
      E? error,
      bool listening,
      bool firstEventArrived,
      bool completed});
}

class __$StreamFieldCopyWithImpl<D, E, O>
    extends _$StreamFieldCopyWithImpl<D, E, O>
    implements _$StreamFieldCopyWith<D, E, O> {
  __$StreamFieldCopyWithImpl(
      StreamField<D, E> _value, O Function(StreamField<D, E>) _then)
      : super(_value, (v) => _then(v));

  @override
  StreamField<D, E> get _value => super._value;

  @override
  O call(
      {Object? data = dimmutable,
      Object? dataList = dimmutable,
      Object? internalSubscription = dimmutable,
      Object? error = dimmutable,
      Object? listening = dimmutable,
      Object? firstEventArrived = dimmutable,
      Object? completed = dimmutable}) {
    return _then(StreamField(
        data: data == dimmutable ? _value.data : data as D?,
        dataList:
            dataList == dimmutable ? _value.dataList : dataList as List<D>,
        internalSubscription: internalSubscription == dimmutable
            ? _value.internalSubscription
            : internalSubscription as StreamSubscription<dynamic>?,
        error: error == dimmutable ? _value.error : error as E?,
        listening:
            listening == dimmutable ? _value.listening : listening as bool,
        firstEventArrived: firstEventArrived == dimmutable
            ? _value.firstEventArrived
            : firstEventArrived as bool,
        completed:
            completed == dimmutable ? _value.completed : completed as bool));
  }
}
