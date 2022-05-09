import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Inherited Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ScopedModel(model: MyModalState(), child: AppRootWidget()),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final rootWidgetState = MyInheritedWidget.of(context)!.myState;
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.headline4),
          Text('${rootWidgetState.counterValue}', style: Theme.of(context).textTheme.headline4),
          // Text('${rootWidgetState.counterValue}')
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Counter(),
              Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final rootWidgetState = MyInheritedWidget.of(context)!.myState;
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;
    return ScopedModelDescendant<MyModalState>(
      rebuildOnChange: true,
        builder: (context, child, model) => Card(
          margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
          color: Colors.yellowAccent,
          child: Column(
            children: <Widget>[
              Text('(Child Widget)'),
              Text('${model.counterValue}', style: Theme.of(context).textTheme.headline4),
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.red,
                    onPressed: () => model._decrementCounter(),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.green,
                    onPressed: () => model._incrementCounter(),
                  ),
                ],
              ),
            ],
          ),
        )
    )
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _MyHomePageState myState;

  MyInheritedWidget({Key? key, required Widget child, required this.myState})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class MyModalState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter(){
   _counter++;
   notifyListeners();
  }
  void _decrementCounter(){
   _counter--;
   notifyListeners();
  }
}