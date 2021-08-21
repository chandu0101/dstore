// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_form_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class SimpleFormPS extends PStateModel<SimpleFormPS> {
  final FormField<SimpleForm> simpleForm;

  _$SimpleFormPSCopyWith<SimpleFormPS> get copyWith =>
      __$SimpleFormPSCopyWithImpl<SimpleFormPS>(this, IdentityFn);

  SimpleFormPS({FormField<SimpleForm>? simpleForm})
      : simpleForm = simpleForm ??
            FormField<SimpleForm>(value: SimpleForm(), validators: {});

  @override
  SimpleFormPS copyWithMap(Map<String, dynamic> map) => SimpleFormPS(
      simpleForm: map.containsKey("simpleForm")
          ? map["simpleForm"] as FormField<SimpleForm>
          : this.simpleForm);

  Map<String, dynamic> toMap() =>
      <String, dynamic>{"simpleForm": this.simpleForm};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SimpleFormPS && o.simpleForm == simpleForm;
  }

  @override
  int get hashCode => simpleForm.hashCode;

  @override
  String toString() => "SimpleFormPS(simpleForm: ${this.simpleForm})";
}

abstract class $SimpleFormPSCopyWith<O> {
  factory $SimpleFormPSCopyWith(
          SimpleFormPS value, O Function(SimpleFormPS) then) =
      _$SimpleFormPSCopyWithImpl<O>;
  O call({FormField<SimpleForm> simpleForm});
}

class _$SimpleFormPSCopyWithImpl<O> implements $SimpleFormPSCopyWith<O> {
  final SimpleFormPS _value;
  final O Function(SimpleFormPS) _then;
  _$SimpleFormPSCopyWithImpl(this._value, this._then);

  @override
  O call({Object? simpleForm = dimmutable}) {
    return _then(_value.copyWith(
        simpleForm: simpleForm == dimmutable
            ? _value.simpleForm
            : simpleForm as FormField<SimpleForm>));
  }
}

abstract class _$SimpleFormPSCopyWith<O> implements $SimpleFormPSCopyWith<O> {
  factory _$SimpleFormPSCopyWith(
          SimpleFormPS value, O Function(SimpleFormPS) then) =
      __$SimpleFormPSCopyWithImpl<O>;
  O call({FormField<SimpleForm> simpleForm});
}

class __$SimpleFormPSCopyWithImpl<O> extends _$SimpleFormPSCopyWithImpl<O>
    implements _$SimpleFormPSCopyWith<O> {
  __$SimpleFormPSCopyWithImpl(
      SimpleFormPS _value, O Function(SimpleFormPS) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleFormPS get _value => super._value;

  @override
  O call({Object? simpleForm = dimmutable}) {
    return _then(SimpleFormPS(
        simpleForm: simpleForm == dimmutable
            ? _value.simpleForm
            : simpleForm as FormField<SimpleForm>));
  }
}

const _SimpleFormPS_FullPath = "/store/pstates/simple_form_ps/SimpleFormPS";

abstract class SimpleFormPSActions {
  static Action<dynamic> simpleForm(FormReq req) {
    return Action<dynamic>(
        name: "simpleForm", type: _SimpleFormPS_FullPath, form: req);
  }
}

SimpleFormPS SimpleFormPS_DS() => SimpleFormPS(
    simpleForm: FormField<SimpleForm>(
        value: SimpleForm(),
        validators: {},
        internalAName: "simpleForm",
        internalAType: _SimpleFormPS_FullPath));

final SimpleFormPSMeta =
    PStateMeta<SimpleFormPS>(type: _SimpleFormPS_FullPath, ds: SimpleFormPS_DS);
