import 'package:meta/meta.dart';

/// A model representing a user
class User {
  /// The user's name
  final String name;

  /// The user's username
  final String username;

  /// A url to the user's profile image
  final String profileImageUrl;

  /// The number of other users this user is following
  final int numberFollowing;

  /// The number of other users following this user
  final int numberFollowers;

  /// Constructor
  User({
    @required this.name,
    @required this.username,
    @required this.profileImageUrl,
    @required this.numberFollowing,
    @required this.numberFollowers,
  });
}
