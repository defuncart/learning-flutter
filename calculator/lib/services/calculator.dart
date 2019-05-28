import 'package:math_expressions/math_expressions.dart';

/// A calculator
class Calculator {
  /// A parser which can create mathematical expressions
  Parser _parser;

  /// A context model
  ContextModel _contextModel;

  /// Calculator
  Calculator() {
    _parser = Parser();
    _contextModel = ContextModel();
  }

  /// Evaluates a string expression to a double
  double evaluateExpression(String stringExpression) {
    Expression expression = _parser.parse(stringExpression);
    return expression.evaluate(EvaluationType.REAL, _contextModel);
  }
}
 