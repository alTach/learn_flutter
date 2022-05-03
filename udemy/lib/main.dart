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
  final List<String> items = List.generate(10000, (index) => 'item-${index}');
  return Center(
    child: ListView.builder(itemBuilder: (context, index) {
      return Card(child: ListTile(
        title: Text('${items[index]}'),
        trailing: Icon(Icons.keyboard_arrow_right),
          leading: Icon(Icons.insert_photo)
      ),
      );
    }, itemCount: items.length,),
  );
}
