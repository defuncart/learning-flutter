import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/app_colors.dart';

/// A widget which displays a bar with a fill amount and color
class SmallBar extends StatelessWidget {
  /// The amount filled
  final double filledFraction;

  /// The fill color
  final Color color;

  /// Constructor
  const SmallBar({this.filledFraction, this.color});

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 100,
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.lightBackgroundGray,
        ),
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth * filledFraction,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }
}
