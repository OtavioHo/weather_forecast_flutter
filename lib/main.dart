import 'package:flutter/material.dart';
import 'widgets/CitySelectionList.dart';
import 'widgets/DailyForecastList.dart';

void main() {
  runApp(MyApp());
}

final List<Map> cities = [
  {"city": "Lisbon", "woeid": 742676},
  {"city": "London", "woeid": 44418},
  {"city": "New York", "woeid": 2459115},
  {"city": "São Paulo", "woeid": 455827}
];

final List<Map> consolidatedWeather = [
  {
    "id": 6686199684005888,
    "weather_state_name": "Heavy Rain",
    "weather_state_abbr": "hr",
    "wind_direction_compass": "W",
    "created": "2021-05-18T15:32:02.751719Z",
    "applicable_date": "2021-05-18",
    "min_temp": 6.17,
    "max_temp": 14.29,
    "the_temp": 14.5,
    "wind_speed": 5.421905916174872,
    "wind_direction": 261,
    "air_pressure": 1013,
    "humidity": 70,
    "visibility": 10.60245665314563,
    "predictability": 77
  },
  {
    "id": 6686199684005888,
    "weather_state_name": "Heavy Rain",
    "weather_state_abbr": "hr",
    "wind_direction_compass": "W",
    "created": "2021-05-18T15:32:02.751719Z",
    "applicable_date": "2021-05-18",
    "min_temp": 6.17,
    "max_temp": 14.29,
    "the_temp": 14.5,
    "wind_speed": 5.421905916174872,
    "wind_direction": 261,
    "air_pressure": 1013,
    "humidity": 70,
    "visibility": 10.60245665314563,
    "predictability": 77
  },
  {
    "id": 6686199684005888,
    "weather_state_name": "Heavy Rain",
    "weather_state_abbr": "hr",
    "wind_direction_compass": "W",
    "created": "2021-05-18T15:32:02.751719Z",
    "applicable_date": "2021-05-18",
    "min_temp": 6.17,
    "max_temp": 14.29,
    "the_temp": 14.5,
    "wind_speed": 5.421905916174872,
    "wind_direction": 261,
    "air_pressure": 1013,
    "humidity": 70,
    "visibility": 10.60245665314563,
    "predictability": 77
  },
  {
    "id": 6686199684005888,
    "weather_state_name": "Heavy Rain",
    "weather_state_abbr": "hr",
    "wind_direction_compass": "W",
    "created": "2021-05-18T15:32:02.751719Z",
    "applicable_date": "2021-05-18",
    "min_temp": 6.17,
    "max_temp": 14.29,
    "the_temp": 14.5,
    "wind_speed": 5.421905916174872,
    "wind_direction": 261,
    "air_pressure": 1013,
    "humidity": 70,
    "visibility": 10.60245665314563,
    "predictability": 77
  },
  {
    "id": 6686199684005888,
    "weather_state_name": "Heavy Rain",
    "weather_state_abbr": "hr",
    "wind_direction_compass": "W",
    "created": "2021-05-18T15:32:02.751719Z",
    "applicable_date": "2021-05-18",
    "min_temp": 6.17,
    "max_temp": 14.29,
    "the_temp": 14.5,
    "wind_speed": 5.421905916174872,
    "wind_direction": 261,
    "air_pressure": 1013,
    "humidity": 70,
    "visibility": 10.60245665314563,
    "predictability": 77
  },
];

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedCity = cities[0]["woeid"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Wrap(children: [
                Center(
                    child: CitySelectionList(
                  cities: cities,
                  selectedCity: selectedCity,
                  onSelectCity: (woeid) {
                    setState(() {
                      selectedCity = woeid;
                    });
                  },
                ))
              ]),
              Wrap(children: [
                DailyForecastList(
                  consolidatedWeatherArray: consolidatedWeather,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
