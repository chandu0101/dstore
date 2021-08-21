import 'package:flutter/material.dart';

class BookAuthorScrren extends StatelessWidget {
  final String name;

  const BookAuthorScrren({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book author $name"),
      ),
      body: ListView(
        children: [
          Text("BooksAuthorScreen"),
          Text("Book author $name"),
          // Counter(),
          // TextButton(
          //     onPressed: () {
          //       context.dispatch(SamplePSActions.incrementCount());
          //     },
          //     child: Text("Increment Count"))
        ],
      ),
    );
  }
}
