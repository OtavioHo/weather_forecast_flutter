import 'package:flutter/material.dart';

class CitySelectionList extends StatefulWidget {
  CitySelectionList(
      {Key? key,
      required this.cities,
      required this.selectedCity,
      required this.onSelectCity})
      : super(key: key);

  final List<Map> cities;
  final int selectedCity;
  final Function onSelectCity;

  @override
  _CitySelectionListState createState() => _CitySelectionListState();
}

class _CitySelectionListState extends State<CitySelectionList> {
  int hoveredCity = -1;

  void _onHover(int woeid) {
    setState(() {
      hoveredCity = woeid;
    });
  }

  void _onExitHover() {
    setState(() {
      hoveredCity = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.cities
            .map((city) => GestureDetector(
                  onTap: () {
                    widget.onSelectCity(city["woeid"]);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) {
                      _onHover(city["woeid"]);
                    },
                    onExit: (eveny) {
                      _onExitHover();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3),
                        color: this.widget.selectedCity == city["woeid"]
                            ? Colors.grey
                            : Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            "${city["city"]}",
                            style: TextStyle(
                                decoration: this.hoveredCity == city["woeid"]
                                    ? TextDecoration.underline
                                    : TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
