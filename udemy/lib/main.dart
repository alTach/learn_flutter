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
        body: Container(
          decoration: BoxDecoration(color: Colors.amber, border: Border.all()),
          alignment: Alignment.center,
          // width: 200,
          // height: 100,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Icon(Icons.add, size: 40, color: Colors.red,),
            Icon(Icons.add, size: 200, color: Colors.green,),
            Icon(Icons.add, size: 40, color: Colors.yellow,),
          ],)),
        // body: Center(
        //   child: ,
        // ),
      ),
    );
  }
}
