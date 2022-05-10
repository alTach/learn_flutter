import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: SwitchProvider())],
        child: Scaffold(
          appBar: AppBar(
              title: Text(
            'Homework Provider',
          )),
          body: Center(
            child: Square(),
          ),
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SwitchProvider _switchStore = Provider.of<SwitchProvider>(context);
    getRandom()=>Color.fromARGB(100, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
          height: Random().nextInt(400).toDouble(),
          width: Random().nextInt(400).toDouble(),
          color: _switchStore._state ? getRandom() : getRandom(),
        ),
        Switch(
          onChanged: (bool value) {
            _switchStore.toggle(value);
          },
          value: _switchStore._state,
        )
      ],
    );
  }
}

class SwitchProvider extends ChangeNotifier {
  var _state = false;

  toggle(bool state) {
    _state = state;
    notifyListeners();
  }
}
