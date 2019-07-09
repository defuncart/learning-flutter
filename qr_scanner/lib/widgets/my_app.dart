import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/widgets/home_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'QR Scanner',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('QR Scanner'),
        ),
        child: HomeScreen(),
      ),
    );
  }
}
