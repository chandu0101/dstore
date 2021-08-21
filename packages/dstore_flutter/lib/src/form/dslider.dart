import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DSlider<FieldKey> extends StatefulWidget {
  final FieldKey name;
  final bool adaptive;

  // default Slider widget properties
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final MouseCursor? mouseCursor;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final FocusNode? focusNode;
  final bool autofocus;
  // defaul Slider props end

  const DSlider({
    Key? key,
    required this.name,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.adaptive = false,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.mouseCursor,
    this.semanticFormatterCallback,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);
  @override
  _DSliderState<FieldKey> createState() => _DSliderState<FieldKey>();
}

class _DSliderState<FieldKey> extends State<DSlider<FieldKey>> {
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

  Slider _getWidget() {
    final dynamic formValue = info.value;
    if (!(formValue is double)) {
      throw ArgumentError.value("${widget.key} should be a double type");
    }
    return widget.adaptive
        ? Slider.adaptive(
            value: formValue,
            onChanged: (value) {
              info.setValue(value);
            },
            onChangeStart: widget.onChangeStart,
            onChangeEnd: widget.onChangeEnd,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.label,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
            mouseCursor: widget.mouseCursor,
            semanticFormatterCallback: widget.semanticFormatterCallback,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
          )
        : Slider(
            value: formValue,
            onChanged: (value) {
              info.setValue(value);
            },
            onChangeStart: widget.onChangeStart,
            onChangeEnd: widget.onChangeEnd,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            label: widget.label,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
            mouseCursor: widget.mouseCursor,
            semanticFormatterCallback: widget.semanticFormatterCallback,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
          );
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  @override
  void didUpdateWidget(covariant DSlider<FieldKey> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      throw NotSUpportedError(
          "You can not change name of textfield in runtime");
    }
  }
}
