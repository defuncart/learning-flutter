import 'package:flutter/material.dart';

/// A circular button which contains an icon and has proportional width
class CircularButton extends StatelessWidget {
  static const double buttonPercentageSizeWidth = 0.3;
  static const double iconPercentageButtonWidth = 0.75;

  final void Function() callback;
  final Color fillColor;
  final IconData icon;
  final Color iconColor;

  const CircularButton({
    @required this.callback,
    this.fillColor,
    @required this.icon,
    this.iconColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * buttonPercentageSizeWidth;
    return RawMaterialButton(
      onPressed: callback,
      child: Icon(
        icon,
        color: iconColor ?? Theme.of(context).textSelectionColor,
        size: width * iconPercentageButtonWidth,
      ),
      shape: CircleBorder(),
      elevation: 2,
      fillColor: fillColor ?? Theme.of(context).buttonColor,
      // padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(minWidth: width, minHeight: width),
    );
  }
}
