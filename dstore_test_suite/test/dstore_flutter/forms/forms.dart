import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_form_ps.dart';
import 'package:dstore_test_suite/src/widgets/simple_form_widget.dart';
import 'package:dstore_test_suite/src/widgets/store_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("flutter forms", () {
    testWidgets("should handle forms", (tester) async {
      await tester.pumpWidget(StoreWrapper(child: SimpleFormWidget()));
      await tester.pumpAndSettle();
      expect(find.byKey(SimpleFormWidget.nameKey), findsOneWidget);
      expect(find.text("name"), findsOneWidget);
      await tester.enterText(find.byKey(SimpleFormWidget.nameKey), "name2");
      expect(find.text("name2"), findsOneWidget);
      expect(store.state.simpleFormPS.simpleForm.value.name, "name2");
      expect(find.byKey(SimpleFormWidget.radio1Key), findsOneWidget);
      expect(find.byKey(SimpleFormWidget.radio2Key), findsOneWidget);
      expect(store.state.simpleFormPS.simpleForm.value.radio1,
          SimpleFormRadioGroup1.radio1);
      await tester.tap(find.byKey(SimpleFormWidget.radio2Key));
      expect(store.state.simpleFormPS.simpleForm.value.radio1,
          SimpleFormRadioGroup1.radio2);
      expect(find.byKey(SimpleFormWidget.check1Key), findsOneWidget);
      expect(store.state.simpleFormPS.simpleForm.value.check1, false);
      await tester.tap(find.byKey(SimpleFormWidget.check1Key));
      expect(store.state.simpleFormPS.simpleForm.value.check1, true);
      expect(store.state.simpleFormPS.simpleForm.value.slider1, 0.5);
      expect(find.byKey(SimpleFormWidget.slider1Key), findsOneWidget);
      await tester.drag(find.byKey(SimpleFormWidget.slider1Key), Offset(90, 0));
      expect(store.state.simpleFormPS.simpleForm.value.slider1,
          0.6196808510638298);
      expect(find.byKey(SimpleFormWidget.rangeSlider1Key), findsOneWidget);
      expect(store.state.simpleFormPS.simpleForm.value.rangeSlider1,
          RangeValues(0.2, 0.5));
      await tester.drag(
          find.byKey(SimpleFormWidget.rangeSlider1Key), Offset(100, 0));
      expect(store.state.simpleFormPS.simpleForm.value.rangeSlider1,
          RangeValues(0.2, 0.6329787234042553));
      expect(find.byKey(SimpleFormWidget.date1Key), findsOneWidget);
      //TODO test date picker

      // await tester.tap(find.byKey(SimpleFormWidget.date1InnerKey));
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      // // debugDumpApp();
      // await tester.tap(find.text("15"));
      // await tester.tap(find.text("OK"));
      // expect(store.state.simpleFormPS.simpleForm.value.date1, DateTime.now());
    });
  });
}
