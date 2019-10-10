import 'package:currency_converter/enums/currency_code.dart';
import 'package:currency_converter/utils/app_utils.dart';

/// A model representing the response of a exchange rates api request
class ExchangeRatesResponse {
  /// The base currency code
  final CurrencyCode base;

  /// A dictionary of exchange rates (with country codes as keys)
  final Map<CurrencyCode, double> rates;

  const ExchangeRatesResponse({this.base, this.rates});

  /// Creates a new `Response` instance from json.
  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) {
    var _rates = Map<CurrencyCode, double>();
    for (final key in json['rates'].keys) {
      if (AppUtils.isValidCountryCode(key)) {
        _rates[AppUtils.currencyCodeFromString(key)] = json['rates'][key];
      }
    }

    return ExchangeRatesResponse(
      base: AppUtils.currencyCodeFromString(json['base']),
      rates: _rates,
    );
  }

  /// Returns a string representation of the model
  @override
  String toString() => '{$base: $rates}';
}
