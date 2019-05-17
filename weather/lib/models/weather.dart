import 'dart:math';
import 'package:weather/enums/weather_condition.dart';
import 'package:weather/utils/weather_utils.dart';

// A model representing the weather forecast
class Weather {
  /// The city
  final String city;

  /// The weather condition
  final WeatherCondition condition;

  /// The weather condition formatted as a phrase
  final String formattedCondition;

  /// The minimum temperature
  final double minTemp;

  /// The current temperature
  final double temp;

  /// The maximum temperature
  final double maxTemp;

  /// When this report was created
  final String created;

  /// When the report was last updated
  final DateTime lastUpdated;

  // constructor
  Weather({
    this.city,
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.created,
    this.lastUpdated,
  });

  // creates a Weather object from a json string
  static Weather fromJson(dynamic json) {
    return Weather(
      city: json['city'],
      condition: WeatherUtils.stringToWeatherCondition(json['weather_state_abbr']),
      formattedCondition: json['weather_state_name'],
      minTemp: _toDouble(json['min_temp'], 1),
      temp: _toDouble(json['temp'], 1),
      maxTemp: _toDouble(json['max_temp'], 1),
      created: json['created'],
      lastUpdated: DateTime.now(),
    );
  }

  // converts a string to a double with a given number of decimal places
  static double _toDouble(dynamic str, int decimalPlaces) {
    double value = str as double;
    double mod = pow(10.0, decimalPlaces);
    return ((value * mod).round().toDouble() / mod);
  }
}
