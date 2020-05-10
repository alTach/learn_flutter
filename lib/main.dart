import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorit color?',
      'answer': ['Black', 'Gree', 'Red', 'White']
    },
    {
      'questionText': 'What\'s yout favorit animal?',
      'answer': ['Rabbit', 'Snake', 'Elephant', 'Line']
    },
    {
      'questionText': 'Who is yout favorit instructor?',
      'answer': ['Max', 'Max', 'Max', 'Max']
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('My first App')),
            body: questions.length > _questionIndex
                ? Column(
                    children: [
                      Question(questions[_questionIndex]['questionText']),
                      ...(questions[_questionIndex]['answer'] as List<String>)
                          .map((answer) {
                        return Answer(answer, _answerQuestion);
                      }).toList()
                    ],
                  )
                : Center(
                    child: Text('No more questions'),
                  )));
  }
}
