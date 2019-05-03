import 'package:flutter/material.dart';
import 'package:twitter_ui/models/trend.dart';
import 'package:twitter_ui/utils/app_colors.dart';

/// A view for a trend
class TrendWidget extends StatelessWidget {
  /// The trend
  final Trend trend;

  /// Constructor
  TrendWidget(this.trend);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: ListTile(
        leading: null,
        title: Text(
          trend.hastag,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          trend.numberTweets.toString() + ' tweets',
          style: TextStyle(
            color: AppColors.gray,
          ),
        ),
      ),
    );
  }
}
