import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("rendering home");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text("HomeScreen"),
            ),
          ),
        ],
      ),
    );
  }
}
