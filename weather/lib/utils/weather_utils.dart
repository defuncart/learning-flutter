import 'package:flutter/material.dart';
import 'package:weather/enums/weather_condition.dart';

/// A collection of util methods
class WeatherUtils {
  // Converts a string (e.g. 'sn') to a weather condition (e.g. WeatherCondition.snow)
  static WeatherCondition stringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }

  /// Converts a weather condition to a filepath of the relevant image asset
  static String weatherConditionToImageFilepath(WeatherCondition condition) {
    String filename;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        filename = 'clear';
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        filename = 'snow';
        break;
      case WeatherCondition.heavyCloud:
        filename = 'cloudy';
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        filename = 'rainy';
        break;
      case WeatherCondition.thunderstorm:
        filename = 'thunderstorm';
        break;
      case WeatherCondition.unknown:
        filename = 'clear';
        break;
    }
    return 'assets/images/$filename.png';
  }

  /// Converts a weather condition to a primary color
  static Color weatherConditionToBackgroundColor(WeatherCondition condition) {
    Color backgroundColor;

    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        backgroundColor = Colors.yellow;
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        backgroundColor = Colors.lightBlue;
        break;
      case WeatherCondition.heavyCloud:
        backgroundColor = Colors.grey;
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        backgroundColor = Colors.indigo;
        break;
      case WeatherCondition.thunderstorm:
        backgroundColor = Colors.deepPurple;
        break;
      case WeatherCondition.unknown:
        backgroundColor = Colors.lightBlue;
        break;
    }

    return backgroundColor;
  }

  /// Converts a weather condition to a background color
  static Color weatherConditionToPrimaryColor(WeatherCondition condition) {
    Color primaryColor;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        primaryColor = Colors.orangeAccent;
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        primaryColor = Colors.lightBlueAccent;
        break;
      case WeatherCondition.heavyCloud:
        primaryColor = Colors.blueGrey;
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        primaryColor = Colors.indigoAccent;
        break;
      case WeatherCondition.thunderstorm:
        primaryColor = Colors.deepPurpleAccent;
        break;
      case WeatherCondition.unknown:
        primaryColor = Colors.lightBlueAccent;
        break;
    }

    return primaryColor;
  }
}
