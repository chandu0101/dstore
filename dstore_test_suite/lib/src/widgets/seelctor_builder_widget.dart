import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_flutter_selectors.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart';

class SelectorBuilderWidget extends StatelessWidget {
  const SelectorBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, SimpleFlutterSelectors>(
      selector: AppSelectors.simpleFlutterSelector,
      builder: (context, state) {
        print("building selector");
        return Text("${state.count}");
      },
    );
  }
}
