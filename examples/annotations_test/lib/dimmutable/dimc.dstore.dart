// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dimc.dart';

// **************************************************************************
// DImmutableGenerator
// **************************************************************************

class Sample {
  final int? x;

  final int y;

  _$SampleCopyWith<Sample> get copyWith =>
      __$SampleCopyWithImpl<Sample>(this, IdentityFn);

  const Sample({this.x, this.y = 0});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Sample && o.x == x && o.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => "Sample(x: ${this.x}, y: ${this.y})";
}

abstract class $SampleCopyWith<O> {
  factory $SampleCopyWith(Sample value, O Function(Sample) then) =
      _$SampleCopyWithImpl<O>;
  O call({int? x, int y});
}

class _$SampleCopyWithImpl<O> implements $SampleCopyWith<O> {
  final Sample _value;
  final O Function(Sample) _then;
  _$SampleCopyWithImpl(this._value, this._then);

  @override
  O call({Object? x = dimmutable, Object? y = dimmutable}) {
    return _then(_value.copyWith(
        x: x == dimmutable ? _value.x : x as int?,
        y: y == dimmutable ? _value.y : y as int));
  }
}

abstract class _$SampleCopyWith<O> implements $SampleCopyWith<O> {
  factory _$SampleCopyWith(Sample value, O Function(Sample) then) =
      __$SampleCopyWithImpl<O>;
  O call({int? x, int y});
}

class __$SampleCopyWithImpl<O> extends _$SampleCopyWithImpl<O>
    implements _$SampleCopyWith<O> {
  __$SampleCopyWithImpl(Sample _value, O Function(Sample) _then)
      : super(_value, (v) => _then(v));

  @override
  Sample get _value => super._value;

  @override
  O call({Object? x = dimmutable, Object? y = dimmutable}) {
    return _then(Sample(
        x: x == dimmutable ? _value.x : x as int?,
        y: y == dimmutable ? _value.y : y as int));
  }
}

class Sample2 {
  final dynamic intx;

  final int? y;

  _$Sample2CopyWith<Sample2> get copyWith =>
      __$Sample2CopyWithImpl<Sample2>(this, IdentityFn);

  const Sample2({required this.intx, this.y});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Sample2 && o.intx == intx && o.y == y;
  }

  @override
  int get hashCode => Object.hash(intx, y);

  @override
  String toString() => "Sample2(intx: ${this.intx}, y: ${this.y})";
}

abstract class $Sample2CopyWith<O> {
  factory $Sample2CopyWith(Sample2 value, O Function(Sample2) then) =
      _$Sample2CopyWithImpl<O>;
  O call({dynamic intx, int? y});
}

class _$Sample2CopyWithImpl<O> implements $Sample2CopyWith<O> {
  final Sample2 _value;
  final O Function(Sample2) _then;
  _$Sample2CopyWithImpl(this._value, this._then);

  @override
  O call({Object? intx = dimmutable, Object? y = dimmutable}) {
    return _then(_value.copyWith(
        intx: intx == dimmutable ? _value.intx : intx as dynamic,
        y: y == dimmutable ? _value.y : y as int?));
  }
}

abstract class _$Sample2CopyWith<O> implements $Sample2CopyWith<O> {
  factory _$Sample2CopyWith(Sample2 value, O Function(Sample2) then) =
      __$Sample2CopyWithImpl<O>;
  O call({dynamic intx, int? y});
}

class __$Sample2CopyWithImpl<O> extends _$Sample2CopyWithImpl<O>
    implements _$Sample2CopyWith<O> {
  __$Sample2CopyWithImpl(Sample2 _value, O Function(Sample2) _then)
      : super(_value, (v) => _then(v));

  @override
  Sample2 get _value => super._value;

  @override
  O call({Object? intx = dimmutable, Object? y = dimmutable}) {
    return _then(Sample2(
        intx: intx == dimmutable ? _value.intx : intx as dynamic,
        y: y == dimmutable ? _value.y : y as int?));
  }
}
