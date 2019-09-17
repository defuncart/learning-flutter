import 'package:flutter/material.dart';
import 'package:slack_onboarding/widgets/onboarding_page/onboarding_page.dart';

/// The app's main widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slack Onboarding',
      home: Scaffold(
        body: SafeArea(
          child: OnboardingPage(),
        ),
      ),
    );
  }
}
