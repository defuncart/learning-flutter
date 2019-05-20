import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/device_utils.dart';

/// A SegmentedControl adaptive across iOS and Android
class AdaptiveSegmentedControl extends StatelessWidget {
  /// Creates an adaptive SegmentedControl
  AdaptiveSegmentedControl({
    this.onValueChanged,
    this.children,
    this.groupValue,
  });

  /// The callback that is called when a new option is tapped.
  final ValueChanged<int> onValueChanged;

  /// The identifying keys and corresponding widget values in the segmented control.
  final Map<int, Widget> children;

  /// The identifier of the widget that is currently selected.
  final int groupValue;
  
  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return CupertinoSegmentedControl<int>(
        children: children,
        groupValue: groupValue,
        onValueChanged: onValueChanged,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final key in children.keys)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: RaisedButton(
                child: children[key],
                color: groupValue == key ? Theme.of(context).buttonTheme.colorScheme.primary : Color(0xffcccccc),
                onPressed: () {
                  onValueChanged(key);
                },
              ),
            ),
        ],
      );
    }
  }
}
