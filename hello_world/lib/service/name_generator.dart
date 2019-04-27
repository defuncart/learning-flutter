import 'package:english_words/english_words.dart';

/// A simple name generator
class NameGenerator {
  /// Returns count number of generated names
  Iterable<String> generateNames(int count) {
    // take count number of pairs and return an iterable of pascal case strings
    return generateWordPairs().take(count).map((x) => x.asPascalCase);
  }
}
