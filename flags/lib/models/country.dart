/// A model representing a country
class Country {
  /// The country's two-letter id, i.e. 'de'
  final String id;

  /// The country's name, i.e. 'Germany'
  final String name;
  
  /// The country's capital, i.e. 'Berlin'
  final String capital;

  const Country({this.id, this.name, this.capital});

  /// The asset path for the country's flag
  String get flagAssetPath => 'assets/flags/$id.png';

  // Converts an object from a json string
  static Country fromJson(dynamic json) {
    return Country(
      id: json['country_code'].toString().toLowerCase(),
      name: json['name'],
      capital: json['capital'],
    );
  }

  /// Returns a string representation of the object
  @override
  String toString() {
    return '$id: $name, $capital';
  }
}