import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextThemeData {
  const AdaptiveTextThemeData(this.materialThemeData, this.cupertinoThemeData);

  final TextTheme materialThemeData;
  final CupertinoTextThemeData cupertinoThemeData;

  TextStyle get headline => (materialThemeData?.headline ?? cupertinoThemeData.navLargeTitleTextStyle).copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.6,
      );

  TextStyle get subhead => (materialThemeData?.subhead ?? cupertinoThemeData.textStyle).copyWith(
        color: Color(0xDE000000),
        fontSize: 14,
        letterSpacing: 0.1,
      );

  TextStyle get tileTitle => (materialThemeData?.body2 ?? cupertinoThemeData.textStyle).copyWith(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      );

  TextStyle get bodySmall => (materialThemeData?.body2 ?? cupertinoThemeData.textStyle).copyWith(
        color: Color(0xDE000000),
        fontSize: 12,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w500,
      );

  TextStyle get body => (materialThemeData?.subhead ?? cupertinoThemeData.navTitleTextStyle).copyWith(
        color: Color(0xDE000000),
        fontSize: 14.05,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w500,
      );

  TextStyle get label => (materialThemeData?.body2 ?? cupertinoThemeData.textStyle).copyWith(
        fontStyle: FontStyle.italic,
        fontSize: 12,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w500,
        color: Color(0x99000000),
      );

  @override
  int get hashCode => materialThemeData.hashCode ^ cupertinoThemeData.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final AdaptiveTextThemeData typedOther = other;
    return materialThemeData != typedOther.materialThemeData || cupertinoThemeData != typedOther.cupertinoThemeData;
  }
}