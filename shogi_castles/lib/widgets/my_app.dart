import 'package:flutter/material.dart';

import 'package:shogi_castles/configs/app_colors.dart';
import 'package:shogi_castles/utils/app_utils.dart';
import 'package:shogi_castles/widgets/home_screen/home_screen.dart';

/// The app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shogi Castles',
      theme: ThemeData(
        primaryColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
        primaryIconTheme: IconThemeData(
          color: AppColors.black,
        ),
        textTheme: AppUtils.textThemeWithSingleColor(AppColors.black),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shogi Castles'),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
