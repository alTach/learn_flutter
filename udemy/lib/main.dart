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
        body: Stack(
          alignment: Alignment.center,
          children: [
          Icon(Icons.tv, size: 500, color: Colors.red),
          Positioned(child: Text('TV'), top: 50, left: 45,)
        ],),
        // body: Center(
        //   child: ,
        // ),
      ),
    );
  }
}
