import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  return runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  _MyFirstAppState createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'WaterBrush_Regular'),
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('My First App'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(10),
              child: _loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                            value: _progressValue, color: Colors.cyanAccent),
                        Text('${(_progressValue * 100).round()}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    )
                  : Center(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image(
                            image: AssetImage('assets/images/bg.jpg'),
                          ),
                          Image.asset('assets/icons/icon.png'),
                          Positioned(
                            top: 16, left: 120,
                            child: Text(
                              'My custom fonts',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                // fontFamily: 'WaterBrush_Regular'
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          timer.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
