import 'package:flutter/material.dart';
import 'package:udemy/api/weather_api.dart';

class LocationScrean extends StatefulWidget {
  const LocationScrean();

  @override
  State<LocationScrean> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScrean> {

  getLocationData() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecastWithCity();
    if (weatherInfo == null) {
      print('Weather was null, $weatherInfo')
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
