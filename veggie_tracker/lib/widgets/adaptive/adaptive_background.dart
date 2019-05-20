import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/device_utils.dart';

/// A background widget which is adaptive across iOS and Android
class AdaptiveBackground extends StatelessWidget {
  /// Constructor
  const AdaptiveBackground({this.color, this.intensity = 25, this.alpha = 0xe8, this.child});

  /// The color
  final Color color;

  /// The blur intensity (used on iOS)
  final double intensity;

  /// The alpha intensity (used on Android)
  final int alpha;

  /// A child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: (DeviceUtils.isIOS)
          ? BackdropFilter(
              filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                ),
                child: child,
              ),
            )
          : DecoratedBox(
              decoration: BoxDecoration(
                color: color.withAlpha(alpha),
              ),
              child: child,
            ),
    );
  }
}
