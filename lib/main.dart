import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

// ThemeData type for darkmode
final ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Data from REST API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: _darkTheme,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test REST API'),
      ),
    );
  }
}
