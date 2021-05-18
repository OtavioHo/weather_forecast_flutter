import 'package:flutter/material.dart';

class DailyForecastListItem extends StatelessWidget {
  DailyForecastListItem({Key? key, required this.consolidatedWeather})
      : super(key: key);

  final Map consolidatedWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        children: [
          Container(
              width: 200,
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
                        'Monday',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w900),
                      )),
                    ),
                    Image.network(
                      'http://localhost:3333/static/img/weather/png/c.png',
                      width: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 26.8, 0, 26.8),
                      child: Text(
                        '25',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 47),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoContainer(label: "min", value: "20"),
                        _InfoContainer(label: "max", value: "27",)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoContainer(label: "wind speed", value: "23",),
                        _InfoContainer(label: "wind direction", value: "WN")
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
            padding: const EdgeInsets.fromLTRB(0,16,0,16),
            child: Text(this.label,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center),
          ),
          Text(this.value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),)
        ],
      ),
    );
  }
}
