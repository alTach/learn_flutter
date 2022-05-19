import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/models/weather_forecast_daily.dart';

import '../utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var city = snapshot.data?.city!.name;
    var country = snapshot.data?.city!.country;
    var forecastList = snapshot.data!.list;
    var formatedDate = DateTime.fromMicrosecondsSinceEpoch(forecastList![0]?.dt ?? 0);

    return Container(
      child: Column(
        children: [
          Text(
            '$city $country',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 28),
          ),

          Text(Util.getFormatedDate(formatedDate), style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
}
