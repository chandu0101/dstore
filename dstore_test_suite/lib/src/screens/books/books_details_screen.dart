import 'dart:developer';

import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/books_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/setings_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/tabs_nav.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    print("BookDetailsScreen Init State");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("BookDetailsScreen didChangedDeps");
  }

  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, BooksNav>(
        selector: AppSelectors.booksNav,
        builder: (BuildContext context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (Navigator.of(context).userGestureInProgress) {
                return true;
              }
              print("called on pop");
              return false;
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Selected Book is ${state.selectedBook}"),
                ),
                body: Center(
                    child: Column(children: [
                  Text("Selected Book is ${state.selectedBook}"),
                  // Counter(),
                  ListTile(
                    title: Text("Go To Book Author"),
                    onTap: () {
                      context.dispatch(BooksNavActions.detailsAuthor(
                          id: state.selectedBook!,
                          name: "THe One And Only Master :) "));
                    },
                  ),
                  ListTile(
                    title: Text("Go ToSection1"),
                    onTap: () {
                      context.dispatch(SettingsNavActions.details(id: "s1"));
                    },
                  ),
                  ListTile(
                    title: Text("Go NestedNested Stack Tab2"),
                    onTap: () {
                      context.dispatch(
                          TabsNestedStack_NestedActions.tabItemDetails(
                              id: "nested_nested_t1"));
                    },
                  )
                ]))),
          );
        });
  }

  @override
  void didUpdateWidget(covariant BookDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("BookDetailsScreen didUpdateWidget");
  }
}
