// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_state.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class FormState extends PStateModel<FormState> {
  final FormField<SimpleForm> simpleForm;

  _$FormStateCopyWith<FormState> get copyWith =>
      __$FormStateCopyWithImpl<FormState>(this, IdentityFn);

  FormState({FormField<SimpleForm>? simpleForm})
      : simpleForm =
            simpleForm ?? FormField(value: SimpleForm(), validators: {});

  @override
  FormState copyWithMap(Map<String, dynamic> map) => FormState(
      simpleForm: map.containsKey("simpleForm")
          ? map["simpleForm"] as FormField<SimpleForm>
          : this.simpleForm);

  Map<String, dynamic> toMap() =>
      <String, dynamic>{"simpleForm": this.simpleForm};

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is FormState && o.simpleForm == simpleForm;
  }

  @override
  int get hashCode => simpleForm.hashCode;

  @override
  String toString() => "FormState(simpleForm: ${this.simpleForm})";
}

abstract class $FormStateCopyWith<O> {
  factory $FormStateCopyWith(FormState value, O Function(FormState) then) =
      _$FormStateCopyWithImpl<O>;
  O call({FormField<SimpleForm> simpleForm});
}

class _$FormStateCopyWithImpl<O> implements $FormStateCopyWith<O> {
  final FormState _value;
  final O Function(FormState) _then;
  _$FormStateCopyWithImpl(this._value, this._then);

  @override
  O call({Object? simpleForm = dimmutable}) {
    return _then(_value.copyWith(
        simpleForm: simpleForm == dimmutable
            ? _value.simpleForm
            : simpleForm as FormField<SimpleForm>));
  }
}

abstract class _$FormStateCopyWith<O> implements $FormStateCopyWith<O> {
  factory _$FormStateCopyWith(FormState value, O Function(FormState) then) =
      __$FormStateCopyWithImpl<O>;
  O call({FormField<SimpleForm> simpleForm});
}

class __$FormStateCopyWithImpl<O> extends _$FormStateCopyWithImpl<O>
    implements _$FormStateCopyWith<O> {
  __$FormStateCopyWithImpl(FormState _value, O Function(FormState) _then)
      : super(_value, (v) => _then(v));

  @override
  FormState get _value => super._value;

  @override
  O call({Object? simpleForm = dimmutable}) {
    return _then(FormState(
        simpleForm: simpleForm == dimmutable
            ? _value.simpleForm
            : simpleForm as FormField<SimpleForm>));
  }
}

const _FormState_FullPath = "/store/pstates/form_state/FormState";

abstract class FormStateActions {
  static Action<dynamic> simpleForm(FormReq req) {
    return Action<dynamic>(
        name: "simpleForm", type: _FormState_FullPath, form: req);
  }
}

FormState FormState_DS() => FormState(
    simpleForm: FormField(
        value: SimpleForm(),
        validators: {},
        internalAName: "simpleForm",
        internalAType: _FormState_FullPath));

final FormStateMeta =
    PStateMeta<FormState>(type: _FormState_FullPath, ds: FormState_DS);
