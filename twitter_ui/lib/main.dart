import 'package:flutter/material.dart';
import 'package:twitter_ui/utils/app_colors.dart';
import 'package:twitter_ui/views/home_screen.dart';

/// App entry point
void main() => runApp(MyApp());

/// The app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        accentColor: AppColors.accentColor,
        unselectedWidgetColor: AppColors.gray,
        appBarTheme: AppBarTheme(
          color: AppColors.primaryColorDark,
        ),
        scaffoldBackgroundColor: AppColors.primaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.accentColor,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
