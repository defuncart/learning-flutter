import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/states/app_state.dart';
import 'package:weather/widgets/navigation_drawer.dart';
import 'package:weather/widgets/weather_report.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  @required
  Widget build(BuildContext context) {
    /// A key for the scaffold
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    /// The weather service
    final WeatherService _weatherService = WeatherService();

    /// The app state
    final AppState _appState = Provider.of<AppState>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Weather'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: NavigationDrawer(),
      body: FutureBuilder(
        future: _weatherService.getWeather(_appState.currentCity),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return WeatherReport(weather: snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
