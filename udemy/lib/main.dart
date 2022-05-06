import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: FirstPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (BuildContext context) => FirstPage());
          case '/second':
            return MaterialPageRoute(
                builder: (BuildContext context) => SecondPage(settings.arguments as User));
          case '/third':
            return MaterialPageRoute(
                builder: (BuildContext context) => ThirdPage(settings.arguments as User));
        }
      },
      // routes: {
      //   '/first': (context) => FirstPage(),
      //   '/second': (context) => SecondPage()
      // },
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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                User user = new User(name: 'Konstantin', age: 34);
                Navigator.pushNamed(context, '/second', arguments: user);
              },
              child: Text('Move to Page 2'),
            ),
            ElevatedButton(
                onPressed: () {
                  User user = new User(name: 'Vova', age: 44);
                  Navigator.pushNamed(context, '/third', arguments: user);
                },
                child: Text('Move to Page 3'))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final User user;

  SecondPage(this.user);

  @override
  Widget build(BuildContext context) {
    // user = ModalRoute.of(context)!.settings.arguments as User;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${this.user.name} - ${this.user.age}'),
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

class ThirdPage extends StatelessWidget {
  final User user;

  ThirdPage(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Some ${user.name} text')),
      body: Text('Button text'),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name = '', this.age = 0});
}
