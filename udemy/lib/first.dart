import 'package:flutter/material.dart';
import 'package:udemy/second.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String text = 'Some text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${text }'),
            ElevatedButton(
              onPressed: () => {
                // Route route = MaterialPageRoute(builder: (context) => SecondPage()),
                // Navigator.push(context, route);
                _returnDataFromSecondScreen(context)
              },
              child: Text('Go to second page'),
            )
          ],
        ),
      ),
    );
  }

  _returnDataFromSecondScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );

    setState(() {
      text = result;
    });
  }
}
