import 'package:flutter/material.dart';
import 'package:notes/utils/app_colors.dart';
import 'package:notes/widgets/main_screen/main_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
            color: AppColors.appBarContentsColor,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
        ),
      ),
      home: MainScreen(),
    );
  }
}
