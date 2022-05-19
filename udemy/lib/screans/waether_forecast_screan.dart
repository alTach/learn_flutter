import 'package:flutter/material.dart';
import 'package:udemy/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:udemy/screans/search_country.dart';
import 'package:udemy/widgets/city_vuiew.dart';
import '../api/weather_api.dart';
import '../widgets/button_list_view.dart';
import '../widgets/detail_view.dart';
import '../widgets/temp_view.dart';

class WaetherForecastScrean extends StatefulWidget {
  @override
  _WaetherForecastScreanState createState() => _WaetherForecastScreanState();
}

class _WaetherForecastScreanState extends State<WaetherForecastScrean> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    this._loadWeatherByCity(_cityName);
  }

  _loadWeatherByCity(String city) {
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(city);
    forecastObject
        .then((weather) => {print(weather.list![0].weather![0].main)});
  }

  _returnDataFromCountryScreen() async {
    final country = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchCountry()));

    setState(() {
      _cityName = country;
      this._loadWeatherByCity(_cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () => {
            Location
          },
        ),
        actions: [
          IconButton(onPressed: _returnDataFromCountryScreen, icon: Icon(Icons.location_city),)
        ],
      ),
      body: ListView(
        children: [
          Container(child: FutureBuilder<WeatherForecast>(
            future: forecastObject, builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  CityView(snapshot: snapshot),
                  SizedBox(height: 50),
                  TempView(snapshot: snapshot),
                  SizedBox(height: 50),
                  DetailView(snapshot: snapshot),
                  SizedBox(height: 50),
                  ButtonListView(snapshot: snapshot),
                ],
              );
            } else {
              return Center(child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              ),);
            }
          },))
        ],
      ),
    );
  }
}
