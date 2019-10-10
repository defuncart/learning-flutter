import 'package:currency_converter/enums/currency_code.dart';
import 'package:currency_converter/utils/app_utils.dart';

/// A model representing a currency
class Currency {
  /// The currency code (i.e. CurrencyCode.EUR)
  final CurrencyCode code;

  /// The currency's name (i.e. Euro)
  final String name;

  /// An asset path for the currency's image
  final String imageAssetPath;

  const Currency({
    this.code,
    this.name,
    this.imageAssetPath,
  });

  /// Creates a new `Currency` instance from json.
  factory Currency.fromJson(Map<String, dynamic> json) {
    String flagCode = json['image'];
    return Currency(
      code: AppUtils.currencyCodeFromString(json['code']),
      name: json['name'],
      imageAssetPath: 'assets/images/$flagCode.png',
    );
  }

  /// Returns a string representation of the model
  @override
  String toString() => '{$code: $name}';
}
