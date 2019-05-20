import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A class of colors used in the app
class AppColors {
  /// An opaque white color
  static Color get white => CupertinoColors.white;

  /// Used for light background fills
  static Color get lightBackgroundGray => CupertinoColors.lightBackgroundGray;

  /// The primary color on iOS
  static const Color iOSPrimaryColor = const Color(0xFFFF2D55);

  /// The primary color on Android
  static Color get androidPrimaryColor => Colors.red;

  /// The text color for the Summary widget
  static const Color summaryTextColor = const Color(0xFF202020);
  
  /// The energy color for the Summary widget
  static const Color summaryEnergyColor = const Color(0xFFEF8EA0);
  
  /// The vitamin a color for the Summary widget
  static const Color summaryVitaminAColor = const Color(0xFFB09CC6);
  
  /// The vitamin c color for the Summary widget
  static const Color summaryVitaminCColor = const Color(0xFF92B6F9);

  /// The text color for the QuoteText widget
  static const Color quoteTextColor = const Color(0xDE000000);
}
