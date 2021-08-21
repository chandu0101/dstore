import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/screens/screens/setings_details_screen.dart';
import 'package:dstore_test_suite/src/screens/screens/settins_list_screen.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:path_to_regexp/path_to_regexp.dart';
part 'setings_nav.ps.dstore.dart';

@PState(nav: true)
class $_SettingsNav extends NestedNavStateI<dynamic> {
  String? selectedSetting;
  bool listp = false;
  @override
  List<Page> buildPages() {
    return [
      MaterialPage<dynamic>(child: SettingsListScreen()),
      if (selectedSetting != null)
        MaterialPage<dynamic>(
            key: ValueKey("/Settings/:id"), child: SettingDetailsScreen())
    ];
  }

  @Url("/settings/:id")
  void details(String id) {
    print("Came to specific settings $id ${this.mounted}");
    this.selectedSetting = id;
  }

  @override
  void initialSetup() {
    this.listp = true;
    this.selectedSetting = null;
  }
}
