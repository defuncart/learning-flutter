import 'package:weather/models/weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// A service which handles weather requests
class WeatherService {
  // A http client
  final http.Client httpClient = http.Client();

  // Constructor
  WeatherService();

  // Gets the weather for a given city
  Future<Weather> getWeather(String city) async {
    final int locationId = await _MetaWeatherService.getLocationId(httpClient, city);
    return _MetaWeatherService.fetchWeather(httpClient, locationId);
  }
}

// A service which handles requests for metaweather.com
class _MetaWeatherService {
  /// The base url
  static const baseUrl = 'https://www.metaweather.com';

  /// The endpoint
  static const baseEndpoint = 'api/location';

  // Gets the locationId (woeid) for a given city
  static Future<int> getLocationId(http.Client httpClient, String city) async {
    final locationUrl = '$baseUrl/$baseEndpoint/search/?query=$city';
    final locationResponse = await httpClient.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('Error getting locationId for $city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  // Gets the weather for a given locationId (woeid)
  static Future<Weather> fetchWeather(http.Client httpClient, int locationId) async {
    final weatherUrl = '$baseUrl/$baseEndpoint/$locationId';

    final weatherResponse = await httpClient.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final decodedJsonBody = jsonDecode(weatherResponse.body);
    Map<String, dynamic> weatherJson = _parseWeatherParameters(decodedJsonBody);

    return Weather.fromJson(weatherJson);
  }

  // Parses weatherResponse.body into a json string which can be decoded into a Weather object
  static Map<String, dynamic> _parseWeatherParameters(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    Map<String, dynamic> map = {};
    map['city'] = json['title'];
    map['weather_state_abbr'] = consolidatedWeather['weather_state_abbr'];
    map['weather_state_name'] = consolidatedWeather['weather_state_name'];
    map['min_temp'] = consolidatedWeather['min_temp'];
    map['temp'] = consolidatedWeather['the_temp'];
    map['max_temp'] = consolidatedWeather['max_temp'];
    map['created'] = consolidatedWeather['created'];

    return map;
  }
}
