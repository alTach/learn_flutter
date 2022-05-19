import 'package:flutter/material.dart';

class SearchCountry extends StatelessWidget {
  SearchCountry();

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Select countrt'),),
      body: Row(
        children: [
        Expanded(child: TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.build),
              labelText: 'Country',
              hintText: 'Please enter the country',
            suffixIcon: IconButton(icon: Icon(Icons.one_k), onPressed: () {
              Navigator.pop(context, textController.text);
            },)
          ),
          controller: textController
        ),)
        ],
      ),
    );
  }
}
