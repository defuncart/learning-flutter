import 'package:flutter/material.dart';
import 'package:twitter_ui/services/twitter_service.dart';
import 'package:twitter_ui/utils/app_colors.dart';

/// The inbox tab
class InboxTab extends StatelessWidget {
  /// The twitter service
  final TwitterService twitterService;

  /// Constructor
  InboxTab(this.twitterService);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight / 2,
            width: constraints.maxWidth,
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Talk privately with anyone who follows you.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.email),
      ),
    );
  }
}
