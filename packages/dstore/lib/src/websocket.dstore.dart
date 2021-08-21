// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'websocket.dart';

// **************************************************************************
// DImmutableGenerator
// **************************************************************************

class WebSocketField<I, R, E> {
  final bool loading;

  final R? data;

  final E? error;

  final bool completed;

  final void Function()? internalUnsubscribe;

  _$WebSocketFieldCopyWith<I, R, E, WebSocketField<I, R, E>> get copyWith =>
      __$WebSocketFieldCopyWithImpl<I, R, E, WebSocketField<I, R, E>>(
          this, IdentityFn);

  const WebSocketField(
      {this.loading = false,
      this.data,
      this.error,
      this.completed = false,
      this.internalUnsubscribe});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WebSocketField &&
        o.loading == loading &&
        o.data == data &&
        o.error == error &&
        o.completed == completed &&
        o.internalUnsubscribe == internalUnsubscribe;
  }

  @override
  int get hashCode =>
      loading.hashCode ^
      data.hashCode ^
      error.hashCode ^
      completed.hashCode ^
      internalUnsubscribe.hashCode;

  @override
  String toString() =>
      "WebSocketField(loading: ${this.loading}, data: ${this.data}, error: ${this.error}, completed: ${this.completed}, internalUnsubscribe: ${this.internalUnsubscribe})";
}

abstract class $WebSocketFieldCopyWith<I, R, E, O> {
  factory $WebSocketFieldCopyWith(WebSocketField<I, R, E> value,
          O Function(WebSocketField<I, R, E>) then) =
      _$WebSocketFieldCopyWithImpl<I, R, E, O>;
  O call(
      {bool loading,
      R? data,
      E? error,
      bool completed,
      void Function()? internalUnsubscribe});
}

class _$WebSocketFieldCopyWithImpl<I, R, E, O>
    implements $WebSocketFieldCopyWith<I, R, E, O> {
  final WebSocketField<I, R, E> _value;
  final O Function(WebSocketField<I, R, E>) _then;
  _$WebSocketFieldCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? loading = dimmutable,
      Object? data = dimmutable,
      Object? error = dimmutable,
      Object? completed = dimmutable,
      Object? internalUnsubscribe = dimmutable}) {
    return _then(_value.copyWith(
        loading: loading == dimmutable ? _value.loading : loading as bool,
        data: data == dimmutable ? _value.data : data as R?,
        error: error == dimmutable ? _value.error : error as E?,
        completed:
            completed == dimmutable ? _value.completed : completed as bool,
        internalUnsubscribe: internalUnsubscribe == dimmutable
            ? _value.internalUnsubscribe
            : internalUnsubscribe as void Function()?));
  }
}

abstract class _$WebSocketFieldCopyWith<I, R, E, O>
    implements $WebSocketFieldCopyWith<I, R, E, O> {
  factory _$WebSocketFieldCopyWith(WebSocketField<I, R, E> value,
          O Function(WebSocketField<I, R, E>) then) =
      __$WebSocketFieldCopyWithImpl<I, R, E, O>;
  O call(
      {bool loading,
      R? data,
      E? error,
      bool completed,
      void Function()? internalUnsubscribe});
}

class __$WebSocketFieldCopyWithImpl<I, R, E, O>
    extends _$WebSocketFieldCopyWithImpl<I, R, E, O>
    implements _$WebSocketFieldCopyWith<I, R, E, O> {
  __$WebSocketFieldCopyWithImpl(
      WebSocketField<I, R, E> _value, O Function(WebSocketField<I, R, E>) _then)
      : super(_value, (v) => _then(v));

  @override
  WebSocketField<I, R, E> get _value => super._value;

  @override
  O call(
      {Object? loading = dimmutable,
      Object? data = dimmutable,
      Object? error = dimmutable,
      Object? completed = dimmutable,
      Object? internalUnsubscribe = dimmutable}) {
    return _then(WebSocketField(
        loading: loading == dimmutable ? _value.loading : loading as bool,
        data: data == dimmutable ? _value.data : data as R?,
        error: error == dimmutable ? _value.error : error as E?,
        completed:
            completed == dimmutable ? _value.completed : completed as bool,
        internalUnsubscribe: internalUnsubscribe == dimmutable
            ? _value.internalUnsubscribe
            : internalUnsubscribe as void Function()?));
  }
}
