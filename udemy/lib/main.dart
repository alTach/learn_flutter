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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Tap + to increment'),
              CounterWidget(),
              Text('Tap - to decriment'),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _state = 0;

  @override
  void initState() {
    _state = 0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Container(
        color: Colors.white,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                decrement();
              },
            ),
            Text('${_state}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                increment();
              },
            ),
          ],
        ),
      ),
    );
  }

  increment() {
    setState(() {
      _state++;
    });
  }

  decrement() {
    setState(() {
      _state--;
    });
  }
}
