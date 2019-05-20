import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/device_utils.dart';

/// A Button which is adaptive across iOS and Android
class AdaptiveButton extends StatelessWidget {
  /// Creates an adaptive button.
  const AdaptiveButton({
    this.child,
    this.onPressed,
    Key key,
  }) : super(key: key);

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// The widget below this widget in the tree.
  final Widget child;
  
  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return CupertinoButton.filled(
        child: child,
        onPressed: onPressed,
      );
    } else {
      return RaisedButton(
        child: child,
        onPressed: onPressed,
      );
    }
  }
}
