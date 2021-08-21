import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/src/form/dform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DFormField<FieldKey> extends StatefulWidget {
  final FieldKey name;
  final Widget Function(FromFieldPropInfo) builder;

  const DFormField({
    Key? key,
    required this.name,
    required this.builder,
  }) : super(key: key);
  @override
  _DFormFieldState<FieldKey> createState() => _DFormFieldState<FieldKey>();
}

class _DFormFieldState<FieldKey> extends State<DFormField<FieldKey>> {
  Widget? _w;
  FromFieldPropInfo? _info;
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
      _w = widget.builder(_info!);
    } else {
      _w ??= widget.builder(_info!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _w!;
  }

  @override
  void didUpdateWidget(covariant DFormField<FieldKey> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      throw NotSUpportedError(
          "You can not change name of textfield in runtime");
    }
  }
}
