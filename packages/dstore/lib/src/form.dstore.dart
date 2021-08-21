// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'form.dart';

// **************************************************************************
// DImmutableGenerator
// **************************************************************************

class FormField<F extends FormFieldObject<F>> {
  final F value;

  final Map<String, Function> validators;

  final Map<String, String> errors;

  final Map<String, bool> touched;

  final bool isValid;

  final bool isSubmitting;

  final bool isValidating;

  final bool validateOnChange;

  final bool validateOnBlur;

  final List<String>? internalKeysChanged;

  final String internalAName;

  final String internalAType;

  _$FormFieldCopyWith<F, FormField<F>> get copyWith =>
      __$FormFieldCopyWithImpl<F, FormField<F>>(this, IdentityFn);

  const FormField(
      {required this.value,
      required this.validators,
      this.errors = const {},
      this.touched = const {},
      this.isValid = false,
      this.isSubmitting = false,
      this.isValidating = false,
      this.validateOnChange = false,
      this.validateOnBlur = false,
      this.internalKeysChanged,
      this.internalAName = "",
      this.internalAType = ""});

  bool isFieldKeyValid(dynamic key) {
    final name = key.toString().split(".").last;
    final v = validators[name];
    return v == null || touched.containsKey(name) && !errors.containsKey(name);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is FormField &&
        o.value == value &&
        o.validators == validators &&
        o.errors == errors &&
        o.touched == touched &&
        o.isValid == isValid &&
        o.isSubmitting == isSubmitting &&
        o.isValidating == isValidating &&
        o.validateOnChange == validateOnChange &&
        o.validateOnBlur == validateOnBlur &&
        o.internalKeysChanged == internalKeysChanged &&
        o.internalAName == internalAName &&
        o.internalAType == internalAType;
  }

  @override
  int get hashCode =>
      value.hashCode ^
      validators.hashCode ^
      errors.hashCode ^
      touched.hashCode ^
      isValid.hashCode ^
      isSubmitting.hashCode ^
      isValidating.hashCode ^
      validateOnChange.hashCode ^
      validateOnBlur.hashCode ^
      internalKeysChanged.hashCode ^
      internalAName.hashCode ^
      internalAType.hashCode;

  @override
  String toString() =>
      "FormField(value: ${this.value}, validators: ${this.validators}, errors: ${this.errors}, touched: ${this.touched}, isValid: ${this.isValid}, isSubmitting: ${this.isSubmitting}, isValidating: ${this.isValidating}, validateOnChange: ${this.validateOnChange}, validateOnBlur: ${this.validateOnBlur}, internalKeysChanged: ${this.internalKeysChanged}, internalAName: ${this.internalAName}, internalAType: ${this.internalAType})";
}

abstract class $FormFieldCopyWith<F extends FormFieldObject<F>, O> {
  factory $FormFieldCopyWith(
          FormField<F> value, O Function(FormField<F>) then) =
      _$FormFieldCopyWithImpl<F, O>;
  O call(
      {F value,
      Map<String, Function> validators,
      Map<String, String> errors,
      Map<String, bool> touched,
      bool isValid,
      bool isSubmitting,
      bool isValidating,
      bool validateOnChange,
      bool validateOnBlur,
      List<String>? internalKeysChanged,
      String internalAName,
      String internalAType});
}

