import 'package:dstore/dstore.dart';
import 'package:dstore/src/action.dart';
import 'package:dstore/src/store.dart';
import 'package:dstore/src/utils/utils.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part "form.dstore.dart";

typedef FormFieldValidator<T> = String? Function(T value);

abstract class FormFieldObject<M> {
  M copyWithMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap();
}

@DImmutable()
class $_FormField<F extends FormFieldObject<F>> {
  late F value;
  late Map<String, Function> validators;
  Map<String, String> errors = {};
  Map<String, bool> touched = {};
  bool isValid = false;
  bool isSubmitting = false;
  bool isValidating = false;
  bool validateOnChange = false;
  bool validateOnBlur = false;
  List<String>? internalKeysChanged;
  String internalAName = "";
  String internalAType = "";

  bool isFieldKeyValid(dynamic key) {
    final name = key.toString().split(".").last;
    final v = validators[name];
    return v == null || touched.containsKey(name) && !errors.containsKey(name);
  }
}

class FromFieldPropInfo {
  final dynamic name;
  final dynamic value;
  final Function? validator;
  final String? error;
  final bool touched;
  final void Function(dynamic value, {bool? validate}) setValue;
  final void Function(String? value) setError;
  final void Function(bool value) setTouched;

  bool get isValid {
    return validator == null || touched && error == null;
  }

  FromFieldPropInfo(
      {required this.name,
      required this.value,
      required this.validator,
      required this.error,
      required this.setError,
      required this.setValue,
      required this.setTouched,
      required this.touched});

  @override
  String toString() {
    return 'FromFieldPropInfo(name: $name, value: $value, validator: $validator, error: $error, touched: $touched, setValue: $setValue, setError: $setError, setTouched: $setTouched)';
  }
}

abstract class FormReq {}

class FormSetFieldValue extends FormReq {
  final String key;
  final dynamic value;
  final bool? validate;

  FormSetFieldValue({required this.key, required this.value, this.validate});

  @override
  String toString() =>
      'FormSetFieldValue(key: $key, value: $value, validate: $validate)';
}

class FormSetFieldTouched extends FormReq {
  final String key;
  final bool validate;

  FormSetFieldTouched({required this.key, this.validate = false});

  @override
  String toString() => 'FormSetFieldTouched(key: $key, validate: $validate)';
}

class FormSetFieldError extends FormReq {
  final String key;
  final String? value;

  FormSetFieldError({required this.key, this.value});

  @override
  String toString() => 'FormSetFieldError(key: $key, value: $value)';
}

class FormSetErrors extends FormReq {
  final Map<String, String> errors;

  FormSetErrors(this.errors);

  @override
  String toString() => 'FormSetErrors(errors: $errors)';
}

class FormSetSubmitting extends FormReq {
  final bool isSubmitting;

  FormSetSubmitting(this.isSubmitting);

  @override
  String toString() => 'FormSetSubmitting(isSubmitting: $isSubmitting)';
}

class FormReset extends FormReq {}

class FormValidate extends FormReq {}

class FormOps {
  final void Function(FormSetFieldValue req) setFieldValue;
  final void Function(FormSetFieldTouched req) setFieldTouched;
  final void Function(FormSetFieldError req) setFieldError;
  final void Function(FormSetErrors req) setErrors;
  final void Function(FormSetSubmitting req) setSubmitting;
  final void Function(FormReset req) resetForm;
  final void Function(FormValidate req) validateForm;

  FormOps(
      {required this.setFieldValue,
      required this.setFieldTouched,
      required this.setFieldError,
      required this.setErrors,
      required this.setSubmitting,
      required this.resetForm,
      required this.validateForm});
}

abstract class FormUtils {
  static String getNameFromKey(dynamic key) => key.toString().split(".").last;

  static FormOps getFormOps(FormField ff, Dispatch dispatch) {
    return FormOps(
      setFieldValue: (FormSetFieldValue req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
      setFieldTouched: (FormSetFieldTouched req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
      setFieldError: (FormSetFieldError req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
      setErrors: (FormSetErrors req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
      setSubmitting: (FormSetSubmitting req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
      resetForm: (FormReset req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
      validateForm: (FormValidate req) {
        final a = Action<dynamic>(
            name: ff.internalAName, type: ff.internalAType, form: req);
        dispatch(a);
      },
    );
  }

  static Future<Map<String, String>> isFormValid(FormField ff) async {
    final errors = <String, String>{};

    final values = ff.value.toMap();

    for (final e in ff.validators.entries) {
      try {
        final r = (await e.value(values[e.key], ff.value)) as String?;
        if (r != null) {
          errors[e.key] = r;
        }
      } catch (er) {
        errors[e.key] = "$er";
      }
    }
    return errors;
  }
}
