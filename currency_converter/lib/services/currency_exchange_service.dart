import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:currency_converter/enums/currency_code.dart';
import 'package:currency_converter/models/exchange_rates_response.dart';
import 'package:currency_converter/services/i_currency_exchange_service.dart';
import 'package:currency_converter/utils/app_utils.dart';

/// A service which determines currency exchange rates
class CurrencyExchangeService implements ICurrencyExchangeService {
  /// A http client
  final http.Client httpClient = http.Client();

  /// The base url
  static const baseUrlEndpoint = 'https://api.exchangeratesapi.io/latest';

  /// Returns a response model for an api request
  Future<Map<CurrencyCode, double>> getRates(CurrencyCode base) async {
    final url = '$baseUrlEndpoint/?base=${AppUtils.currencyCodeToString(base)}';
    final rawResponse = await httpClient.get(url);
    final response = ExchangeRatesResponse.fromJson(jsonDecode(rawResponse.body));
    return response.rates;
  }
}
