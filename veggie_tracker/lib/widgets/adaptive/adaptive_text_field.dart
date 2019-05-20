import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/device_utils.dart';

/// A TextField which is adaptive across iOS and Android
class AdaptiveTextField extends StatelessWidget {
  /// Creates an adaptive text field.
  const AdaptiveTextField({
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.style,
    this.textAlign,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    Key key,
  }) : super(key: key);

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController controller;

  /// Controls whether this widget has keyboard focus.
  ///
  /// If null, this widget will create its own [FocusNode].
  final FocusNode focusNode;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType keyboardType;
  
  /// The style to use for the text being edited.
  final TextStyle style;
  
  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int maxLines;

  /// The maximum number of characters (Unicode scalar values) to allow in the text field.
  final int maxLength;

  /// {@macro flutter.widgets.editableText.onChanged}
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return CupertinoTextField(
        maxLines: maxLines,
        controller: controller,
        focusNode: focusNode,
        textAlign: textAlign,
        keyboardType: keyboardType,
        maxLength: maxLength,
        onChanged: onChanged,
        style: style,
      );
    } else {
      return TextField(
        maxLines: maxLines,
        controller: controller,
        focusNode: focusNode,
        textAlign: textAlign,
        keyboardType: keyboardType,
        maxLength: maxLength,
        onChanged: onChanged,
        style: style,
      );
    }
  }
}
