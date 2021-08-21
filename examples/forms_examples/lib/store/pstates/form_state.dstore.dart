// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'form_state.dart';

// **************************************************************************
// FormModelGenerator
// **************************************************************************

@immutable
class SimpleForm implements FormFieldObject<SimpleForm> {
  final String name;

  final REnum? r;

  final bool? c1;

  final double rating;

  final RangeValues rangeRating;

  final DateTime date;

  _$SimpleFormCopyWith<SimpleForm> get copyWith =>
      __$SimpleFormCopyWithImpl<SimpleForm>(this, IdentityFn);

  SimpleForm(
      {this.name = "initialName",
      this.r,
      this.c1 = false,
      this.rating = 0.3,
      this.rangeRating = const RangeValues(0.2, 0.5),
      DateTime? date})
      : date = date ?? DateTime.now();

  @override
  SimpleForm copyWithMap(Map<String, dynamic> map) => SimpleForm(
      name: map.containsKey("name") ? map["name"] as String : this.name,
      r: map.containsKey("r") ? map["r"] as REnum? : this.r,
      c1: map.containsKey("c1") ? map["c1"] as bool? : this.c1,
      rating: map.containsKey("rating") ? map["rating"] as double : this.rating,
      rangeRating: map.containsKey("rangeRating")
          ? map["rangeRating"] as RangeValues
          : this.rangeRating,
      date: map.containsKey("date") ? map["date"] as DateTime : this.date);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "name": this.name,
        "r": this.r,
        "c1": this.c1,
        "rating": this.rating,
        "rangeRating": this.rangeRating,
        "date": this.date
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleForm &&
        o.name == name &&
        o.r == r &&
        o.c1 == c1 &&
        o.rating == rating &&
        o.rangeRating == rangeRating &&
        o.date == date;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      r.hashCode ^
      c1.hashCode ^
      rating.hashCode ^
      rangeRating.hashCode ^
      date.hashCode;

  @override
  String toString() =>
      "SimpleForm(name: ${this.name}, r: ${this.r}, c1: ${this.c1}, rating: ${this.rating}, rangeRating: ${this.rangeRating}, date: ${this.date})";
}

abstract class $SimpleFormCopyWith<O> {
  factory $SimpleFormCopyWith(SimpleForm value, O Function(SimpleForm) then) =
      _$SimpleFormCopyWithImpl<O>;
  O call(
      {String name,
      REnum? r,
      bool? c1,
      double rating,
      RangeValues rangeRating,
      DateTime date});
}

class _$SimpleFormCopyWithImpl<O> implements $SimpleFormCopyWith<O> {
  final SimpleForm _value;
  final O Function(SimpleForm) _then;
  _$SimpleFormCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? r = dimmutable,
      Object? c1 = dimmutable,
      Object? rating = dimmutable,
      Object? rangeRating = dimmutable,
      Object? date = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String,
        r: r == dimmutable ? _value.r : r as REnum?,
        c1: c1 == dimmutable ? _value.c1 : c1 as bool?,
        rating: rating == dimmutable ? _value.rating : rating as double,
        rangeRating: rangeRating == dimmutable
            ? _value.rangeRating
            : rangeRating as RangeValues,
        date: date == dimmutable ? _value.date : date as DateTime));
  }
}

abstract class _$SimpleFormCopyWith<O> implements $SimpleFormCopyWith<O> {
  factory _$SimpleFormCopyWith(SimpleForm value, O Function(SimpleForm) then) =
      __$SimpleFormCopyWithImpl<O>;
  O call(
      {String name,
      REnum? r,
      bool? c1,
      double rating,
      RangeValues rangeRating,
      DateTime date});
}

class __$SimpleFormCopyWithImpl<O> extends _$SimpleFormCopyWithImpl<O>
    implements _$SimpleFormCopyWith<O> {
  __$SimpleFormCopyWithImpl(SimpleForm _value, O Function(SimpleForm) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleForm get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? r = dimmutable,
      Object? c1 = dimmutable,
      Object? rating = dimmutable,
      Object? rangeRating = dimmutable,
      Object? date = dimmutable}) {
    return _then(SimpleForm(
        name: name == dimmutable ? _value.name : name as String,
        r: r == dimmutable ? _value.r : r as REnum?,
        c1: c1 == dimmutable ? _value.c1 : c1 as bool?,
        rating: rating == dimmutable ? _value.rating : rating as double,
        rangeRating: rangeRating == dimmutable
            ? _value.rangeRating
            : rangeRating as RangeValues,
        date: date == dimmutable ? _value.date : date as DateTime));
  }
}

enum SimpleFormKey { name, r, c1, rating, rangeRating, date }
