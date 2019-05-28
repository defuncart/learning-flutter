import 'dart:math';

/// A collection of util methods for the app
class AppUtils {
  /// Formats a calculator result as a string to display on screen
  static String formatResult(double number) {
    // if the number is a whole number, return a whole number
    if ((number == number.floor()) && (number != double.infinity)) {
      return number.truncate().toString();
    }

    // otherwise format to a certain number of decimal places
    return _formatNumberWithDecimalPlaces(number, 10).toString();
  }

  /// Formats a double to a certain number of decimal places
  static double _formatNumberWithDecimalPlaces(double number, int decimalPlaces) {
    double mod = pow(10.0, decimalPlaces);
    return ((number * mod).round().toDouble() / mod);
  }
}
