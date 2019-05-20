import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veggie_tracker/states/app_state.dart';
import 'package:veggie_tracker/utils/app_colors.dart';
import 'package:veggie_tracker/utils/device_utils.dart';
import 'package:veggie_tracker/widgets/screens/list_screen/list_screen.dart';
import 'package:veggie_tracker/widgets/screens/log_screen/log_screen.dart';

/// The app adaptive for iOS and Android
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      builder: (context) => AppState(),
      child: DeviceUtils.isIOS
          ? CupertinoApp(
              debugShowCheckedModeBanner: false,
              theme: CupertinoThemeData(
                primaryColor: AppColors.iOSPrimaryColor,
              ),
              home: AdaptiveMainScreen(),
            )
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: AppColors.androidPrimaryColor,
              ),
              title: 'Veggie Tracker',
              home: AdaptiveMainScreen(),
            ),
    );
  }
}

/// The main screen adaptive for iOS and Android
class AdaptiveMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (DeviceUtils.isIOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              title: Text('Log'),
              icon: Icon(CupertinoIcons.book),
            ),
            BottomNavigationBarItem(
              title: Text('List'),
              icon: Icon(CupertinoIcons.create),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        tabBuilder: (context, index) {
          return (index == 0)
              ? CupertinoTabView(builder: (context) => LogScreen())
              : CupertinoTabView(builder: (context) => ListScreen(), defaultTitle: ListScreen.title);
        },
      );
    } else {
      return LogScreen();
    }
  }
}
