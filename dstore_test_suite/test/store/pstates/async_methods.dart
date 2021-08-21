import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_async_ps.dart';
import 'package:dstore_test_suite/tests.dart';
import 'package:test/test.dart';

void main() {
  group("Async PState", () {
    test("delayedSet", () async {
      await storeTester.testAsyncAction(
          SimpleAsyncActions.delayedSet(), SimpleAsyncDelayedSetResult(x: 5));
    });

    test("shouldCatchErrors", () async {
      await storeTester.testAsyncAction(SimpleAsyncActions.shouldCatchErrors(),
          SimpleAsyncShouldCatchErrorsResult(),
          af: AsyncActionField(error: asyncException, completed: true));
    });
  });
}
