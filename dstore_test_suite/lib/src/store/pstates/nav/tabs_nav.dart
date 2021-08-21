import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/screens/tabs/tabs_screens.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:flutter/material.dart' hide Action;

part 'tabs_nav.ps.dstore.dart';

@PState(nav: true)
class $_TabsNestedStack extends NestedNavStateI<dynamic> {
  @Url("/tab2", nestedType: $_TabsNestedStack_Nested)
  void tab2() {
    this.page = MaterialPage<dynamic>(
        child: NestedRouter(selector: AppSelectors.tabsNested_nested));
  }

  @Url("/tab3")
  void tab3() {
    this.page = MaterialPage<dynamic>(child: Tab3());
  }

  @override
  void initialSetup() {
    this.page = MaterialPage<dynamic>(child: Tab1());
  }
}

@PState(nav: true)
class $_TabsNestedStack_Nested extends NestedNavStateI<dynamic> {
  String? tItem;

  @override
  List<Page> buildPages() {
    return [
      MaterialPage<dynamic>(child: Tab2StackHome()),
      if (tItem != null) MaterialPage<dynamic>(child: Tab2StackItemDetails())
    ];
  }

  @override
  void initialSetup() {
    this.tItem = null;
  }

  @Url("/tab2/:id")
  void tabItemDetails(String id) {
    this.tItem = id;
  }
}
