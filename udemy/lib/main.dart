import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Scaffold(
          appBar: AppBar(
            title: Text(' Register Form'),
          ),
          body: Text("sdadas"),
        ));
  }

  @override
  void initState() {
    loadData();
  }
}


Future<http.Response> getData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  return await http.get(url);
}

void loadData() {
  getData().then((res) => {
    if (res.statusCode == 200) {
      print(res.body)
    } else {
      print(res.statusCode)
    }
  }).catchError((err){
    debugPrint(err.toString());
  });
}