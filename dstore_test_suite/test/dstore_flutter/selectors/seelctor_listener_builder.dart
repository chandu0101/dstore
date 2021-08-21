import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_flutter_selectors.dart';
import 'package:dstore_test_suite/src/widgets/seelctor_builder_widget.dart';
import 'package:dstore_test_suite/src/widgets/seelctor_listener_widget.dart';
import 'package:dstore_test_suite/src/widgets/store_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("selector builder/listener", () {
    testWidgets("selector builder should subscribe to chnages", (tester) async {
      await tester.pumpWidget(StoreWrapper(child: SelectorBuilderWidget()));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      // storeTester.testAction(SimpleFlutterSelectorsActions.increment(),
      //     SimpleFlutterSelectorsIncrementResult(count: 1));
      // await tester.pumpAndSettle();
      // expect(find.text('1'), findsOneWidget);
    });
    // testWidgets("selector listener should subscribe to changes",
    //     (tester) async {
    //   await tester.pumpWidget(StoreWrapper(child: SelectorListenerWidget()));
    //   await tester.pumpAndSettle();
    //   storeTester.testAction(SimpleFlutterSelectorsActions.increment(),
    //       SimpleFlutterSelectorsIncrementResult(count: 1));
    //   print("listener done");
    // });
  });
}
