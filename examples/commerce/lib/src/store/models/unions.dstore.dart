// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'unions.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

class MyUnion {
  final dynamic _value;

  MyUnion.s(String value) : _value = value;
  MyUnion.codeent({required String code, String? boo})
      : _value = _MyUnion_codeent(code: code, boo: boo);

  String? get s => _value is String ? _value as String : null;
  _MyUnion_codeent? get codeent =>
      _value is _MyUnion_codeent ? _value as _MyUnion_codeent : null;

  T when<T>(
      {required T Function(String value) s,
      required T Function(_MyUnion_codeent value) codeent}) {
    if (_value is String) {
      return s(_value as String);
    } else {
      return codeent(_value as _MyUnion_codeent);
    }
  }
}

class _MyUnion_codeent {
  final String code;

  final String? boo;

  _$_MyUnion_codeentCopyWith<_MyUnion_codeent> get copyWith =>
      __$_MyUnion_codeentCopyWithImpl<_MyUnion_codeent>(this, IdentityFn);

  _MyUnion_codeent({required this.code, this.boo});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is _MyUnion_codeent && o.code == code && o.boo == boo;
  }

  @override
  int get hashCode => code.hashCode ^ boo.hashCode;

  @override
  String toString() => "_MyUnion_codeent(code: ${this.code}, boo: ${this.boo})";
}

abstract class $_MyUnion_codeentCopyWith<O> {
  factory $_MyUnion_codeentCopyWith(
          _MyUnion_codeent value, O Function(_MyUnion_codeent) then) =
      _$_MyUnion_codeentCopyWithImpl<O>;
  O call({String code, String? boo});
}

class _$_MyUnion_codeentCopyWithImpl<O>
    implements $_MyUnion_codeentCopyWith<O> {
  final _MyUnion_codeent _value;
  final O Function(_MyUnion_codeent) _then;
  _$_MyUnion_codeentCopyWithImpl(this._value, this._then);

  @override
  O call({Object? code = dimmutable, Object? boo = dimmutable}) {
    return _then(_value.copyWith(
        code: code == dimmutable ? _value.code : code as String,
        boo: boo == dimmutable ? _value.boo : boo as String?));
  }
}

abstract class _$_MyUnion_codeentCopyWith<O>
    implements $_MyUnion_codeentCopyWith<O> {
  factory _$_MyUnion_codeentCopyWith(
          _MyUnion_codeent value, O Function(_MyUnion_codeent) then) =
      __$_MyUnion_codeentCopyWithImpl<O>;
  O call({String code, String? boo});
}

class __$_MyUnion_codeentCopyWithImpl<O>
    extends _$_MyUnion_codeentCopyWithImpl<O>
    implements _$_MyUnion_codeentCopyWith<O> {
  __$_MyUnion_codeentCopyWithImpl(
      _MyUnion_codeent _value, O Function(_MyUnion_codeent) _then)
      : super(_value, (v) => _then(v));

  @override
  _MyUnion_codeent get _value => super._value;

  @override
  O call({Object? code = dimmutable, Object? boo = dimmutable}) {
    return _then(_MyUnion_codeent(
        code: code == dimmutable ? _value.code : code as String,
        boo: boo == dimmutable ? _value.boo : boo as String?));
  }
}
