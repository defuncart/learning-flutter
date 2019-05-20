import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/app_colors.dart';

/// A widget which draws a colored divider line
class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0,
              color: AppColors.lightBackgroundGray,
            ),
          ),
        ),
      ),
    );
  }
}
