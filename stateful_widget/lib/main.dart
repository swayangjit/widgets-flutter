import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  Color buttonColor = Colors.black;

  void changeColor() {
    counter++;
    if (buttonColor == Colors.black) {
      buttonColor = Colors.red;
    } else {
      buttonColor = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Statefull widget"),
          backgroundColor: Colors.amber,
        ),
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    setState(() {
                      changeColor();
                      print(counter);
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: buttonColor,
                    size: 100.0,
                  )),
              Text("Clicked Counter ${counter}")
            ],
          )),
        ),
      ),
    );
  }
}
