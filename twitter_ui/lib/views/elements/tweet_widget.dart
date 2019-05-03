import 'package:flutter/material.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:twitter_ui/utils/app_colors.dart';

/// A view for a tweet
class TweetWidget extends StatelessWidget {
  /// The tweet
  final Tweet tweet;

  /// Constructor
  TweetWidget(this.tweet);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(
            tweet.user.profileImageUrl,
          ),
        ),
        title: Row(
          children: <Widget>[
            Text(
              tweet.user.name,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(' '),
            Text(
              tweet.user.username,
              style: TextStyle(
                color: AppColors.gray,
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        subtitle: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                tweet.contents,
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _EngagementButton(
                  iconData: Icons.message,
                  color: AppColors.gray,
                  onPressed: () {},
                  engagementCount: tweet.numberComments,
                ),
                _EngagementButton(
                  iconData: Icons.repeat,
                  color: AppColors.gray,
                  onPressed: () {},
                  engagementCount: tweet.numberRetweets,
                ),
                _EngagementButton(
                  iconData: Icons.favorite_border,
                  color: AppColors.gray,
                  onPressed: () {},
                  engagementCount: tweet.numberLikes,
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  color: AppColors.gray,
                  onPressed: () {},
                  iconSize: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// An engagement button (i.e. like button, retweet button)
class _EngagementButton extends StatelessWidget {
  /// The icon data
  final IconData iconData;

  /// The icon and text color
  final Color color;

  /// A callback when
  final VoidCallback onPressed;

  /// The engagement count (i.e. number of likes, retweets)
  final int engagementCount;

  /// Constructor
  _EngagementButton(
      {@required this.iconData,
      this.color,
      this.onPressed,
      this.engagementCount = 0});

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    // if the engagementCount is greater than zero, then also display this count as text
    if (engagementCount > 0) {
      return Row(
        children: <Widget>[
          IconButton(
            icon: Icon(iconData),
            color: color,
            onPressed: onPressed,
            iconSize: 20.0,
          ),
          Text(
            engagementCount.toString(),
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      );
    } else {
      return IconButton(
        icon: Icon(iconData),
        color: color,
        onPressed: onPressed,
      );
    }
  }
}
