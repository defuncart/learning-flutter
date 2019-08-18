import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flags/models/country.dart';

/// A service which provides a list of countries
class CountryService {
  /// An internal constructor
  CountryService._();

  /// A backing variable for instance
  static CountryService _instance;

  /// A single instance of the class
  static CountryService get instance {
    if (_instance == null) {
      _instance = CountryService._();
    }
    return _instance;
  }

  /// A list of countries
  List<Country> countries;

  /// Initializes the service
  Future init() async {
    String data = await rootBundle.loadString("assets/database/countries.json");
    countries = (json.decode(data) as List).map((model) => Country.fromJson(model)).toList();
  }
}
