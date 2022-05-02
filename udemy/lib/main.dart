import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        backgroundColor: Colors.indigo,
        body: Padding(padding: EdgeInsets.all(60),
        child: Text('Tap + to increment',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30)),),
        // body: Center(
        //   child: ,
        // ),
      ),
    );
  }
}
