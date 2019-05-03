import 'package:flutter/material.dart';
import 'package:twitter_ui/models/user.dart';
import 'package:twitter_ui/utils/app_colors.dart';

/// A navigation drawer (which slides out to displays info on the user)
class NavigationDrawer extends StatefulWidget {
  /// A reference to the user
  final User user;

  /// Constructor
  const NavigationDrawer({Key key, this.user}) : super(key: key);

  /// Creates the widget's state
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

/// A state for the NavigationDrawer widget
class _NavigationDrawerState extends State<NavigationDrawer> {
  /// whether user details should be shown
  bool showUserDetails = true;

  /// Builds a view of user details
  Widget _buildUserDetails() {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              leading: Icon(
                Icons.person_outline,
                color: AppColors.gray,
              ),
            ),
            ListTile(
              title: Text(
                "Lists",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                ),
              ),
              leading: Icon(
                Icons.list,
                color: AppColors.gray,
              ),
            ),
            ListTile(
              title: Text(
                "Bookmarks",
                style: new TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                ),
              ),
              leading: Icon(
                Icons.bookmark_border,
                color: AppColors.gray,
              ),
            ),
            ListTile(
              title: Text(
                "Moments",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                ),
              ),
              leading: Icon(
                Icons.flash_on,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        Divider(
          height: 2.0,
          color: AppColors.grayOpacity25,
        ),
        ListTile(
          title: Text(
            "Twitter Ads",
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.white,
            ),
          ),
          leading: Icon(
            Icons.share,
            color: AppColors.gray,
          ),
        ),
        Divider(
          height: 2.0,
          color: AppColors.grayOpacity25,
        ),
        ListTile(
            title: Text(
              "Settings and privacy",
              style: TextStyle(
                fontSize: 16.0,
                color: AppColors.white,
              ),
            ),
            leading: null),
        ListTile(
          title: Text(
            "Help Center",
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.white,
            ),
          ),
          leading: null,
        ),
      ],
    );
  }

  /// Builds a list of settings
  Widget _buildSettings() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Create a new account",
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.accentColor,
            ),
          ),
          leading: null,
        ),
        ListTile(
          title: Text(
            "Add an existing account",
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.accentColor,
            ),
          ),
          leading: null,
        ),
      ],
    );
  }

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              accountEmail: Text(
                widget.user.username,
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColors.gray,
                ),
              ),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      widget.user.profileImageUrl,
                    ),
                  ),
                ),
              ),
              onDetailsPressed: () {
                setState(() {
                  showUserDetails = !showUserDetails;
                });
              },
            ),
            Expanded(
              child: showUserDetails ? _buildUserDetails() : _buildSettings(),
            ),
          ],
        ),
      ),
    );
  }
}
