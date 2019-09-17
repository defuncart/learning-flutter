import 'dart:ui';

import 'package:flutter/animation.dart';

/// A class of utils to generate animations
class AnimationUtils {
  /// Returns a fade-in animation with a given begin and end point for a specified controller
  static Animation<double> fadeInAnimation({
    AnimationController controller,
    double startFade = 0,
    double endFade = 1,
    double startTime,
    double endTime,
    Curve curve = Curves.decelerate,
  }) =>
      Tween<double>(
        begin: startFade,
        end: endFade,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            startTime,
            endTime,
            curve: curve,
          ),
        ),
      );

  /// Returns a slide animation with a given begin and end point for a specified controller
  static Animation<Offset> slideAnimation({
    AnimationController controller,
    Offset startPosition,
    Offset endPosition,
    double startTime,
    double endTime,
    Curve curve = Curves.fastOutSlowIn,
  }) =>
      Tween<Offset>(
        begin: startPosition,
        end: endPosition,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            startTime,
            endTime,
            curve: curve,
          ),
        ),
      );
}
