import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/app_colors.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';
import 'package:veggie_tracker/widgets/shared/nutrition.dart';

/// A widget which displays a summary of nutrition info for a veggie
class Summary extends StatelessWidget {
  /// The number of calories
  final int calories;
  
  /// The number of vitamin a
  final int vitaminA;
  
  /// The number of vitamin c
  final int vitaminC;

  /// Constructor
  const Summary({
    @required this.calories,
    @required this.vitaminA,
    @required this.vitaminC,
  });

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('SUMMARY',
            style: AdaptiveTextTheme.of(context).subhead.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.summaryTextColor,
                )),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Nutrition(
                  name: 'Energy',
                  value: '$calories cal',
                  fraction: calories / 2000,
                  color: AppColors.summaryEnergyColor,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Nutrition(
                  name: 'Vitamin A',
                  value: '$vitaminA% DV',
                  fraction: vitaminA / 100,
                  color: AppColors.summaryVitaminAColor,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Nutrition(
                  name: 'Vitamin C',
                  value: '$vitaminC% DV',
                  fraction: vitaminC / 100,
                  color: AppColors.summaryVitaminCColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
