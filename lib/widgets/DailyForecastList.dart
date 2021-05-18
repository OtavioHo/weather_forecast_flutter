import 'package:flutter/material.dart';
import 'DailyForecastListItem.dart';

class DailyForecastList extends StatelessWidget {
  DailyForecastList({Key? key, required this.consolidatedWeatherArray}) 
    : super(key: key);

  final List<Map> consolidatedWeatherArray;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: consolidatedWeatherArray.map(
        (consolidatedWeather) => 
          DailyForecastListItem(consolidatedWeather: consolidatedWeather,)).toList(),);
  }

}