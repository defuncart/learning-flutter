import 'package:calculator/widgets/home_screen.dart';
import 'package:flutter/material.dart';

/// App entry point
void main() => runApp(MyApp());

/// Build App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
