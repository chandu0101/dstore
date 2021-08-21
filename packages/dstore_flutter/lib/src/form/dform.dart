import 'package:dstore/dstore.dart';
import 'package:flutter/material.dart' hide FormField;
import 'package:dstore_flutter/src/store/store_provider.dart';

/// make sure your child wrapped with Builder widget or as a separate widget
class DForm extends InheritedWidget {
  final FormField<FormFieldObject> ff;
  final _FormState _formState = _FormState();
  DForm({Key? key, required this.ff, required Widget child})
      : super(key: key, child: child);

  static DForm of(BuildContext context) {
    final dformType = context.dependOnInheritedWidgetOfExactType<DForm>();
    if (dformType == null) {
      throw Exception(
          "No Parent Dform Found , make sure you use d form fields as a child of DFrom widget");
    }
    final dform = dformType;
    if (dform._formState.ops == null) {
      final d = context.dispatch;
      dform._formState.ops = FormUtils.getFormOps(dform.ff, d);
    }
    return dform;
  }

  FormOps get ops => _formState.ops!;

  void resetForm() => ops.resetForm(FormReset());

  FromFieldPropInfo getInfo(String key) {
    final value = ff.value.toMap();
    final fromFieldKey = key.toString().split(".").last;
    if (!value.containsKey(fromFieldKey)) {
      throw ArgumentError.value("$key not found in this from ${value}");
    }
    final validator = ff.validators[key];
    final error = ff.errors[key];
    final touched = ff.touched[key] ?? false;
    return FromFieldPropInfo(
        name: key,
        value: value[fromFieldKey],
        validator: validator,
        error: error,
        setValue: (dynamic value, {bool? validate}) => ops.setFieldValue(
            FormSetFieldValue(key: key, value: value, validate: validate)),
        setError: (String? error) =>
            ops.setFieldError(FormSetFieldError(key: key, value: error)),
        setTouched: (bool validate) => ops
            .setFieldTouched(FormSetFieldTouched(key: key, validate: validate)),
        touched: touched);
  }

  void validate() {
    _formState.ops!.validateForm(FormValidate());
  }

  @override
  bool updateShouldNotify(DForm oldWidget) {
    final off = oldWidget.ff;
    if (off.internalAName != ff.internalAName ||
        off.internalAType != ff.internalAType) {
      this._formState.ops = null;
    }
    return oldWidget.ff != this.ff;
  }
}

class _FormState {
  FormOps? ops;
}

extension BuildContextDFormExtension on BuildContext {
  DForm get dform => DForm.of(this);
}
