import 'package:flutter/material.dart';

void main() {
  return runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('asdasd'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                LinearProgressIndicator(value: 23, color: Colors.cyanAccent),
                Text('23%', style: TextStyle(color: Colors.white)),
                Text('Press button to download',
                    style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.download),
        ),
      ),
    );
  }
}
