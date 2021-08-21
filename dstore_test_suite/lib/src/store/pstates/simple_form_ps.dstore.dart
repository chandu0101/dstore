// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'simple_form_ps.dart';

// **************************************************************************
// FormModelGenerator
// **************************************************************************

@immutable
class SimpleForm implements FormFieldObject<SimpleForm> {
  final String name;

  final SimpleFormRadioGroup1 radio1;

  final bool check1;

  final double slider1;

  final RangeValues rangeSlider1;

  final DateTime date1;

  _$SimpleFormCopyWith<SimpleForm> get copyWith =>
      __$SimpleFormCopyWithImpl<SimpleForm>(this, IdentityFn);

  SimpleForm(
      {this.name = "name",
      this.radio1 = SimpleFormRadioGroup1.radio1,
      this.check1 = false,
      this.slider1 = 0.5,
      this.rangeSlider1 = const RangeValues(0.2, 0.5),
      DateTime? date1})
      : date1 = date1 ?? DateTime.now();

  @override
  SimpleForm copyWithMap(Map<String, dynamic> map) => SimpleForm(
      name: map.containsKey("name") ? map["name"] as String : this.name,
      radio1: map.containsKey("radio1")
          ? map["radio1"] as SimpleFormRadioGroup1
          : this.radio1,
      check1: map.containsKey("check1") ? map["check1"] as bool : this.check1,
      slider1:
          map.containsKey("slider1") ? map["slider1"] as double : this.slider1,
      rangeSlider1: map.containsKey("rangeSlider1")
          ? map["rangeSlider1"] as RangeValues
          : this.rangeSlider1,
      date1: map.containsKey("date1") ? map["date1"] as DateTime : this.date1);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "name": this.name,
        "radio1": this.radio1,
        "check1": this.check1,
        "slider1": this.slider1,
        "rangeSlider1": this.rangeSlider1,
        "date1": this.date1
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleForm &&
        o.name == name &&
        o.radio1 == radio1 &&
        o.check1 == check1 &&
        o.slider1 == slider1 &&
        o.rangeSlider1 == rangeSlider1 &&
        o.date1 == date1;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      radio1.hashCode ^
      check1.hashCode ^
      slider1.hashCode ^
      rangeSlider1.hashCode ^
      date1.hashCode;

  @override
  String toString() =>
      "SimpleForm(name: ${this.name}, radio1: ${this.radio1}, check1: ${this.check1}, slider1: ${this.slider1}, rangeSlider1: ${this.rangeSlider1}, date1: ${this.date1})";
}

abstract class $SimpleFormCopyWith<O> {
  factory $SimpleFormCopyWith(SimpleForm value, O Function(SimpleForm) then) =
      _$SimpleFormCopyWithImpl<O>;
  O call(
      {String name,
      SimpleFormRadioGroup1 radio1,
      bool check1,
      double slider1,
      RangeValues rangeSlider1,
      DateTime date1});
}

class _$SimpleFormCopyWithImpl<O> implements $SimpleFormCopyWith<O> {
  final SimpleForm _value;
  final O Function(SimpleForm) _then;
  _$SimpleFormCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? radio1 = dimmutable,
      Object? check1 = dimmutable,
      Object? slider1 = dimmutable,
      Object? rangeSlider1 = dimmutable,
      Object? date1 = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String,
        radio1: radio1 == dimmutable
            ? _value.radio1
            : radio1 as SimpleFormRadioGroup1,
        check1: check1 == dimmutable ? _value.check1 : check1 as bool,
        slider1: slider1 == dimmutable ? _value.slider1 : slider1 as double,
        rangeSlider1: rangeSlider1 == dimmutable
            ? _value.rangeSlider1
            : rangeSlider1 as RangeValues,
        date1: date1 == dimmutable ? _value.date1 : date1 as DateTime));
  }
}

abstract class _$SimpleFormCopyWith<O> implements $SimpleFormCopyWith<O> {
  factory _$SimpleFormCopyWith(SimpleForm value, O Function(SimpleForm) then) =
      __$SimpleFormCopyWithImpl<O>;
  O call(
      {String name,
      SimpleFormRadioGroup1 radio1,
      bool check1,
      double slider1,
      RangeValues rangeSlider1,
      DateTime date1});
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
      Object? radio1 = dimmutable,
      Object? check1 = dimmutable,
      Object? slider1 = dimmutable,
      Object? rangeSlider1 = dimmutable,
      Object? date1 = dimmutable}) {
    return _then(SimpleForm(
        name: name == dimmutable ? _value.name : name as String,
        radio1: radio1 == dimmutable
            ? _value.radio1
            : radio1 as SimpleFormRadioGroup1,
        check1: check1 == dimmutable ? _value.check1 : check1 as bool,
        slider1: slider1 == dimmutable ? _value.slider1 : slider1 as double,
        rangeSlider1: rangeSlider1 == dimmutable
            ? _value.rangeSlider1
            : rangeSlider1 as RangeValues,
        date1: date1 == dimmutable ? _value.date1 : date1 as DateTime));
  }
}

enum SimpleFormKey { name, radio1, check1, slider1, rangeSlider1, date1 }
