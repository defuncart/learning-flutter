import 'package:calculator/services/calculator.dart';
import 'package:calculator/widgets/calculator_button.dart';
import 'package:calculator/utils/app_utils.dart';
import 'package:flutter/material.dart';

/// The home screen
class HomeScreen extends StatefulWidget {
  /// Constructor
  const HomeScreen({Key key}) : super(key: key);

  @override
  State createState() => _HomeScreenState();
}

/// A state for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  /// The current expression string
  String _expressionString;

  /// A calculator
  Calculator _calculator;

  @override
  void initState() {
    super.initState();

    // initialize variables
    _expressionString = '';
    _calculator = Calculator();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // top display
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _expressionString,
                    style: Theme.of(context).textTheme.display2,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
            flex: 3,
          ),
          // button input
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                // digits
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CalculatorButton(
                              text: '7',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '8',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '9',
                              onPressed: _onPressed,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            CalculatorButton(
                              text: '4',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '5',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '6',
                              onPressed: _onPressed,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            CalculatorButton(
                              text: '1',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '2',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '3',
                              onPressed: _onPressed,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            CalculatorButton(
                              text: '0',
                              onPressed: _onPressed,
                            ),
                            CalculatorButton(
                              text: '.',
                              onPressed: _onPressed,
                            ),
                            // compute button
                            FlatButton(
                              onPressed: () {
                                double result = _calculator.evaluateExpression(_expressionString);
                                setState(() {
                                  _expressionString = AppUtils.formatResult(result);
                                });
                              },
                              child: Text(
                                '=',
                                style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    flex: 75,
                  ),
                  // operators
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // backspace button
                        GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _expressionString = '';
                            });
                          },
                          child: IconButton(
                            icon: Icon(
                              Icons.backspace,
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_expressionString.length > 0) {
                                  _expressionString = _expressionString.substring(0, _expressionString.length - 1);
                                }
                              });
                            },
                          ),
                        ),
                        CalculatorButton(
                          text: '/',
                          textColor: Theme.of(context).accentColor,
                          onPressed: _onPressed,
                        ),
                        CalculatorButton(
                          text: '*',
                          textColor: Theme.of(context).accentColor,
                          onPressed: _onPressed,
                        ),
                        CalculatorButton(
                          text: '-',
                          textColor: Theme.of(context).accentColor,
                          onPressed: _onPressed,
                        ),
                        CalculatorButton(
                          text: '+',
                          textColor: Theme.of(context).accentColor,
                          onPressed: _onPressed,
                        ),
                      ],
                    ),
                    flex: 25,
                  ),
                ],
              ),
            ),
            flex: 7,
          ),
        ],
      ),
    );
  }

  /// Callback when a operand or operator button is pressed
  void _onPressed({String buttonText}) {
    setState(() {
      _expressionString += buttonText;
    });
  }
}
