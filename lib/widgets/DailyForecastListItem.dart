import 'package:flutter/material.dart';
import '../models/ConsolidatedWeather.dart';
import '../utils/getDay.dart';

class DailyForecastListItem extends StatelessWidget {
  DailyForecastListItem({Key? key, required this.consolidatedWeather})
      : super(key: key);

  final ConsolidatedWeather consolidatedWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: Column(
        children: [
          Container(
              width: 220,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Center(
                          child: Text(
                        getDay(this.consolidatedWeather.applicableDate),
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w900),
                      )),
                    ),
                    Image.network(
                      'http://localhost:3333/static/img/weather/png/${this.consolidatedWeather.weatherStateAbbr}.png',
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 26.8, 0, 26.8),
                      child: Text(
                        this.consolidatedWeather.theTemp.toStringAsFixed(1),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 47),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoContainer(
                            label: "min",
                            value: this
                                .consolidatedWeather.minTemp
                                .toStringAsFixed(1)),
                        _InfoContainer(
                          label: "max",
                          value: this
                              .consolidatedWeather.maxTemp
                              .toStringAsFixed(1),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoContainer(
                            label: "wind speed",
                            value: this
                                .consolidatedWeather.windSpeed
                                .toStringAsFixed(1)),
                        _InfoContainer(
                            label: "wind direction",
                            value: this
                                .consolidatedWeather.windDirectionCompass
                                .toString())
                      ],
                    )
                  ],
                ),
              )),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}

class _InfoContainer extends StatelessWidget {
  const _InfoContainer({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(this.label,
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
          ),
          Text(
            this.value,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
