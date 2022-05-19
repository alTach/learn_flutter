import 'package:flutter/material.dart';
import 'package:udemy/screans/location.dart';
import 'package:udemy/screans/waether_forecast_screan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite CRUD Demo',
      home: LocationScrean(),
    );
  }
}
