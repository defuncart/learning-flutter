import 'package:flutter/material.dart';

import 'package:currency_converter/widgets/home_screen/converter_panel/converter_panel.dart';
import 'package:currency_converter/widgets/home_screen/input_panel/input_panel.dart';

/// The home screen which displays a number input and currency converter panel
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ConverterPanel(),
            flex: 4,
          ),
          Expanded(
            child: InputPanel(),
            flex: 6,
          ),
        ],
      ),
    );
  }
}
