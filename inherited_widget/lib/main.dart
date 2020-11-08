import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CountProvider extends InheritedWidget {
  final Widget child;
  final Counter counter;

  CountProvider({this.child, this.counter}) : super(child: child);

  static CountProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class Counter {
  int count;

  Counter(this.count) {}

  increment() {
    count++;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CountProvider(
          counter: Counter(0),
          child: MyHomePage(title: 'Flutter Demo Home Page'))
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CountProvider countProvider;

  void _incrementCounter() {
    setState(() {
      countProvider.counter.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    countProvider = CountProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${countProvider.counter.count}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
