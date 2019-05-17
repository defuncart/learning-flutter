import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/states/app_state.dart';
import 'package:weather/widgets/home_screen.dart';

/// App entry point
void main() => runApp(MyApp());

/// Build App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider(
        builder: (context) => AppState(),
        child: HomeScreen(),
      ),
    );
  }
}
