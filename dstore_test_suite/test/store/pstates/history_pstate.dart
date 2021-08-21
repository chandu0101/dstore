import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_history_ps.dart';
import 'package:test/test.dart';

void main() {
  group("pstate history", () {
    test("should have access to canUndo canRedo", () {
      final ps = store.state.simpleHistory;
      assert(ps is PStateHistoryMixin);
      expect(ps.canRedo, false);
      expect(ps.canUndo, false);
    });

    test("undo/redo", () {
      markTestSkipped("recheck gain");
      storeTester.testAction(SimpleHistoryActions.increment(),
          SimpleHistoryIncrementResult(count: 1));
      final ps = store.state.simpleHistory;
      print("pshistory_s $ps");
      expect(ps.canUndo, true);
      expect(ps.canRedo, false);
      store.dispatch(SimpleHistoryActions.undo());
      expect(ps.canRedo, true);
      expect(store.state.simpleHistory.count, 0);
      store.dispatch(SimpleHistoryActions.redo());
      expect(store.state.simpleHistory.count, 1);
      expect(store.state.simpleHistory.canUndo, true);
      store.dispatch(SimpleHistoryActions.clearHistory());
      expect(store.state.simpleHistory.canUndo, false);
      expect(store.state.simpleHistory.canRedo, false);
    });
  });
}

//TODO more test cases
