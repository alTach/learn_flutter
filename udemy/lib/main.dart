import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        // backgroundColor: Colors.indigo,
        body: BodyListView(),
        // body: Center(
        //   child: ,
        // ),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<ListItem> items = List.generate(10000, (index) =>
  index % 6 == 0
      ? HeadingItem('Heading ${index}')
      : MessageItem('Sender ${index}', 'Message body $index'));
  return ListView.builder(itemBuilder: (context, index) {
      final item = items[index];
      if (item is HeadingItem) {
        return ListTile(title: Text(item.heading, style: Theme
            .of(context)
            .textTheme
            .headline5,),);
      } else if (item is MessageItem) {
        return ListTile(title: Text(item.sender),
          subtitle: Text(item.body),
          trailing: Icon(Icons.arrow_right),
          leading: Icon(Icons.insert_photo),);
      }
      return Text('sd');
    }, itemCount: items.length,);
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}