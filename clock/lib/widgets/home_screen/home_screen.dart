import 'package:flutter/material.dart';
import 'package:clock/widgets/home_screen/tabs/clock_tab.dart';
import 'package:clock/widgets/home_screen/tabs/stopwatch_tab.dart';
import 'package:clock/widgets/home_screen/tabs/timer_tab.dart';

/// The home screen which consists of three tabs
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

/// The state for the HomeScreen
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          ClockTab(),
          TimerTab(),
          StopwatchTab(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.access_time),
              text: 'Clock',
            ),
            Tab(
              icon: Icon(Icons.hourglass_empty),
              text: 'Timer',
            ),
            Tab(
              icon: Icon(Icons.timer),
              text: 'Stopwatch',
            ),
          ],
          indicatorColor: Theme.of(context).primaryColorDark,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
          controller: _controller,
        ),
      ),
    );
  }
}
