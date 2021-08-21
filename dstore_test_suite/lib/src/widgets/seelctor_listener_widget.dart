import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart';

class SelectorListenerWidget extends StatelessWidget {
  const SelectorListenerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectorListener(
      selector: AppSelectors.simpleFlutterSelector,
      listener: (context, state) {
        print("selector listener");
      },
    );
  }
}
