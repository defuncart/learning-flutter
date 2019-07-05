import 'package:flutter/material.dart';
import 'package:notes/services/database.dart';
import 'package:notes/widgets/my_app.dart';

/// App entry point
void main() async {
  // wait for the database to initialize
  await Database.instance.init();
  // then render the app on screen
  runApp(MyApp());
}
