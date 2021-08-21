// import 'package:dstore_test_suite/tests.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persist2.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persist3_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persist_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persitance_migratorps.dart';
import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
  group("persist1 pstate", () {
    test("should get value from storage on initial run", () {
      expect(store.state.simplePersist.x, 1);
    });
    test("should write to storage", () async {
      storeTester.testAction(
          SimplePersistActions.setX(v: 2), SimplePersistSetXResult(x: 2));
      final dynamic storedValue =
          await store.storage!.get(simplePersistTypeName);
      print("storedValue $storedValue");
      expect(storedValue, {"x": 2});
    });
  });

  group("persist2 pstate", () {
    test("should get value from storage on initial run", () {
      expect(store.state.simplePersist2.p2, 0);
    });
    test("should ignore erros while persiting", () async {
      storeTester.testAction(
          SimplePersist2Actions.setP2(v: 3), SimplePersist2SetP2Result(p2: 3));
      await 1.seconds.delay;
      expect(store.state.simplePersist2.p2, 3);
    });
  });

  group("persist3 pstate", () {
    test("should get default value if key not found in storage", () {
      expect(store.state.simplePersist3.p3, 0);
    });
    test("should revert state changes if there is an error while persiting",
        () async {
      storeTester.testAction(
          SimplePersist3Actions.setP3(v: 3), SimplePersist3SetP3Result(p3: 3));
      await 1.seconds.delay;
      expect(store.state.simplePersist3.p3, 0);
    });
  });

  group("persist migrator", () {
    test("should run mgrator function and set back migrated value to storage",
        () async {
      final result = "defaultmigrated";
      expect(store.state.simplePersitanceMigrator.name, result);
      final dynamic value =
          await store.storage!.get(simplePersistMigratorTypename);
      expect(value["name"], result);
    });
  });
}
