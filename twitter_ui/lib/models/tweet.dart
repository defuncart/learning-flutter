import 'package:meta/meta.dart';
import 'package:twitter_ui/models/user.dart';

/// A model representing a tweet
class Tweet {
  /// The user
  final User user;

  /// The tweet's contents
  final String contents;

  /// The number of comments
  final int numberComments;

  /// The number of retweets
  final int numberRetweets;

  /// The number of likes
  final int numberLikes;

  /// Constructor
  Tweet({
    @required this.user,
    @required this.contents,
    this.numberComments = 0,
    this.numberRetweets = 0,
    this.numberLikes = 0
  });
}
