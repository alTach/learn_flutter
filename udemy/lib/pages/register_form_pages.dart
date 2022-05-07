import 'package:flutter/material.dart';

class RegisterFormPages extends StatefulWidget {
  @override
  _RegisterFormPagesState createState() => _RegisterFormPagesState();

}

class _RegisterFormPagesState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Register Form'),),
      body: Form(child: ListView(
        padding: EdgeInsets.all(16),
        children: [

        ],
      ),),);
  }

}