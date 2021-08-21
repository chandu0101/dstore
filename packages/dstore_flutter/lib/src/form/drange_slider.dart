import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DRangeSlider<FieldKey> extends StatefulWidget {
  final FieldKey name;

  // default range slider default props
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final RangeLabels? labels;
  final Color? activeColor;
  final Color? inactiveColor;
  final SemanticFormatterCallback? semanticFormatterCallback;

  // default range Slider props end

  const DRangeSlider({
    Key? key,
    required this.name,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labels,
    this.activeColor,
    this.inactiveColor,
    this.semanticFormatterCallback,
  }) : super(key: key);
  @override
  _DRangeSliderState<FieldKey> createState() => _DRangeSliderState<FieldKey>();
}

class _DRangeSliderState<FieldKey> extends State<DRangeSlider<FieldKey>> {
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

  RangeSlider _getWidget() {
    final dynamic formValue = info.value;
    if (!(formValue is RangeValues)) {
      throw ArgumentError.value("${widget.name} should be a RangeValues type");
    }
    return RangeSlider(
      values: formValue,
      onChanged: (value) {
        info.setValue(value);
      },
      onChangeStart: widget.onChangeStart,
      onChangeEnd: widget.onChangeEnd,
      min: widget.min,
      max: widget.max,
      divisions: widget.divisions,
      labels: widget.labels,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      semanticFormatterCallback: widget.semanticFormatterCallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  @override
  void didUpdateWidget(covariant DRangeSlider<FieldKey> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      throw NotSUpportedError(
          "You can not change name of textfield in runtime");
    }
  }
}
