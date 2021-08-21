import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DDatePicker<FieldKey> extends StatefulWidget {
  final FieldKey name;
  final String Function(DateTime dt)? dateFormatter;
  final InputDecoration? inputDecoration;

  // default showDatePicker properties
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? currentDate;
  final DatePickerEntryMode initialEntryMode; //= DatePickerEntryMode.calendar,
  final SelectableDayPredicate? selectableDayPredicate;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final Locale? locale;
  final bool useRootNavigator; // true
  final RouteSettings? routeSettings;
  final TextDirection? textDirection;
  final TransitionBuilder? builder;
  final DatePickerMode initialDatePickerMode; //= DatePickerMode.day,
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;
  // defaul showDatePicker properties

  const DDatePicker({
    Key? key,
    required this.name,
    this.dateFormatter,
    this.inputDecoration,
    required this.firstDate,
    required this.lastDate,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.initialDatePickerMode = DatePickerMode.day,
    this.currentDate,
    this.selectableDayPredicate,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.locale,
    this.useRootNavigator = true,
    this.routeSettings,
    this.textDirection,
    this.builder,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
  }) : super(key: key);
  @override
  _DDatePickerState<FieldKey> createState() => _DDatePickerState<FieldKey>();
}

class _DDatePickerState<FieldKey> extends State<DDatePicker<FieldKey>> {
  Widget? _w;
  FromFieldPropInfo? _info;
  FromFieldPropInfo get info => _info!;
  late final _controller = TextEditingController();
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
      _setText();
      _w = _getWidget();
    } else {
      _setText();
      _w ??= _getWidget();
    }
  }

  Widget _getWidget() {
    final dynamic formValue = info.value;
    if (!(formValue is DateTime)) {
      throw ArgumentError.value("${widget.key} should be a DateTime type");
    }
    return TextField(
      decoration: widget.inputDecoration ??
          InputDecoration(prefixIcon: Icon(Icons.calendar_today)),
      onTap: () {
        _displayDatePicker(formValue);
      },
      controller: _controller,
      readOnly: true,
    );
  }

  void _setText() {
    _controller.text = widget.dateFormatter != null
        ? "${widget.dateFormatter!(info.value as DateTime)}"
        : "${info.value}";
  }

  void _displayDatePicker(DateTime value) async {
    final selectedData = await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      initialEntryMode: widget.initialEntryMode,
      currentDate: widget.currentDate,
      selectableDayPredicate: widget.selectableDayPredicate,
      helpText: widget.helpText,
      cancelText: widget.cancelText,
      confirmText: widget.confirmText,
      locale: widget.locale,
      useRootNavigator: widget.useRootNavigator,
      routeSettings: widget.routeSettings,
      textDirection: widget.textDirection,
      builder: widget.builder,
      errorFormatText: widget.errorFormatText,
      errorInvalidText: widget.errorInvalidText,
      fieldHintText: widget.fieldHintText,
      fieldLabelText: widget.fieldLabelText,
    );
    if (selectedData != null) {
      info.setValue(selectedData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  @override
  void didUpdateWidget(covariant DDatePicker<FieldKey> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      throw NotSUpportedError(
          "You can not change name of textfield in runtime");
    }
  }
}
