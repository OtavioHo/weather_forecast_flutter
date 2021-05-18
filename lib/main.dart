import 'package:flutter/material.dart';
import 'widgets/CitySelectionList.dart';

void main() {
  runApp(MyApp());
}

final List<Map> cities = [
  {"city": "Lisbon", "woeid": 742676},
  {"city": "London", "woeid": 44418},
  {"city": "New York", "woeid": 2459115},
  {"city": "São Paulo", "woeid": 455827}
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(flex: 1, child: Center(child: CitySelectionList(cities: cities))),
              Expanded(flex: 5, child: Text("Daily Forecast"))
            ],
          ),
        ),
      ),
    );
  }
}