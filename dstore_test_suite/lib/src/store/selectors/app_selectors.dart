import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/books_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/setings_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/tabs_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_flutter_selectors.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_selector_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_form_ps.dart';
part 'app_selectors.dstore.dart';

@Selectors()
class $_AppSelectors {
  static SimpleSelectorPS simpleSelector(AppState state) =>
      state.simpleSelectorPS;

  static SimpleFlutterSelectors simpleFlutterSelector(AppState state) =>
      state.simpleFlutterSelector;

  static SimpleFormPS simpleForm(AppState state) => state.simpleFormPS;

  static SimpleNavPS simpleNavPS(AppState state) => state.simpleNavPS;

  static BooksNav booksNav(AppState state) => state.booksNav;

  static SettingsNav settingNav(AppState state) => state.settingsNav;

  static TabsNestedStack tabsNested(AppState state) => state.tabsNested;

  static TabsNestedStack_Nested tabsNested_nested(AppState state) =>
      state.tabsNested_Nested;
}
