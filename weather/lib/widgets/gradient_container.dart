import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// A container with a gradient background
class GradientContainer extends StatelessWidget {
  /// A child widget
  final Widget child;

  /// A background color
  final MaterialColor color;

  /// Constructor
  const GradientContainer({
    Key key,
    @required this.color,
    @required this.child,
  })  : assert(
          color != null,
          child != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color[700],
            color[400],
            color[300],
          ],
        ),
      ),
      child: child,
    );
  }
}
