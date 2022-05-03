import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: WeatherForecast());
  }
}

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Head(),
          DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Search(),
                    Region(),
                    Temparature(),
                    TemparatureDetails(),
                    TemparatureDescription(),
                    WeatherWeek(),
                  ],
                ),
              ))
        ],
      ),
      backgroundColor: Colors.deepOrange,
    );
  }
}

Padding Head() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Text(
      'Weather Forecast',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Row Search() {
  return Row(
    children: [
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        'Enter city name',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ),
    ],
  );
}

Container Region() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Text(
          'Murman Oblast, RU',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35),
        ),
        Text(
          'Tuesday, May 4, 2020 ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(.7)),
        )
      ],
    ),
  );
}

Container Temparature() {
  return Container(
    margin: EdgeInsets.only(top: 40, bottom: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.sunny,
              color: Colors.white,
              size: 70,
            )),
        Column(
          children: [
            Text(
              '14 0F',
              style:
                  TextStyle(fontSize: 40, color: Colors.white.withOpacity(.7)),
            ),
            Text(
              'Light snow',
              style:
                  TextStyle(fontSize: 18, color: Colors.white.withOpacity(.7)),
            )
          ],
        )
      ],
    ),
  );
}

Widget TemparatureDetails() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TemparatureDetail('5', 'km/h'),
      TemparatureDetail('3', '%'),
      TemparatureDetail('20', '%'),
    ],
  );
}

class TemparatureDetail extends StatelessWidget {
  String title;
  String subtitle;

  TemparatureDetail(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.snowing),
        Text(
          '$title',
          style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(.7)),
        ),
        Text(
          '$subtitle',
          style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(.7)),
        )
      ],
    );
  }
}

Container TemparatureDescription() {
  return Container(
    margin: EdgeInsets.only(top: 50,bottom: 20),
      child: Text(
    '7-day weather forecast'.toUpperCase(),
    style: TextStyle(color: Colors.white.withOpacity(.7)),
  ));
}

SizedBox WeatherWeek() {
  return SizedBox(
    height: 70,
    child:
      ListView(
        scrollDirection: Axis.horizontal,
        children: [
          WeatherWeekItem('Friday', 6, Icons.sunny),
          WeatherWeekItem('Sartuday', 6, Icons.sunny),
          WeatherWeekItem('Sundy', 6, Icons.sunny),
          WeatherWeekItem('Monday', 6, Icons.sunny),
          WeatherWeekItem('Trueday', 6, Icons.sunny),
          WeatherWeekItem('Wensday', 6, Icons.sunny),
          WeatherWeekItem('Thersday', 6, Icons.sunny),
        ],
      ),
  );
}

class WeatherWeekItem extends StatelessWidget {
  final String day;
  final int temperature;
  final IconData icon;
  WeatherWeekItem(this.day, this.temperature, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: Colors.white.withOpacity(.3), borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(day, style: TextStyle(fontSize: 18),),
        Row(children: [
          Text('${temperature}F', style: TextStyle(fontSize: 16),),
          Container(margin: EdgeInsets.only(left: 10),child: Icon(icon, color: Colors.white,)),
        ],)
      ],),
    );

  }

}