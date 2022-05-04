import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: FirstPage(),
  routes: {
    '/first': (context) => FirstPage(),
    '/second': (context) => SecondPage()
  },
));

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Simple Routing'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              User user = new User(name: 'Konstantin', age: 34);
              Navigator.pushNamed(context, '/second', arguments: user);
            },
            child: Text('Move to Page 2'),
          ),
        ),
      );
  }
}


class SecondPage extends StatelessWidget {
  User ?user;
  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${this.user?.name} - ${this.user?.age}'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Page 2'),
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  User({this.name = '', this.age = 0});
}