import 'package:flutter/material.dart';

import 'package:hacker_news/configs/app_colors.dart';
import 'package:hacker_news/widgets/home_screen/home_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primaryColor: AppColors.orangeRed,
        accentColor: AppColors.darkSlateGray,
        backgroundColor: AppColors.whiteSmoke,
        scaffoldBackgroundColor: AppColors.whiteSmoke,
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: AppColors.darkSlateGray,
          ),
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.darkSlateGray,
          indicator: null,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: AppColors.lowOpacityDarkSlateGray,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
