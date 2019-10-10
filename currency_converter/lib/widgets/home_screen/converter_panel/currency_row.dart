import 'package:currency_converter/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:currency_converter/states/app_state.dart';
import 'package:currency_converter/utils/app_utils.dart';
import 'package:currency_converter/widgets/select_currency_dialog/select_currenct_dialog.dart';

class CurrencyRow extends StatelessWidget {
  final Color backgroundColor;
  final bool isBaseCurrency;

  const CurrencyRow({
    @required this.backgroundColor,
    @required this.isBaseCurrency,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final currencyFlagAssetPath =
        isBaseCurrency ? appState.baseCurrency.imageAssetPath : appState.quoteCurrency.imageAssetPath;
    final currencyName =
        AppUtils.currencyCodeToString(isBaseCurrency ? appState.baseCurrency.code : appState.quoteCurrency.code);
    final currencyAmount = isBaseCurrency ? appState.baseAmountDisplay : appState.quoteAmountDisplay;
    final currencyAmountTextStyle = isBaseCurrency
        ? Theme.of(context).textTheme.headline.copyWith(color: AppColors.light.textHighlighted)
        : Theme.of(context).textTheme.headline;

    return GestureDetector(
      onTap: () => appState.swapBaseQuoteCurrencies(),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    //TODO For some reason this triggers two builds?
                    child: Image.asset(currencyFlagAssetPath),
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => SelectCurrencyDialog(
                        isBaseCurrency: isBaseCurrency,
                      ),
                    ),
                  ),
                  Container(width: 16.0),
                  Text(currencyName),
                  Spacer(flex: 1),
                  Text(
                    currencyAmount,
                    textAlign: TextAlign.right,
                    style: currencyAmountTextStyle,
                  ),
                ],
              ),
              flex: 2,
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
