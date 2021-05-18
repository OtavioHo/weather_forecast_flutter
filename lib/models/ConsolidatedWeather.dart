class ConsolidatedWeather {
  final String applicableDate;
  final String weatherStateAbbr;
  final double theTemp;
  final double minTemp;
  final double maxTemp;
  final double windSpeed;
  final String windDirectionCompass;

  ConsolidatedWeather({
      required this.applicableDate,
      required this.weatherStateAbbr,
      required this.theTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.windSpeed,
      required this.windDirectionCompass
      });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    return ConsolidatedWeather(
      applicableDate: json["applicable_date"],
      weatherStateAbbr: json["weather_state_abbr"],
      theTemp: json["the_temp"],
      minTemp: json["min_temp"],
      maxTemp: json["max_temp"],
      windSpeed: json["wind_speed"],
      windDirectionCompass: json["wind_direction_compass"]
    );
  }
}
