import 'package:dstore_test_suite/src/store/pstates/nav/books_nav.dart';
import "package:dstore_flutter/dstore_flutter.dart";
import 'package:flutter/material.dart';

class BooksListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Books List"),
          TextField(
            decoration: InputDecoration(labelText: "Inpu"),
          ),
          ListTile(
            title: Text("Book1"),
            onTap: () {
              context.dispatch(BooksNavActions.details(id: "1"));
            },
          )
        ],
      ),
    );
  }
}
