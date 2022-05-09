import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterProvider _state = Provider.of<CounterProvider>(context);
    return Scaffold(body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('ChangeNotifierProviderExample', style: TextStyle(fontSize: 20),),
      SizedBox(height: 50,),
      Text('${_state.counterValue}', style: Theme.of(context).textTheme.displayMedium,),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
        IconButton(onPressed: () => _state._decrementCount(), icon: Icon(Icons.remove), color: Colors.red),
        // IconButton(onPressed: () => _state._incrementCount(), icon: Icon(Icons.add), color: Colors.green),
          Consumer<CounterProvider>(builder: (context, value, child) {
            return IconButton(onPressed: () => value._incrementCount(), icon: Icon(Icons.add), color: Colors.green);
          }),
      ],)
    ],),),);
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCount() {
    _counter++;
    notifyListeners();
  }

  void _decrementCount() {
    _counter--;
    notifyListeners();
  }
}