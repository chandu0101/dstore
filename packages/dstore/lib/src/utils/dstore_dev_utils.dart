import 'package:dstore/src/action.dart';
import 'package:dstore/src/errors.dart';
import 'package:dstore/src/store.dart';

abstract class DstoreDevUtils {
  static bool get isDebugMode {
    var inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static void handleUnCaughtError(
      {required Store store,
      required Action? action,
      required dynamic Function() callback}) async {
    try {
      await callback();
    } catch (e, st) {
      store.handleError(DStoreError(e: e, st: st, action: action));
    }
  }
}
