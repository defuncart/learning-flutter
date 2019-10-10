import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import 'package:currency_converter/enums/currency_code.dart';

/// A class of utility methods for the class
class AppUtils {
  /// Whether a county code is valid for the app
  static bool isValidCountryCode(String str) => CurrencyCode.values.where((x) => describeEnum(x) == str).length == 1;

  /// Converts a string (i.e. EUR) to a CurrencyCode (i.e. CurrencyCode.EUR)
  static CurrencyCode currencyCodeFromString(String str) =>
      CurrencyCode.values.firstWhere((x) => describeEnum(x) == str);

  /// Converts a CurrencyCode (i.e. CurrencyCode.EUR) to a string (i.e. EUR)
  static String currencyCodeToString(CurrencyCode code) => describeEnum(code);

  /// Formats a double to a string with two decimal places
  static String formatCurrencyString(double amount) => FlutterMoneyFormatter(amount: amount).output.nonSymbol;

  /// Determines a text theme with a single text color for all styles
  static TextTheme textThemeWithSingleColor(Color color) => TextTheme(
        body1: TextStyle(),
        body2: TextStyle(),
        display1: TextStyle(),
        display2: TextStyle(),
        display3: TextStyle(),
        display4: TextStyle(),
        headline: TextStyle(),
        title: TextStyle(),
        subhead: TextStyle(),
        subtitle: TextStyle(),
      ).apply(
        bodyColor: color,
        displayColor: color,
      );
}
