import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:currency_converter/configs/app_theme.dart';
import 'package:currency_converter/states/app_state.dart';
import 'package:currency_converter/widgets/home_screen/home_screen.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = AppState();

    return ChangeNotifierProvider<AppState>(
      builder: (_) => appState,
      child: MaterialApp(
        title: 'Currency Converter',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: Scaffold(
          body: FutureBuilder(
            future: appState.init(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
