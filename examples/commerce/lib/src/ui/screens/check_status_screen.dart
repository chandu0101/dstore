import 'package:commerce/src/store/app_state.dart';
import 'package:commerce/src/store/pstates/auth.dart';
import 'package:commerce/src/store/selectors/app_selectors.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/material.dart';
import "package:auto_route/auto_route.dart";
import 'package:commerce/src/routes/routes.gr.dart';

class CheckStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorListener<AppState, Auth>(
        selector: AppSelectors.auth,
        listener: (context, auth) {},
        onInitState: (context, auth) {
          if (auth.user.firstEventArrived && auth.user.data == null) {
            // not logged in
            // context.rou
            print("Replacing");
            context.router.replace(LoginScreenRoute());
          }
        },
        child: Scaffold(
          body: Center(
            child: SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                strokeWidth: 7,
              ),
            ),
          ),
        ));
  }
}
