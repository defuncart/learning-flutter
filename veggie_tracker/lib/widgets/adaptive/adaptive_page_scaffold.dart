import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggie_tracker/utils/device_utils.dart';
import 'package:veggie_tracker/widgets/adaptive/adaptive_text_theme.dart';

/// A page scaffold which is adpative across Android (Scaffold) and iOS (CupertinoPageScaffold)
class AdaptivePageScaffold extends StatelessWidget {
  /// Creates an adaptive page scaffold
  const AdaptivePageScaffold({
    @required this.title,
    @required this.child,
    this.floatingActionButton,
  })  : assert(title != null),
        assert(child != null);
  
  /// The title
  final String title;

  /// Widget to show in the main content area.
  final Widget child;

  /// A floating action button. This is only valid on Android
  final Widget floatingActionButton;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return AdaptiveTextTheme(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(title),
          ),
          resizeToAvoidBottomInset: false,
          child: child,
        ),
      );
    } else {
      return AdaptiveTextTheme(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: child,
          floatingActionButton: floatingActionButton,
        ),
      );
    }
  }
}
