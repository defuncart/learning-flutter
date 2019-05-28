import 'package:flutter/material.dart';

/// A callback which takes a string argument
typedef void CalculatorButtonPressedCallback({String buttonText});

/// A button of a calculator
class CalculatorButton extends StatelessWidget {
  /// The display text
  final String text;

  /// A callback to invoke when the button is pressed
  final CalculatorButtonPressedCallback onPressed;

  /// The text color
  final Color textColor;

  /// Constructor
  ///
  /// Note
  CalculatorButton({
    @required this.text,
    @required this.onPressed,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () => onPressed(buttonText: text),
        child: Text(
          text,
          style: Theme.of(context).textTheme.display1.copyWith(color: textColor),
        ),
      ),
    );
  }
}
