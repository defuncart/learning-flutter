import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:currency_converter/states/app_state.dart';
import 'package:currency_converter/widgets/home_screen/input_panel/calculator_button.dart';

/// The number input panel
class InputPanel extends StatelessWidget {
  const InputPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    void onPressed({String buttonText}) => appState.appendInput(buttonText);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              CalculatorButton(
                text: '7',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '8',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '9',
                onPressed: onPressed,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(
                text: '4',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '5',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '6',
                onPressed: onPressed,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(
                text: '1',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '2',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '3',
                onPressed: onPressed,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CalculatorButton(
                text: '.',
                onPressed: onPressed,
              ),
              CalculatorButton(
                text: '0',
                onPressed: onPressed,
              ),
              // delete button
              Expanded(
                child: FlatButton(
                  onPressed: () => appState.resetInput(),
                  child: Text(
                    'C',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
