class ConsolidatedWeather {
  final String applicable_date;
  final String weather_state_abbr;
  final double the_temp;
  final double min_temp;
  final double max_temp;
  final double wind_speed;
  final String wind_direction_compass;

  ConsolidatedWeather({
      required this.applicable_date,
      required this.weather_state_abbr,
      required this.the_temp,
      required this.min_temp,
      required this.max_temp,
      required this.wind_speed,
      required this.wind_direction_compass
      });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    return ConsolidatedWeather(
      applicable_date: json["applicable_date"],
      weather_state_abbr: json["weather_state_abbr"],
      the_temp: json["the_temp"],
      min_temp: json["min_temp"],
      max_temp: json["max_temp"],
      wind_speed: json["wind_speed"],
      wind_direction_compass: json["wind_direction_compass"]
    );
  }
}
