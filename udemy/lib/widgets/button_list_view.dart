import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';

class ButtonListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const ButtonListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;

    return Column(
      children: [
        Text(
          '7 day for forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.all(16),
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.black87,
              child: Column(
                children: [
                  Text(
                      '${Util.getFormatedDate(DateTime.fromMicrosecondsSinceEpoch(forecastList![index].dt!))}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.list, color: Colors.white,),
                  Text('${forecastList[index].temp!.day}', style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: forecastList!.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
