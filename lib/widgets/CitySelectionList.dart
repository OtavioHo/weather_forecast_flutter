import 'package:flutter/material.dart';

class CitySelectionList extends StatelessWidget {
  CitySelectionList({Key? key, required this.cities}) : super(key: key);

  final List<Map> cities;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cities
          .map((city) => Container(
                height: 30,
                child: Text("${city["city"]}"),
              ))
          .toList(),
    );
  }
}
