import 'package:commerce/src/routes/routes.gr.dart';
import 'package:commerce/src/store/app_state.dart';
import 'package:commerce/src/store/pstates/auth.dart';
import 'package:commerce/src/store/pstates/snack.dart';
import 'package:commerce/src/store/selectors/app_selectors.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: SelectorListener<AppState, Auth>(
        selector: AppSelectors.auth,
        listener: (context, auth) {
          if (auth.loggedout) {
            // redirect to login screen
          }
          print("auth changed $auth");
        },
        onInitState: (context, state) {
          context.dispatch(
              AuthActions.user(stream: FirebaseAuth.instance.userChanges()));
        },
        child: MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          builder: (context, child) {
            return Scaffold(
                body: Stack(children: [child ?? Placeholder(), SnackWidget()]));
          },
        ),
      ),
    );
  }
}

class SnackWidget extends StatefulWidget {
  @override
  _SnackWidgetState createState() => _SnackWidgetState();
}

class _SnackWidgetState extends State<SnackWidget> {
  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, SnackState>(
      selector: AppSelectors.snack,
      builder: (context, snack) {
        print("Snack Message ${snack.message}");
        return Visibility(
          visible: snack.message.isNotEmpty,
          child: Positioned(
              top: 40,
              left: 60,
              child: Text(
                snack.message,
                style: TextStyle(fontSize: 24, color: Colors.redAccent),
              )),
        );
      },
    );
  }
}
