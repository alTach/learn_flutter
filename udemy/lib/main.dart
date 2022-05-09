import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my-count-page.dart';
import 'my-event-page.dart';
import 'my-user-page.dart';

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CounterProvider(),),
        ],
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Provide demo'),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.add),
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                    ),
                    Tab(
                      icon: Icon(Icons.message),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [MyCountPage(), MyUserPage(), MyEventPage()],
              ),
            ),
          )
      ),
    );
  }
}
