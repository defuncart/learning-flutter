import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/models/veggie.dart';
import 'package:veggie_tracker/utils/app_colors.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_background.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme_data.dart';
import 'package:veggie_tracker/widgets/shared/flat_card.dart';

/// A widget which displays a card with info about a veggie
class VeggieCard extends StatelessWidget {
  /// The veggie to display
  final Veggie veggie;

  /// A callback when pressed
  final VoidCallback onPressed;

  /// Constructor
  const VeggieCard(this.veggie, this.onPressed);

  /// Builds the details widget
  Widget _buildDetails(AdaptiveTextThemeData textTheme) {
    return AdaptiveBackground(
      color: Color.lerp(AppColors.white, veggie.accentColor, 0.15).withAlpha(140),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              veggie.name,
              style: textTheme.headline,
            ),
            SizedBox(height: 4),
            Text(
              veggie.shortDescription,
              style: textTheme.subhead,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    final textTheme = AdaptiveTextTheme.of(context);

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      pressedOpacity: 0.7,
      child: FlatCard(
        height: 240,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              veggie.imageAssetPath,
              fit: BoxFit.fitWidth,
              semanticLabel: 'A card background featuring ${veggie.name}',
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _buildDetails(textTheme),
            ),
          ],
        ),
      ),
    );
  }
}
