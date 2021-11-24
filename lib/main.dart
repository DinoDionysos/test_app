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
  State<MyHomePage> createState() => MyHomePageState();
}



class MyHomePageState extends State<MyHomePage> {
  Future<List>? restApiData;

  @override
  initState() {
    super.initState();
    restApiData = restApiGetService?.getJson();
  }

  @override
  Widget build(BuildContext context) {
    return MyHomePageView(this);
  }
}



class MyHomePageView extends StatelessWidget {
  final MyHomePageState? state;
  const MyHomePageView(this.state, {Key? key}) : super(key: key);

  Widget buildRow(String title, String subtitle) {
    return Column(children: <Widget>[
      ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
      const Divider()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test REST API'),
      ),
      body: FutureBuilder<List>(
          future: state!.restApiData,
          builder: (
              BuildContext context,
              AsyncSnapshot<List> snapshot,
              ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                final error = snapshot.error;
                return Center(child: Text(error.toString()));
              } else if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return buildRow(snapshot.data![index]['title'],
                        snapshot.data![index]['body']);
                  },
                );
              }
            }
            return const Text('sum ting wong');
          }),
    );
  }
}


