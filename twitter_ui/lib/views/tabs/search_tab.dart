import 'package:flutter/material.dart';
import 'package:twitter_ui/models/trend.dart';
import 'package:twitter_ui/services/twitter_service.dart';
import 'package:twitter_ui/utils/app_colors.dart';
import 'package:twitter_ui/views/elements/trend_widget.dart';

/// The search tab
class SearchTab extends StatelessWidget {
  /// The twitter service
  final TwitterService twitterService;

  /// Constructor
  SearchTab(this.twitterService);

  @override
  Widget build(BuildContext context) {
    List<Trend> _trends = twitterService.getTrends(5);

    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemCount: _trends.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return TrendWidget(_trends[index]);
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
