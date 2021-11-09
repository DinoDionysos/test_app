import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
  // List for the data from the REST API
  List? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test REST API'),
      ),
      body: new Center(
        child: new ElevatedButton(
          child: new Text("Get data"),
          onPressed: data = null,
        ),
      ),
    );
  }
}
