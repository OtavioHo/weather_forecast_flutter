import 'package:flutter/material.dart';
import 'package:teapayment_challenge_flutter/models/ConsolidatedWeather.dart';
import 'widgets/CitySelectionList.dart';
import 'widgets/DailyForecastList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants/cities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedCity = cities[0]["woeid"];
  late Future<List<ConsolidatedWeather>> consolidatedWeatherArray;

  Future<List<ConsolidatedWeather>> fetchWeather() async {
    final response = await http
        .get(Uri.http('localhost:3333', 'api/location/$selectedCity'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["consolidated_weather"] != null) {
        List<ConsolidatedWeather> array = new List<ConsolidatedWeather>.from(
          jsonResponse["consolidated_weather"]
              .map((consolidatedWeather) =>
                  ConsolidatedWeather.fromJson(consolidatedWeather))
              .toList());

        return array;
      } else {
        throw Exception('Location not found');
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weather');
    }
  }

  @override
  void initState() {
    super.initState();

    consolidatedWeatherArray = fetchWeather();
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
                      consolidatedWeatherArray = fetchWeather();
                    });
                  },
                ))
              ]),
              Wrap(children: [
                FutureBuilder<List<ConsolidatedWeather>>(
                  future: consolidatedWeatherArray,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DailyForecastList(
                        consolidatedWeatherArray: snapshot.data!,
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
