import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:twitter_ui/models/notification.dart';
import 'package:twitter_ui/models/trend.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:twitter_ui/models/user.dart';

/// A service which handles twitter requests
class TwitterService {
  /// The logged-in user
  final User user;

  /// Random number generator
  final Random _random = Random();

  /// The max number of following (for a user)
  static const _maxNumberFollowing = 100;

  /// The max number of followers (for a user)
  static const _maxNumberFollowers = 100;

  /// The min number of words (in a tweet)
  static const _minNumberWordsTweet = 10;

  /// The max number of words (in a tweet)
  static const _maxNumberWordsTweet = 40;

  /// Constructor
  TwitterService()
      : user = User(
          name: 'James Leahy',
          username: '@defuncart',
          profileImageUrl:
              'https://pbs.twimg.com/profile_images/937704626094256129/fpY4-Jgc_400x400.jpg',
          numberFollowing: 73,
          numberFollowers: 62,
        );

  /// Returns a list of tweets
  List<Tweet> getTweets(int count) {
    //probably a better way?
    List<Tweet> returnList = new List(count);
    for (int i = 0; i < count; i++) {
      returnList[i] = _generateTweet();
    }
    return returnList;
  }

  /// Generates and returns a tweet
  Tweet _generateTweet() {
    String contents = lorem(
        paragraphs: 1,
        words: _minNumberWordsTweet +
            _random.nextInt(_maxNumberWordsTweet - _minNumberWordsTweet));

    return Tweet(
      user: _generateUser(),
      contents: contents,
      numberComments: _random.nextInt(4),
      numberRetweets: _random.nextInt(8),
      numberLikes: _random.nextInt(9),
    );
  }

  User _generateUser() {
    WordPair wordPair = generateWordPairs().take(1).first;
    String name = _pascal(wordPair.first) + ' ' + _pascal(wordPair.second);
    String username = '@' + wordPair.asLowerCase;

    return User(
      name: name,
      username: username,
      profileImageUrl:
          'https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg',
      numberFollowing: _random.nextInt(_maxNumberFollowing),
      numberFollowers: _random.nextInt(_maxNumberFollowers),
    );
  }

  /// Capitalizes the first letter of a string (i.e pascal case)
  String _pascal(String s) => s[0].toUpperCase() + s.substring(1);

  /// Returns a list of trends
  List<Trend> getTrends(int count) {
    Iterable<WordPair> wordPair = generateWordPairs().take(count);
    return wordPair
        .map((x) => Trend(
            hastag: '#' + x.asPascalCase,
            numberTweets: 1000 + _random.nextInt(1000)))
        .toList();
  }

  /// Returns a list of Notifications
  List<Notification> getNotifications(int count) {
    // Iterable<WordPair> wordPair = generateWordPairs().take(count);
    // return wordPair
    //     .map((x) => Trend(
    //         hastag: '#' + x.asPascalCase,
    //         numberTweets: 1000 + _random.nextInt(1000)))
    //     .toList();

    //probably a better way?
    // List<Notification> returnList = new List(count);
    // for (int i = 0; i < count; i++) {
    //   returnList[i] = _generateNotification();
    // }
    // return returnList;

    return List<Notification>.generate(count, (int index) => _generateNotification());
  }

  /// Generates and returns a notification
  Notification _generateNotification() {
    return Notification(
      user: _generateUser(),
      tweet: _generateTweet()
    );
  }
}
