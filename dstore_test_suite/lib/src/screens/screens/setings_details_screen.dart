import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/setings_nav.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart';

class SettingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, SettingsNav>(
      selector: AppSelectors.settingNav,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Setting ${state.selectedSetting}"),
          ),
          body: Center(
            child: Text("Setting ${state.selectedSetting}"),
          ),
        );
      },
    );
  }
}
