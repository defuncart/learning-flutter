import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme_data.dart';

/// A TextTheme adaptive across iOS and Android
class AdaptiveTextTheme extends StatelessWidget {
  /// Creates an adaptive TextTheme
  const AdaptiveTextTheme({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final materialThemeData = Theme.of(context);
    final cupertinoThemeData = CupertinoTheme.of(context);

    return _AdaptiveTextThemeProvider(
      data: AdaptiveTextThemeData(
        materialThemeData?.textTheme,
        cupertinoThemeData?.textTheme,
      ),
      child: child,
    );
  }

  /// The data from the closest [Theme] instance that encloses the given context.
  static AdaptiveTextThemeData of(BuildContext context) {
    final provider = context.inheritFromWidgetOfExactType(_AdaptiveTextThemeProvider) as _AdaptiveTextThemeProvider;
    return provider?.data;
  }
}

class _AdaptiveTextThemeProvider extends InheritedWidget {
  _AdaptiveTextThemeProvider({
    this.data,
    @required Widget child,
    Key key,
  }) : super(child: child, key: key);

  final AdaptiveTextThemeData data;

  @override
  bool updateShouldNotify(_AdaptiveTextThemeProvider oldWidget) {
    return data != oldWidget.data;
  }
}
