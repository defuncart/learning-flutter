import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/enums/meal.dart';
import 'package:veggie_tracker/models/log_entry.dart';
import 'package:veggie_tracker/models/veggie.dart';
import 'package:veggie_tracker/utils/app_utils.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_background.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_button.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_segmented_control.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_slider.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_field.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';
import 'package:veggie_tracker/widgets/screens/add_to_log_screen/quote_text.dart';
import 'package:veggie_tracker/widgets/shared/flat_card.dart';
import 'package:veggie_tracker/widgets/shared/line.dart';
import 'package:veggie_tracker/widgets/shared/summary.dart';
import 'package:veggie_tracker/widgets/shared/zoom_clip_asset_image.dart';

/// A callback which takes a log entry
typedef LogEntryCallback = void Function(LogEntry entry);

/// A widget which displays a form for the user to log a new entry
class AddToLogForm extends StatefulWidget {
  /// The veggie
  final Veggie veggie;

  /// A callback when entry was created
  final LogEntryCallback onEntryCreated;

  ///Constructor
  const AddToLogForm(this.veggie, this.onEntryCreated);

  /// Creates the state
  @override
  _AddToLogFormState createState() => _AddToLogFormState();
}

/// The state for AddToLogForm
class _AddToLogFormState extends State<AddToLogForm> {
  static const double _summaryHeight = 175;

  final _servingsTextController = TextEditingController(text: '1');
  final _servingsFocusNode = FocusNode();
  int _mealType = 0;

  int get numberOfServings => int.parse(_servingsTextController.text);

  int get totalCalories => widget.veggie.caloriesPerServing * numberOfServings;

  int get totalVitaminA => widget.veggie.vitaminAPercentage * numberOfServings;

  int get totalVitaminC => widget.veggie.vitaminCPercentage * numberOfServings;

  @override
  Widget build(BuildContext context) {
    final textTheme = AdaptiveTextTheme.of(context);

    return Stack(
      children: <Widget>[
        ListView(
          padding: MediaQuery.of(context).padding +
              EdgeInsets.fromLTRB(24, 16, 24, 16 + _summaryHeight),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatCard(
                  child: ZoomClipAssetImage(
                    height: 112,
                    width: 112,
                    zoom: 2.4,
                    imageAsset: widget.veggie.imageAssetPath,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.veggie.name,
                        style: textTheme.tileTitle,
                      ),
                      SizedBox(height: 2),
                      Text(
                        AppUtils.categoryToString(widget.veggie.category),
                        style: textTheme.label,
                      ),
                      Text(''),
                      Text(
                        AppUtils.seasonsToString(widget.veggie.seasons),
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Line(),
            AdaptiveSegmentedControl(
              children: {
                0: Text('Breakfast'),
                1: Text('Lunch'),
                2: Text('Dinner'),
              },
              groupValue: _mealType,
              onValueChanged: (type) => setState(() => _mealType = type),
            ),
            SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: AdaptiveTextField(
                    controller: _servingsTextController,
                    focusNode: _servingsFocusNode,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (number) {
                      if (number.isNotEmpty) {
                        setState(_servingsFocusNode.unfocus);
                      }
                    },
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Servings of',
                      style: textTheme.label,
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.veggie.servingSize,
                      style: textTheme.body,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('1', style: textTheme.bodySmall),
                ),
                Expanded(
                  child: AdaptiveSlider(
                    value: numberOfServings.toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    onChanged: (value) {
                      setState(() => _servingsTextController.text =
                          value.floor().toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('10', style: textTheme.bodySmall),
                ),
              ],
            ),
            SizedBox(height: 8),
            Line(),
            QuoteText(text: widget.veggie.shortDescription),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 0,
          right: 0,
          child: AdaptiveBackground(
            intensity: 12,
            color: Color(0xAAF2F2F2),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Summary(
                    calories: totalCalories,
                    vitaminA: totalVitaminA,
                    vitaminC: totalVitaminC,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    child: AdaptiveButton(
                      child: Text('Add to Log'),
                      onPressed: () {
                        widget.onEntryCreated(LogEntry(
                          veggieId: widget.veggie.id,
                          servings: numberOfServings.floor(),
                          timestamp: DateTime.now(),
                          meal: Meal.values[_mealType],
                        ));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
