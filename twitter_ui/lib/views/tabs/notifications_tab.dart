import 'package:flutter/material.dart';
import 'package:twitter_ui/models/notification.dart' as twitter_ui;
import 'package:twitter_ui/services/twitter_service.dart';
import 'package:twitter_ui/utils/app_colors.dart';
import 'package:twitter_ui/views/elements/notification_widget.dart';

/// The notifications tab
class NotificationsTab extends StatelessWidget {
  /// The twitter service
  final TwitterService twitterService;

  /// Constructor
  NotificationsTab(this.twitterService);

  @override
  Widget build(BuildContext context) {
    List<twitter_ui.Notification> _notifications =
        twitterService.getNotifications(5);

    return Scaffold(
      body: Container(
        child: ListView.separated(
          itemCount: _notifications.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return NotificationWidget(_notifications[index]);
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
