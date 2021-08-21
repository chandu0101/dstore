import 'dart:async';

import 'package:basic/src/store/app_state.dart';
import 'package:basic/src/store/pstates/simple_ps.dart';
import 'package:basic/src/store/selectors/app_selectors.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
    };
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    print(error);
    print(stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DStore Basic"),
      ),
      body: SelectorBuilder<AppState, SimplePS>(
        selector: AppSeelctors.simplePS,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Count ${state.count}"),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          context.dispatch(SimplePSActions.increment());
                        },
                        child: Text("Increment")),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          context.dispatch(SimplePSActions.decrement());
                        },
                        child: Text("Decrement")),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
