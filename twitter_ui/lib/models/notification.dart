import 'package:meta/meta.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:twitter_ui/models/user.dart';

/// A model representing a notification (when a friend engages with a tweet)
class Notification {
  /// The user who engaged
  final User user;

  /// The tweet with which was engaged with
  final Tweet tweet;

  /// Constructor
  Notification({
    @required this.user,
    @required this.tweet,
  });
}
