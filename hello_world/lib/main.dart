import 'package:flutter/material.dart';
import 'package:hello_world/views/home_screen.dart';

/// App entry point
void main() => runApp(MyApp());

/// Build App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
