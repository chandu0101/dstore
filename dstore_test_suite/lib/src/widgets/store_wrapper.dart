import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:flutter/material.dart';

class StoreWrapper extends StatelessWidget {
  final Widget child;
  const StoreWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
