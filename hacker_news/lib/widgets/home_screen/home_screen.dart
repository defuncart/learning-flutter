import 'package:flutter/material.dart';

import 'package:hacker_news/enums/feed_type.dart';
import 'package:hacker_news/stores/hacker_news_store.dart';
import 'package:hacker_news/widgets/home_screen/feed_list.dart';

/// The home screen which consists of three tabs
class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final HackerNewsStore _store = HackerNewsStore();
  final _icons = [Icons.new_releases, Icons.trending_up, Icons.work];
  final _tabs = [FeedType.latest, FeedType.top, FeedType.jobs];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this)..addListener(_onTabChange);
    _store.initialLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            for (var tab in _tabs) FeedList(_store, tab),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          tabs: <Widget>[
            for (var icon in _icons)
              Tab(
                icon: Icon(
                  icon,
                  size: 30,
                ),
              ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  /// Callback when the tab is changed
  void _onTabChange() {
    _store.fetch(_tabs[_tabController.index]);
  }
}
