import 'dart:async';

import 'package:dstore/dstore.dart';

part "stream.dstore.dart";

class StreamPayload<D> {
  final Stream<D> stream;
  final bool cancelOnError;
  final bool appendDataToList;

  StreamPayload(
      {required this.stream,
      this.cancelOnError = false,
      this.appendDataToList = false});
}

@dimmutable
void $_StreamField<D, E>({
  D? data,
  List<D> dataList = const [],
  StreamSubscription<dynamic>? internalSubscription,
  E? error,
  bool listening = false,
  bool firstEventArrived = false,
  bool completed = false,
}) {}
