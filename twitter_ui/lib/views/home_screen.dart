import 'package:flutter/material.dart';
import 'package:twitter_ui/services/twitter_service.dart';
import 'package:twitter_ui/views/drawers/navigation_drawer.dart';
import 'package:twitter_ui/views/tabs/home_tab.dart';
import 'package:twitter_ui/views/tabs/search_tab.dart';
import 'package:twitter_ui/views/tabs/notifications_tab.dart';
import 'package:twitter_ui/views/tabs/inbox_tab.dart';

/// The home screen
class HomeScreen extends StatefulWidget {
  /// Creates the widget's state
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/// A state for the home screen
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /// The twitter service
  TwitterService _twitterService = TwitterService();
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    /// A key for the scaffold
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Twitter"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawMaterialButton(
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                _twitterService.user.profileImageUrl,
              ),
            ),
          ),
        ),
      ),
      drawer: NavigationDrawer(user: _twitterService.user),
      body: TabBarView(
        children: <Widget>[
          HomeTab(_twitterService),
          SearchTab(_twitterService),
          NotificationsTab(_twitterService),
          InboxTab(_twitterService)
        ],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColorDark,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: new Icon(
                Icons.home,
                size: 30.0,
              ),
            ),
            Tab(
              icon: new Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
            Tab(
              icon: new Icon(
                Icons.notifications,
                size: 30.0,
              ),
            ),
            Tab(
              icon: new Icon(
                Icons.message,
                size: 30.0,
              ),
            ),
          ],
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
          controller: _controller,
        ),
      ),
    );
  }
}
