import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/app_colors.dart';

/// A re-useable flat card
class FlatCard extends StatelessWidget {
  /// The height
  final double height;
  
  /// The width
  final double width;
  
  /// The child
  final Widget child;

  /// Constructor
  const FlatCard({this.height, this.width, @required this.child});
  
  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(
          width: 1 / MediaQuery.of(context).devicePixelRatio,
          color: AppColors.lightBackgroundGray,
        ),
        shape: BoxShape.rectangle,
      ),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: child,
      ),
    );
  }
}
