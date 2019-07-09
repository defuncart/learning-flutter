/// A class of utils for the app
class AppUtils {
  // A pattern to use for regexp
  static const String urlPattern =
      r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

  /// Determines if a string is in a valid url format
  static bool isValidUrl(String url) {
    final match = RegExp(urlPattern, caseSensitive: false).firstMatch(url);
    return match != null;
  }
}
