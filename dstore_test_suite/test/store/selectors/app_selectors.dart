import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_selector_ps.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import "package:time/time.dart";
import "package:test/test.dart";

// should handle websocket stream feilds
//

//TODO simple selctors
void main() {
  group("Selectors", () {
    test("should subscribe and call selector when state changes ", () async {
      expect(AppSelectors.simpleSelector.sfDeps, {
        "simpleSelectorPS": ["streamField"]
      });
      // expect(AppSelectors.simpleSelector.wsDeps, {
      //   "simpleSelectorPS": ["websocketField"]
      // });
      expect(
          AppSelectors.simpleSelector.deps, {"simpleSelectorPS": <String>[]});
      final result = <int>[];
      final unsubscribe =
          store.subscribeSelector(AppSelectors.simpleSelector, () {
        print("print listener called");
        result.add(store.state.simpleSelectorPS.count);
      });

      storeTester.testAction(SimpleSelectorPSActions.increment(),
          SimpleSelectorPSIncrementResult(count: 1));
      storeTester.testAction(SimpleSelectorPSActions.decrement(),
          SimpleSelectorPSDecrementResult(count: 0));
      expect(result, [1, 0]);
      result.clear();
      unsubscribe(UnSubscribeOptions());
      storeTester.testAction(SimpleSelectorPSActions.increment(),
          SimpleSelectorPSIncrementResult(count: 1));
      expect(result, <int>[]);
    });
  });
}
