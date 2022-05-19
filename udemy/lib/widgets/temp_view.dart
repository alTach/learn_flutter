import 'package:flutter/material.dart';
import 'package:udemy/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList![0].temp!.day!.toStringAsFixed(0);
    var description = forecastList![0].weather![0].description!.toUpperCase();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon, width: 200, color: Colors.black87,),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(fontSize: 54, color: Colors.black87),
              ),
              Text('$description', style: TextStyle(fontSize: 24, color: Colors.black87),)
            ],
          )
        ],
      ),
    );
  }
}
