import 'package:flutter/material.dart';
import '../models/ConsolidatedWeather.dart';
import 'DailyForecastListItem.dart';

class DailyForecastList extends StatelessWidget {
  DailyForecastList({Key? key, required this.consolidatedWeatherArray}) 
    : super(key: key);

  final List<ConsolidatedWeather> consolidatedWeatherArray;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: consolidatedWeatherArray.map(
        (consolidatedWeather) => 
          DailyForecastListItem(consolidatedWeather: consolidatedWeather,)).toList(),);
  }

}