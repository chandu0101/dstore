import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/nav.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:dstore_test_suite/src/widgets/app_shell_nav.dart';
import 'package:flutter/material.dart';
import "package:dstore_test/dstore_test.dart";
import 'package:flutter_test/flutter_test.dart';

//
void mian() {
  group("Nav Testers", () {
    testWidgets("should render nav with  ", (tester) async {
      await tester.pumpWidget(
        StoreProvider(
          store: store,
          child: MaterialApp.router(
            routeInformationParser: DStoreRouteInformationParser(),
            routerDelegate: DRouterDelegate(
              selector: AppSelectors.simpleNavPS,
            ),
          ),
        ),
      );

      // expect(store.flutterNavHistory.globalNavKey, isNotNull);
      // store.dispatch(SimpleNavPSActions.books());
      // await tester.pumpAndSettle();
      // expect(store.flutterNavHistory.url.endsWith("/books"), true);
      // expect(store.flutterNavHistory.currentNavKey, isNotNull);
      // expect(find.text("Books List"), findsOneWidget);
      // await tester.tap(find.text("Book1"));
      // await tester.pumpAndSettle();
      // expect(store.flutterNavHistory.url.endsWith("/books/1"), true);
      // expect(find.text("Go To Book Author1"), findsOneWidget);
      // await tester.tap(find.text("Go To Book Author1"));
      // await tester.pumpAndSettle();
      // expect(find.text("Are you sure to leave"), findsOneWidget);
      // await tester.tapText("No");
      // await tester.pumpAndSettle();
      // expect(find.text("Go To Book Author1"), findsOneWidget);
      // await tester.tap(find.text("Go To Book Author1"));
      // await tester.tapText("Yes");
      // await tester.pumpAndSettle();
      // expectOneTextWidget("BooksAuthorScreen");
      // store.flutterNavHistory.currentNavKey?.currentState?.pop<dynamic>();
      // await tester.pumpAndSettle();
      // expectOneTextWidget("Go To Book Author1");
      // await tester.tapText("Go ToSection1");
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      // expect(store.flutterNavHistory.url.endsWith("/settings/s1"), true);
      // expectOneTextWidget("Setting s1");
      // store.flutterNavHistory.currentNavKey?.currentState?.pop<dynamic>();
      // await tester.pumpAndSettle();
      // expectOneTextWidget("Setting List");
      // expect(store.flutterNavHistory.url.endsWith("/settings"), true);
      // store.dispatch(SimpleNavPSActions.books());
      // await tester.pumpAndSettle();
      // await tester.tapText("Go NestedNested Stack Tab2");
      // await tester.pumpAndSettle(const Duration(seconds: 3));
      // expectOneTextWidget("TabNested Stack Selected tab item nested_nested_t1");
      // expect(
      //     store.flutterNavHistory.url.endsWith("/tab2/nested_nested_t1"), true);
    });
  });
}
