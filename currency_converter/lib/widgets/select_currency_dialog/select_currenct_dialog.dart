import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A dialog used to select a currency
class SelectCurrencyDialog extends StatelessWidget {
  /// Whether the selected currency will be the base currency
  final bool isBaseCurrency;

  const SelectCurrencyDialog({@required this.isBaseCurrency, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final text = isBaseCurrency ? 'Base Currency' : 'Quote Currency';
    final currencies = List<Currency>.from(appState.currencies);
    isBaseCurrency ? currencies.remove(appState.quoteCurrency) : currencies.remove(appState.baseCurrency);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      elevation: 0.0,
      backgroundColor: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: 24.0, bottom: 8.0),
        child: Column(
          children: <Widget>[
            Text(text, style: Theme.of(context).textTheme.headline),
            Container(height: 4.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  for (final currency in currencies)
                    _ImageButton(
                      imageAssetPath: currency.imageAssetPath,
                      onPressed: () async {
                        isBaseCurrency
                            ? await appState.setBaseCurrency(currency)
                            : await appState.setQuoteCurrency(currency);
                        Navigator.of(context).pop(true);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// An image button
class _ImageButton extends StatelessWidget {
  /// The image's asset path
  final String imageAssetPath;

  /// A callback when the button is pressed
  final void Function() onPressed;

  const _ImageButton({
    this.imageAssetPath,
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Image.asset(imageAssetPath),
    );
  }
}
