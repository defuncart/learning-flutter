import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';
import 'package:veggie_tracker/widgets/shared/small_bar.dart';

/// A widget which displays nutrition information
class Nutrition extends StatelessWidget {
  /// The nutrition's name
  final String name;
  
  /// The nutrition's display value
  final String value;

  /// A display color
  final Color color;

  /// The nutrition's fraction value
  final double fraction;

  /// Constructor
  const Nutrition({this.name, this.value, this.color, this.fraction});

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    final textTheme = AdaptiveTextTheme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(name, style: textTheme.label),
        SizedBox(height: 1),
        SmallBar(
          filledFraction: fraction,
          color: color,
        ),
        Text(value, style: textTheme.bodySmall),
      ],
    );
  }
}
