import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DCheckbox<FieldKey> extends StatefulWidget {
  final FieldKey name;

  // default checkbox widget properties
  final MouseCursor? mouseCursor;
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
  final Color? checkColor;
  final bool tristate;
  final OutlinedBorder? shape;
  final BorderSide? side;
  // defaul checkbox props end

  const DCheckbox({
    Key? key,
    required this.name,
    this.mouseCursor,
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
    this.checkColor,
    this.tristate = false,
    this.shape,
    this.side,
  }) : super(key: key);
  @override
  _DCheckboxState<FieldKey> createState() => _DCheckboxState<FieldKey>();
}

class _DCheckboxState<FieldKey> extends State<DCheckbox<FieldKey>> {
  Widget? _w;
  FromFieldPropInfo? _info;
  FromFieldPropInfo get info => _info!;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      if (!DStoreUtils.isEnum(widget.name)) {
        throw ArgumentError.value("${widget.name} should be an enum ");
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

  Checkbox _getWidget() {
    final dynamic formValue = info.value;
    if (!(formValue is bool?)) {
      throw ArgumentError.value("${widget.key} should be a bool type");
    }
    return Checkbox(
      value: info.value as bool?,
      onChanged: (dynamic value) {
        info.setValue(value);
      },
      mouseCursor: widget.mouseCursor,
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
      checkColor: widget.checkColor,
      tristate: widget.tristate,
      shape: widget.shape,
      side: widget.side,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  @override
  void didUpdateWidget(covariant DCheckbox<FieldKey> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      throw NotSUpportedError(
          "You can not change name of textfield in runtime");
    }
  }
}
