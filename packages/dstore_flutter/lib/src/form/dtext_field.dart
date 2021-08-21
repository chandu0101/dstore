import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/src/form/dform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DTextField<FieldKey> extends StatefulWidget {
  final FieldKey name;
  final String Function(dynamic value)? toText;
  final dynamic Function(String value)? fromText;

  // defualt TextField Props
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;
  // default TextField props end

  const DTextField({
    Key? key,
    required this.name,
    this.toText,
    this.fromText,
    this.decoration,
    this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.restorationId,
  }) : super(key: key);

  @override
  _DTextFieldState<FieldKey> createState() => _DTextFieldState<FieldKey>();
}

class _DTextFieldState<FieldKey> extends State<DTextField<FieldKey>> {
  TextField? _w;
  FromFieldPropInfo? _info;
  late TextEditingController _controller;
  late DForm dform;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      if (!DStoreUtils.isEnum(widget.name)) {
        throw ArgumentError.value("${widget.name} should be an enum ");
      }
    }
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dform = DForm.of(context);
    final key = FormUtils.getNameFromKey(widget.name);
    _info ??= dform.getInfo(key);
    final internalKeysChanged = dform.ff.internalKeysChanged;
    if (internalKeysChanged != null &&
        (internalKeysChanged.contains(key) ||
            internalKeysChanged.isEmpty /*in reset case we get empty list */)) {
      _info = dform.getInfo(key);
      _setText(internalKeysChanged.isEmpty);
      _w = _getWidget();
    } else {
      _setText(false);
      _w ??= _getWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  void _setText(bool isReset) {
    final text = widget.toText != null
        ? widget.toText!(_info?.value)
        : "${_info!.value}";
    if (isReset) {
      _controller.text = text;
    } else {
      final prevSelection = _controller.selection;
      _controller.text = text;
      _controller.selection = prevSelection;
    }
  }

  TextField _getWidget() {
    return TextField(
      controller: _controller,
      keyboardType: widget.keyboardType,
      onChanged: _handleOnChange,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      autofocus: widget.autofocus,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      readOnly: widget.readOnly,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      onAppPrivateCommand: widget.onAppPrivateCommand,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      dragStartBehavior: widget.dragStartBehavior,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      onTap: widget.onTap,
      mouseCursor: widget.mouseCursor,
      buildCounter: widget.buildCounter,
      scrollPhysics: widget.scrollPhysics,
      scrollController: widget.scrollController,
      autofillHints: widget.autofillHints,
      restorationId: widget.restorationId,
      decoration: widget.decoration != null
          ? widget.decoration!.copyWith(errorText: _info!.error)
          : InputDecoration(errorText: _info!.error),
    );
  }

  void _handleOnChange(String value) {
    final dynamic fv =
        widget.fromText != null ? widget.fromText!(value) : value;
    _info!.setValue(fv);
  }

  @override
  void didUpdateWidget(covariant DTextField<FieldKey> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      final key = FormUtils.getNameFromKey(widget.name);
      _info = dform.getInfo(key);
      _setText(true);
      _w = _getWidget();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _w = null;
    super.dispose();
  }
}
