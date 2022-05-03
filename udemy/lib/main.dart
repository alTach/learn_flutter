import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          title: Text('Weather', style: TextStyle(color: Colors.black87)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black87),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: _BuildBody(),
      ),
    );
  }
}

Widget _BuildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: _weatherDescription(),
        )),
        Divider(),
        _temperature(),
        Divider(),
        _temperatureForecast(),
        Divider(),
        _footerRatings(),
      ],
    ),
  );
}

Widget _headerImage() {
  return Image(
    image: NetworkImage(
        'https://d279m997dpfwgl.cloudfront.net/wp/2017/12/weather_album-art-1000x1000.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(children: [
    Text(
      'Tuesday - May 22',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Divider(),
    Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      style: TextStyle(color: Colors.grey),
    ),
  ]);
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15',
                style: TextStyle(color: Colors.deepPurple),
              )
            ],
          ),
          Row(
            children: [
              Text(
                'Lemasoll, Cyprus',
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
      spacing: 10,
      children: List.generate(
        7,
        (index) => Chip(
          backgroundColor: Colors.grey.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: Colors.grey),
          avatar: Icon(
            Icons.cloud,
            color: Colors.blue,
          ),
          label: Text(
            '${index + 20}C',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ));
}

Row _footerRatings() {
  var stars = List.generate(
      5,
      (index) => Icon(
            Icons.star,
            color: index < 3 ? Colors.yellow : Colors.grey,
          ));
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Text('Info with open weathermap.com'),
    ...stars
  ]);
}
