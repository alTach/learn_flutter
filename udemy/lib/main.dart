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
        body: Row(children: [
          Expanded(flex: 2,child: Image.network('https://angularscript.com/wp-content/uploads/2015/07/Angularjs-SVG-Icon-Directive.jpg')),
          Expanded(flex: 3,child: Container(padding: EdgeInsets.all(30), color: Colors.yellow, child: Text('1'),)),
          Expanded(flex: 2, child: Container(padding: EdgeInsets.all(30), color: Colors.green, child: Text('2'),)),
          Expanded(child: Container(padding: EdgeInsets.all(30), color: Colors.red, child: Text('3'),)),
        ],),
        // body: Center(
        //   child: ,
        // ),
      ),
    );
  }
}
