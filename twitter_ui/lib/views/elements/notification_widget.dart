import 'package:flutter/material.dart';
import 'package:twitter_ui/models/notification.dart' as twitter_ui;
import 'package:twitter_ui/utils/app_colors.dart';

/// A view for a notification
class NotificationWidget extends StatelessWidget {
  /// The notification
  final twitter_ui.Notification notification;

  /// Constructor
  NotificationWidget(this.notification);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: ListTile(
        leading: null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage(
                notification.user.profileImageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: RichText(
                text: TextSpan(
                  text: notification.user.name,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' liked a Tweet from ' + notification.tweet.user.name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            notification.tweet.contents,
            style: TextStyle(
              color: AppColors.gray,
            ),
          ),
        ),
      ),
    );
  }
}
