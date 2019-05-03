import 'package:flutter/material.dart';
import 'package:twitter_ui/models/tweet.dart';
import 'package:twitter_ui/services/twitter_service.dart';
import 'package:twitter_ui/utils/app_colors.dart';
import 'package:twitter_ui/views/elements/tweet_widget.dart';

/// The home tab
class HomeTab extends StatelessWidget {
  /// The twitter service
  final TwitterService twitterService;

  /// Constructor
  HomeTab(this.twitterService);

  @override
  Widget build(BuildContext context) {
    List<Tweet> _tweets = twitterService.getTweets(5);

    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemCount: _tweets.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return TweetWidget(_tweets[index]);
          },
          separatorBuilder: (context, index) => Divider(
                color: AppColors.grayOpacity25,
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
