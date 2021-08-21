import 'package:dstore_test_suite/src/store/pstates/nav/books_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/setings_nav.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/material.dart' hide Action;

class SettingsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Setting List"),
        ListTile(
          title: Text("Setting 1"),
          onTap: () {
            context.dispatch(SettingsNavActions.details(id: "s1"));
          },
        ),
        ListTile(
          title: Text("Setting 2"),
          onTap: () {
            context.dispatch(SettingsNavActions.details(id: "s2"));
          },
        ),
        ListTile(
          title: Text("Books1"),
          onTap: () {
            context.dispatch(BooksNavActions.details(id: "b1"));
          },
        )
      ],
    );
  }
}
