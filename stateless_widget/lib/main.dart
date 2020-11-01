import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Stateless Widget"),
            backgroundColor: Colors.blue,
          ),
          backgroundColor: Colors.white,
          body: Container(),
        )
    );
  }
}
