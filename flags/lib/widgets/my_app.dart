import 'package:flutter/material.dart';
import 'package:flags/utils/app_colors.dart';
import 'package:flags/widgets/home_screen/home_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flags',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        appBarTheme: AppBarTheme(
          color: AppColors.appBarBackground,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
