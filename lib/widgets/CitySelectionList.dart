import 'package:flutter/material.dart';

class CitySelectionList extends StatelessWidget {
  CitySelectionList({Key? key, required this.cities}) : super(key: key);

  final List<Map> cities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: cities
            .map((city) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(child: Text("${city["city"]}")),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
