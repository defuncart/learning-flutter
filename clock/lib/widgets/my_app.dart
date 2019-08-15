import 'package:clock/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:clock/widgets/home_screen/home_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        accentColor: AppColors.accentColor,
        appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
