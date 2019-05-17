import 'package:flutter/material.dart';

/// A state for the app
class AppState with ChangeNotifier {
  /// A backing variable for currentCity
  String _currentCity = 'Berlin';

  /// Gets the current city
  String get currentCity => _currentCity;

  /// Sets the current city
  set currentCity(String newValue) {
    _currentCity = newValue;
    notifyListeners();
  }
}