class _$FormFieldCopyWithImpl<F extends FormFieldObject<F>, O>
    implements $FormFieldCopyWith<F, O> {
  final FormField<F> _value;
  final O Function(FormField<F>) _then;
  _$FormFieldCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? value = dimmutable,
      Object? validators = dimmutable,
      Object? errors = dimmutable,
      Object? touched = dimmutable,
      Object? isValid = dimmutable,
      Object? isSubmitting = dimmutable,
      Object? isValidating = dimmutable,
      Object? validateOnChange = dimmutable,
      Object? validateOnBlur = dimmutable,
      Object? internalKeysChanged = dimmutable,
      Object? internalAName = dimmutable,
      Object? internalAType = dimmutable}) {
    return _then(_value.copyWith(
        value: value == dimmutable ? _value.value : value as F,
        validators: validators == dimmutable
            ? _value.validators
            : validators as Map<String, Function>,
        errors: errors == dimmutable
            ? _value.errors
            : errors as Map<String, String>,
        touched: touched == dimmutable
            ? _value.touched
            : touched as Map<String, bool>,
        isValid: isValid == dimmutable ? _value.isValid : isValid as bool,
        isSubmitting: isSubmitting == dimmutable
            ? _value.isSubmitting
            : isSubmitting as bool,
        isValidating: isValidating == dimmutable
            ? _value.isValidating
            : isValidating as bool,
        validateOnChange: validateOnChange == dimmutable
            ? _value.validateOnChange
            : validateOnChange as bool,
        validateOnBlur: validateOnBlur == dimmutable
            ? _value.validateOnBlur
            : validateOnBlur as bool,
        internalKeysChanged: internalKeysChanged == dimmutable
            ? _value.internalKeysChanged
            : internalKeysChanged as List<String>?,
        internalAName: internalAName == dimmutable
            ? _value.internalAName
            : internalAName as String,
        internalAType: internalAType == dimmutable
            ? _value.internalAType
            : internalAType as String));
  }
}

abstract class _$FormFieldCopyWith<F extends FormFieldObject<F>, O>
    implements $FormFieldCopyWith<F, O> {
  factory _$FormFieldCopyWith(
          FormField<F> value, O Function(FormField<F>) then) =
      __$FormFieldCopyWithImpl<F, O>;
  O call(
      {F value,
      Map<String, Function> validators,
      Map<String, String> errors,
      Map<String, bool> touched,
      bool isValid,
      bool isSubmitting,
      bool isValidating,
      bool validateOnChange,
      bool validateOnBlur,
      List<String>? internalKeysChanged,
      String internalAName,
      String internalAType});
}

class __$FormFieldCopyWithImpl<F extends FormFieldObject<F>, O>
    extends _$FormFieldCopyWithImpl<F, O> implements _$FormFieldCopyWith<F, O> {
  __$FormFieldCopyWithImpl(FormField<F> _value, O Function(FormField<F>) _then)
      : super(_value, (v) => _then(v));

  @override
  FormField<F> get _value => super._value;

  @override
  O call(
      {Object? value = dimmutable,
      Object? validators = dimmutable,
      Object? errors = dimmutable,
      Object? touched = dimmutable,
      Object? isValid = dimmutable,
      Object? isSubmitting = dimmutable,
      Object? isValidating = dimmutable,
      Object? validateOnChange = dimmutable,
      Object? validateOnBlur = dimmutable,
      Object? internalKeysChanged = dimmutable,
      Object? internalAName = dimmutable,
      Object? internalAType = dimmutable}) {
    return _then(FormField(
        value: value == dimmutable ? _value.value : value as F,
        validators: validators == dimmutable
            ? _value.validators
            : validators as Map<String, Function>,
        errors: errors == dimmutable
            ? _value.errors
            : errors as Map<String, String>,
        touched: touched == dimmutable
            ? _value.touched
            : touched as Map<String, bool>,
        isValid: isValid == dimmutable ? _value.isValid : isValid as bool,
        isSubmitting: isSubmitting == dimmutable
            ? _value.isSubmitting
            : isSubmitting as bool,
        isValidating: isValidating == dimmutable
            ? _value.isValidating
            : isValidating as bool,
        validateOnChange: validateOnChange == dimmutable
            ? _value.validateOnChange
            : validateOnChange as bool,
        validateOnBlur: validateOnBlur == dimmutable
            ? _value.validateOnBlur
            : validateOnBlur as bool,
        internalKeysChanged: internalKeysChanged == dimmutable
            ? _value.internalKeysChanged
            : internalKeysChanged as List<String>?,
        internalAName: internalAName == dimmutable
            ? _value.internalAName
            : internalAName as String,
        internalAType: internalAType == dimmutable
            ? _value.internalAType
            : internalAType as String));
  }
}
