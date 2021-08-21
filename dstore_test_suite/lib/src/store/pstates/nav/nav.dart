import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/screens/home_screen.dart';
import 'package:dstore_test_suite/src/screens/tabs/tabs_screens.dart';
import 'package:dstore_test_suite/src/screens/unknown_screen.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/books_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/setings_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/tabs_nav.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart' hide Action;
part 'nav.ps.dstore.dart';

@PState(nav: true)
class $_SimpleNavPS extends NavStateI<dynamic> {
  @Url("/")
  void home() {
    this.page =
        MaterialPage<dynamic>(key: ValueKey("home"), child: HomeScreen());
  }

  @Url("/books", nestedType: $_BooksNav)
  void books() {
    print("in books pa2ge");
    this.page = MaterialPage<dynamic>(
        key: ValueKey("books"),
        child:
            NestedRouter<AppState, BooksNav>(selector: AppSelectors.booksNav));
  }

  @Url("/settings", nestedType: $_SettingsNav)
  void settings() {
    print("in settings page");
    this.page = MaterialPage<dynamic>(
        key: ValueKey("settings"),
        child: NestedRouter(
          selector: AppSelectors.settingNav,
        ));
    // this.blockSameUrl = false;
  }

  @Url("/tab1", nestedType: $_TabsNestedStack)
  void tabs() {
    print("in tabs page");
    this.page = MaterialPage<dynamic>(
        child:
            TabShell(child: NestedRouter(selector: AppSelectors.tabsNested)));
    // this.blockSameUrl = false;
  }

  @Url("/unknown")
  void unknown() {
    this.page =
        MaterialPage<dynamic>(key: ValueKey("unknown"), child: UnknownScreen());
  }

  @override
  Action notFoundAction(Uri uri) {
    return SimpleNavPSActions.unknown();
  }

  @override
  AuthMeta authMeta(NavCommonI navState) {
    throw UnimplementedError();
  }
}
