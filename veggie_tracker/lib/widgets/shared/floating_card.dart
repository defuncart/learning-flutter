import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/app_colors.dart';

/// A widget which displays a child insdie a card
class FloatingCard extends StatelessWidget {
  /// The child
  final Widget child;
  
  /// Constructor
  const FloatingCard({@required this.child});

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: PhysicalModel(
        elevation: 25,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}