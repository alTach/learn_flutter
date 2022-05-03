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
        // backgroundColor: Colors.indigo,
        body: BodyListView(),
        // body: Center(
        //   child: ,
        // ),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return Center(
    child: ListView(
      // itemExtent: 300,
      // scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8),
      reverse: true,
      children: [
        ListTile(
          title: Text('Sun'),
          subtitle: Text('Today clean'),
          leading: Icon(Icons.sunny),
          trailing: Icon(Icons.keyboard_arrow_right) ,
        ),
        ListTile(
          title: Text('Cloudy'),
          leading: Icon(Icons.cloud),
          trailing: Icon(Icons.keyboard_arrow_right) ,
          subtitle: Text('Today clean'),
        ),
        ListTile(
          leading: Icon(Icons.snowing),
          trailing: Icon(Icons.keyboard_arrow_right) ,
          title: Text('Snow'),
          subtitle: Text('Today clean'),
        ),
      ],
    ),
  );
}
