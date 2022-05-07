import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();

}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text('Second page')),
      body: Center(child: Column(children: [
        TextField(controller: textController,),
          ElevatedButton(onPressed: () => {
            _clickHandler(context, textController.text)
          }, child: Text('return back: ${textController.text}'))
      ],),)
    );
  }

  _clickHandler(BuildContext context, String textToSendBack) {
    Navigator.pop(context, textToSendBack);
  }

}