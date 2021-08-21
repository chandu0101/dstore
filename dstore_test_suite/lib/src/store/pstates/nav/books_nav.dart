import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/screens/books/books_details_screen.dart';
import 'package:dstore_test_suite/src/screens/books/books_list_screen.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:path_to_regexp/path_to_regexp.dart';
part "books_nav.ps.dstore.dart";

@PState(nav: true)
class $_BooksNav extends NestedNavStateI<dynamic> {
  bool listP = false;
  String? selectedBook;
  String? author;

  @override
  List<Page> buildPages() {
    print("building booksPages selectedBook ${selectedBook}");
    return [
      MaterialPage<dynamic>(key: ValueKey("books"), child: BooksListScreen()),
      if (selectedBook != null)
        MaterialPage<dynamic>(
            key: ValueKey("books/:id"), child: BookDetailsScreen()),
      // if (author != null) MaterialPage(child: BookAuthorScrren(name: author!))
    ];
  }

  @Url("/books/:id")
  void details(String id) {
    this.selectedBook = id;
    this.author = null;
    this.meta.beforeLeave = bookDetailsBeforeLeave;
  }

  @Url("/books/:id/:name")
  void detailsAuthor(String id, String name) {
    this.author = name;
  }

  @override
  void initialSetup() {
    this.selectedBook = null;
  }
}

BeforeLeaveResult bookDetailsBeforeLeave(AppStateI state) {
  print("before leave executed");
  state = state as AppState;
  return BeforeLeaveResult(
    allowToLeave: false,
    dialogBuilder: (context) {
      return SimpleDialog(
        insetPadding: const EdgeInsets.all(30),
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Are you sure to leave?"),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Yes")),
            ],
          )
        ],
      );
    },
  );
}
