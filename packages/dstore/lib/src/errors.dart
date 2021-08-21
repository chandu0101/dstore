import 'package:dstore/src/action.dart';

class NotSUpportedError extends Error {
  final String message;
  NotSUpportedError(this.message);
}

class DStoreError {
  final Object e;
  final StackTrace st;
  final Action<dynamic>? action;

  DStoreError({required this.e, required this.st, this.action});

  @override
  String toString() => 'DStoreError(e: $e, st: $st, action: $action)';
}
