import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Vanilla Demo', home: MyHomePage());
  }
}

// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return
// }

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double _size = 50;
    return Scaffold(
      appBar: AppBar(
        title: Text(' Vanilla Demo'),
      ),
      body: Center(
        child: Row(
          children: [
            Container(
              child: IconButton(
                icon: _rating >= 1 ? Icon(Icons.stars) : Icon(Icons.star_border),
                iconSize: _size,
                color: Colors.indigo[500],
                onPressed: () {
                  setState(() {
                    _rating = 1;
                  });
                },
              ),
            ),
            Container(
              child: IconButton(
                icon: _rating >= 2 ? Icon(Icons.stars) : Icon(Icons.star_border),
                iconSize: _size,
                color: Colors.indigo[500],
                onPressed: () {
                  setState(() {
                    _rating = 2;
                  });
                },
              ),
            ),
            Container(
              child: IconButton(
                icon: _rating >= 3 ? Icon(Icons.stars) : Icon(Icons.star_border),
                iconSize: _size,
                color: Colors.indigo[500],
                onPressed: () {
                  setState(() {
                    _rating = 3;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
