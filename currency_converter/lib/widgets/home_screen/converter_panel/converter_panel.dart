import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:currency_converter/states/app_state.dart';
import 'package:currency_converter/widgets/home_screen/converter_panel/currency_row.dart';

/// A panel which displays two rows
class ConverterPanel extends StatelessWidget {
  const ConverterPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: CurrencyRow(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            isBaseCurrency: appState.baseCurrencyIsAbove,
          ),
        ),
        Expanded(
          child: CurrencyRow(
            backgroundColor: Theme.of(context).canvasColor,
            isBaseCurrency: !appState.baseCurrencyIsAbove,
          ),
        ),
      ],
    );
  }
}
