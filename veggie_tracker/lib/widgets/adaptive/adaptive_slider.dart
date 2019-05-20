import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/device_utils.dart';

/// A Slider which is adaptive across iOS and Android
class AdaptiveSlider extends StatelessWidget {
  /// Creates an adaptive slider.
  const AdaptiveSlider({
    this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    Key key,
  }) : super(key: key);

  /// The currently selected value for this slider.
  ///
  /// The slider's thumb is drawn at a position that corresponds to this value.
  final double value;

  /// Called when the user selects a new value for the slider.
  final ValueChanged<double> onChanged;
 
  /// The minimum value the user can select.
  ///
  /// Defaults to 0.0.
  final double min;

  /// The maximum value the user can select.
  ///
  /// Defaults to 1.0.
  final double max;

  /// The number of discrete divisions.
  ///
  /// If null, the slider is continuous.
  final int divisions;

  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return CupertinoSlider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
      );
    } else {
      return Slider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
      );
    }
  }
}
