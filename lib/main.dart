import 'package:flutter/material.dart';
import 'package:teapayment_challenge_flutter/models/ConsolidatedWeather.dart';
import 'widgets/CitySelectionList.dart';
import 'widgets/DailyForecastList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

final List<Map> cities = [
  {"city": "Lisbon", "woeid": 742676},
  {"city": "London", "woeid": 44418},
  {"city": "New York", "woeid": 2459115},
  {"city": "São Paulo", "woeid": 455827}
];

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedCity = cities[0]["woeid"];
  List<dynamic> consolidatedWeatherArray = [];

  Future<void> fetchWeather() async {
    final response = await http
        .get(Uri.http('localhost:3333', 'api/location/$selectedCity'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["consolidated_weather"].removeLast();
      
      setState(() {
        consolidatedWeatherArray =
            jsonResponse["consolidated_weather"];
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weather');
    }
  }

  @override
  void initState() {
    super.initState();

    fetchWeather();
  }

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
                    fetchWeather();
                  },
                ))
              ]),
              Wrap(children: [
                DailyForecastList(
                  consolidatedWeatherArray: consolidatedWeatherArray
                      .map((consolidatedWeather) =>
                          ConsolidatedWeather.fromJson(consolidatedWeather))
                      .toList(),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
