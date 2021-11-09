import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(),
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
  bool toggle = true;

  // function that gets the data from a (testing) REST API endpoint and saves it
  // into "data"
  void getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test REST API'),
      ),
      body: toggle ? Center(
        child: ElevatedButton(
          child: Text("Get data"),
          onPressed: getData,
        ) : ElevatedButton(
          child: Text("test"),
          onPressed: getData,
        ),
      ),
    );
  }
}
