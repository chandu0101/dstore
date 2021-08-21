import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("rendering unkown");
    return Scaffold(
      body: Center(
        child: Text("Unkonwn Path"),
      ),
    );
  }
}
