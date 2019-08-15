import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A widget respresenting a timer
class TimerWidget extends StatelessWidget {
  /// The widget's size as a percentage of screen width
  static const double percentageSizeWidth = 0.75;

  /// The timer's remaining duration
  final Duration remaining;

  /// The total progress (from 0 to 1)
  final double progress;

  const TimerWidget({@required this.remaining, @required this.progress, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final timeRemaining = '${remaining.inMinutes} ${(remaining.inSeconds % 60).toString().padLeft(2, '0')}';
    final width = MediaQuery.of(context).size.width * percentageSizeWidth;

    return SizedBox(
      width: width,
      height: width,
      child: CustomPaint(
        painter: _ProgressPainter(
          progressValue: progress,
          backgroundColor: Colors.white,
          progressColor: themeData.accentColor,
        ),
        child: Center(
          child: Text(
            timeRemaining,
            style: themeData.textTheme.display4,
          ),
        ),
      ),
    );
  }
}

/// A custom painter to paint progress in a circular ring
class _ProgressPainter extends CustomPainter {
  /// The progress value (between 0 and 1)
  final double progressValue;

  /// The color used as a background
  final Color backgroundColor;

  /// The color used to indicate progress
  final Color progressColor;

  /// The stroke width of the circular progress ring
  final double strokeWidth;

  _ProgressPainter({
    @required this.progressValue,
    @required this.backgroundColor,
    @required this.progressColor,
    this.strokeWidth = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = progressColor;

    double progressRadians = progressValue == 0 ? 0 : (1.0 - progressValue) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progressRadians, false, paint);
  }

  @override
  bool shouldRepaint(_ProgressPainter other) {
    return progressValue != other.progressValue ||
        progressColor != other.progressColor ||
        backgroundColor != other.backgroundColor;
  }
}
