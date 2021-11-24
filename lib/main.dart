import 'package:flutter/material.dart';
import 'ui/dark_theme.dart';
import 'business/rest_api_service.dart';

RestApiService? restApiGetService = new RestApiService();



void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Data from REST API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: darkThemeSimple,
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
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
      body: toggle
          ? Center(
              child: ElevatedButton(
              child: Text("Get data"),
              onPressed: getData,
            ))
          : Column(children: <Widget>[
              ElevatedButton(
                child: Text("Hide data"),
                onPressed: getData,
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (context, i) {
                        if (i.isOdd) return const Divider();
                        return ListTile(
                            title: Text(data![i % data!.length]["title"]),
                            subtitle: Text(data![i % data!.length]["body"]));
                      })),
            ]),
    );
  }
}
