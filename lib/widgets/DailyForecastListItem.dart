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
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Center(child: Text('Monday')),
                  Image.network('http://localhost:3333/static/img/weather/png/c.png', width: 100,),
                  Text('25'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [Text('min'), Text('20')],),
                      Column(children: [Text('max'), Text('27')],)
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [Text('wind speed'), Text('20')],),
                      Column(children: [Text('wind direction'), Text('27')],)
                    ],)
                ],
              )),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
