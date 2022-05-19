import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy/models/weather_forecast_daily.dart';

import '../utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;
    var pressure = forecastList[0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity!;
    var speed = forecastList[0].speed!;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Util.getItem(FontAwesomeIcons.thermometer, pressure.round(), 'mm HG'),
          Util.getItem(FontAwesomeIcons.rainbow, humidity.round(), '%'),
          Util.getItem(FontAwesomeIcons.wind, speed.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
