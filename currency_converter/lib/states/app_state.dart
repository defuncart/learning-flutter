import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:currency_converter/enums/currency_code.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/currency_exchange_service.dart';
import 'package:currency_converter/utils/app_utils.dart';

/// The global app state
class AppState with ChangeNotifier {
  static const currencyDatabaseAssetPath = 'assets/database/currencies.json';

  CurrencyExchangeService _currencyExchangeService = CurrencyExchangeService();
  List<Currency> _currencies;
  Currency _baseCurrency;
  double _baseAmount;
  Map<CurrencyCode, double> _rates;
  Currency _quoteCurrency;
  bool _baseCurrencyIsAbove = true;
  String _inputString = '';

  /// A list of currencies
  List<Currency> get currencies => _currencies;

  /// The base currency
  Currency get baseCurrency => _baseCurrency;

  /// A formatted string to display for the base amount
  String get baseAmountDisplay => AppUtils.formatCurrencyString(_baseAmount);

  /// The quote currency, used to quote the exchange compared to base currency
  Currency get quoteCurrency => _quoteCurrency;

  /// A formatted string to display for the base amount
  String get quoteAmountDisplay => AppUtils.formatCurrencyString(_baseAmount * _rates[_quoteCurrency.code]);

  /// Whether the base currency is on the top row
  bool get baseCurrencyIsAbove => _baseCurrencyIsAbove;

  /// Initializes the state
  Future<bool> init() async {
    String data = await rootBundle.loadString(currencyDatabaseAssetPath);
    _currencies = (json.decode(data) as List).map((model) => Currency.fromJson(model)).toList();

    _baseCurrency = _currencyByCode(CurrencyCode.EUR);
    _quoteCurrency = _currencyByCode(CurrencyCode.PLN);
    _resetInput();

    await refreshData();

    return true;
  }

  /// Refreshes the data and downloads the updated exchange rates
  Future<void> refreshData() async => _rates = await _currencyExchangeService.getRates(_baseCurrency.code);

  /// Returns a currency by a given code
  Currency _currencyByCode(CurrencyCode currencyCode) => _currencies.firstWhere((x) => x.code == currencyCode);

  /// Sets the base currency
  ///
  /// This triggers a new download of exchange rates
  Future<void> setBaseCurrency(Currency currency) async {
    _baseCurrency = currency;
    _resetInput();

    await refreshData();

    notifyListeners();
  }

  /// Sets the quote currency
  Future<void> setQuoteCurrency(Currency currency) async {
    _quoteCurrency = currency;
    _resetInput();

    notifyListeners();
  }

  /// Swaps the base and quote currencies
  ///
  /// This triggers a new download of exchange rates
  void swapBaseQuoteCurrencies() async {
    _baseCurrencyIsAbove = !_baseCurrencyIsAbove;
    _resetInput();

    final temp = _baseCurrency;
    _baseCurrency = _quoteCurrency;
    _quoteCurrency = temp;

    await refreshData();

    notifyListeners();
  }

  /// Appends a string input to the currency input string
  ///
  /// Assumes that the input is a number 0-9 or . (decimal point)
  void appendInput(String input) {
    // ignore if the input is a decimal point and the user already entered one
    if (input == '.' && _inputString.contains('.')) return;

    _inputString += input;
    _baseAmount = double.parse(_inputString);

    notifyListeners();
  }

  /// Resets the input
  void resetInput() {
    _resetInput();
    notifyListeners();
  }

  /// Resets the input
  void _resetInput() {
    _inputString = '';
    _baseAmount = 1.0;
  }
}
