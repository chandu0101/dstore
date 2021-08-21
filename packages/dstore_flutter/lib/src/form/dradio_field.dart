import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DRadioField<FieldKey, RadioEnum> extends StatefulWidget {
  final FieldKey name;
  final RadioEnum value;

  // default radio widget properties
  final MouseCursor? mouseCursor;
  final bool toggleable;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? fillColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  // defaul radio props end

  const DRadioField({
    Key? key,
    required this.name,
    required this.value,
    this.mouseCursor,
    this.toggleable = false,
    this.activeColor,
    this.fillColor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);
  @override
  _DRadioFieldState<FieldKey, RadioEnum> createState() =>
      _DRadioFieldState<FieldKey, RadioEnum>();
}

class _DRadioFieldState<FieldKey, RadioEnum>
    extends State<DRadioField<FieldKey, RadioEnum>> {
  Widget? _w;
  FromFieldPropInfo? _info;
  FromFieldPropInfo get info => _info!;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      final value = DStoreUtils.isEnum(widget.name);
      if (!DStoreUtils.isEnum(widget.name)) {
        throw ArgumentError.value("${widget.name} should be an enum ");
      }
      if (!DStoreUtils.isEnum(widget.value)) {
        throw ArgumentError.value("${widget.value} should be an enum ");
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final key = FormUtils.getNameFromKey(widget.name);
    final dform = DForm.of(context);
    _info ??= dform.getInfo(key);
    final internalKeysChanged = dform.ff.internalKeysChanged;
    if (internalKeysChanged != null &&
        (internalKeysChanged.contains(key) ||
            internalKeysChanged.isEmpty /*in reset case we get empty list */)) {
      _info = dform.getInfo(key);
      _w = _getWidget();
    } else {
      _w ??= _getWidget();
    }
  }

  Radio _getWidget() {
    final dynamic formValue = info.value;
    if (formValue != null && !DStoreUtils.isEnum(formValue)) {
      throw ArgumentError.value("${widget.key} should be a Enum type");
    }
    return Radio<dynamic>(
      value: widget.value,
      groupValue: formValue,
      onChanged: (dynamic value) {
        info.setValue(value);
      },
      mouseCursor: widget.mouseCursor,
      toggleable: widget.toggleable,
      activeColor: widget.activeColor,
      fillColor: widget.fillColor,
      materialTapTargetSize: widget.materialTapTargetSize,
      visualDensity: widget.visualDensity,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      overlayColor: widget.overlayColor,
      splashRadius: widget.splashRadius,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  @override
  void didUpdateWidget(covariant DRadioField<FieldKey, RadioEnum> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      throw NotSUpportedError(
          "You can not change name of textfield in runtime");
    }
  }
}
