import 'package:currency_converter/enums/currency_code.dart';

/// A service which determines currency exchange rates
abstract class ICurrencyExchangeService {
  Future<Map<CurrencyCode, double>> getRates(CurrencyCode base);
}
