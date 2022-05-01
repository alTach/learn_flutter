import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'This is my home page',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
    ),
  );
}
