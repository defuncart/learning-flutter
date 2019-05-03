import 'package:meta/meta.dart';

/// A model representing a trend
class Trend {
  /// The hashtag
  final String hastag;

  /// The number of retweets
  final int numberTweets;

  /// Constructor
  Trend({
    @required this.hastag,
    @required this.numberTweets,
  });
}
