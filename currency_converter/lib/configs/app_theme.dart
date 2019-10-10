import 'package:flutter/material.dart';

import 'package:currency_converter/configs/app_colors.dart';
import 'package:currency_converter/utils/app_utils.dart';

/// A config of light and dark themes used in the app
class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.light.background,
    accentColor: AppColors.light.textHighlighted,
    scaffoldBackgroundColor: AppColors.light.background,
    canvasColor: AppColors.light.backgroundHighlighted,
    backgroundColor: AppColors.light.background,
    textTheme: AppUtils.textThemeWithSingleColor(AppColors.light.text),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.dark.background,
    accentColor: AppColors.dark.textHighlighted,
    scaffoldBackgroundColor: AppColors.dark.background,
    canvasColor: AppColors.dark.backgroundHighlighted,
    backgroundColor: AppColors.dark.background,
    textTheme: AppUtils.textThemeWithSingleColor(AppColors.dark.text),
  );
}
