import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rowDate = DateTime(1485789600);
    var dateFormat = DateFormat('EEEE');
    print(dateFormat.format(rowDate));
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
}
