import 'package:flutter/material.dart';

/// A simple base scaffold with an app bar and child
class BaseTab extends StatelessWidget {
  /// The app bar's title
  final String title;

  /// The scaffold's child
  final Widget child;

  const BaseTab({@required this.title, @required this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
    );
  }
}
