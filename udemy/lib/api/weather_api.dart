import 'dart:convert';
import 'dart:developer';

import 'package:udemy/utilities/constants.dart';
import 'package:http/http.dart' as http;

import '../models/weather_forecast_daily.dart';
import '../utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(String? isCity) async {

    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> params;
    if (isCity) {
      var queryParams = {
        "appid": Constants.WEATHER_APP_ID,
        'units': 'metrics',
        'q': cityName
      };
      params = queryParams;
    } else {
      var queryParams = {
        "appid": Constants.WEATHER_APP_ID,
        'units': 'metrics',
        'lat': location.toString(),
        'lon': location.toString(),
      };
      params = queryParams;
    }


    var uri = Uri.https(
        Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH,
        params);

    log(uri.toString());

    var response = await http.get(uri);
    print('response ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}

