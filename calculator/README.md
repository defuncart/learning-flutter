# calculator

A simple calculator build in Flutter.

![](screenshots/01.gif)

## Overview

- *lib/services/calculator.dart* evaluates expressions using the package *math_expressions*.
- *lib/widgets/calculator_button* is a simple widget which acts as a calculator button (for operands and operators).
- *lib/widget/home_screen* is a **StatefulWidget** which deals with button presses and updating output display.
- On iOS, the launch screen is the same color as *scaffoldBackgroundColor*.

# Remarks

- On each button press, the **HomeScreen**'s whole widget tree is rebuilt.
- The [*Align*](https://api.flutter.dev/flutter/widgets/Align-class.html) widget is really useful and isn't something I've stumbled across before.

## Resources

[math_expressions](https://pub.dev/packages/math_expressions)
