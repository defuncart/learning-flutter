import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:veggie_tracker/view_models/daily_summary_view_model.dart';
import 'package:veggie_tracker/utils/app_colors.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme_data.dart';
import 'package:veggie_tracker/widgets/shared/flat_card.dart';
import 'package:veggie_tracker/widgets/shared/floating_card.dart';
import 'package:veggie_tracker/widgets/shared/summary.dart';
import 'package:veggie_tracker/widgets/shared/zoom_clip_asset_image.dart';

/// A widget which displays the user's veggie intake for a day
class DailyDisplay extends StatelessWidget {
  /// The view model
  final DailySummaryViewModel model;
  
  /// Constructor
  const DailyDisplay(this.model);

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    AdaptiveTextThemeData textTheme = AdaptiveTextTheme.of(context);

    return FloatingCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            DateFormat.MMMMEEEEd().format(model.day),
            style: textTheme.headline,
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: model.entries.map((e) {
              return FlatCard(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ZoomClipAssetImage(
                      imageAsset: e.veggie.imageAssetPath,
                      zoom: 2.4,
                      height: 72,
                      width: 72,
                    ),
                    Text(e.servings.toString(),
                        style: TextStyle(
                          color: AppColors.white.withAlpha(240),
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 35),
          Summary(
            calories: model.calories,
            vitaminA: model.vitaminAPercentage,
            vitaminC: model.vitaminCPercentage,
          ),
        ],
      ),
    );
  }
}
