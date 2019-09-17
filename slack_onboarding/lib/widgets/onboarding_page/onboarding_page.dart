import 'package:flutter/material.dart';

import 'package:slack_onboarding/configs/animation_durations.dart';
import 'package:slack_onboarding/configs/proportional_ratios.dart' as ProportionalRatios;
import 'package:slack_onboarding/widgets/onboarding_page/bottom_section.dart';
import 'package:slack_onboarding/widgets/onboarding_page/middle_section.dart';
import 'package:slack_onboarding/widgets/onboarding_page/top_section.dart';

/// The first page of the onboarding process, comprising of top, middle and bottom sections
class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: AnimationDurations.totalDuration),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TopSection(controller: controller),
              flex: ProportionalRatios.OnboardingPage.flexTop,
            ),
            Expanded(
              child: MiddleSection(
                controller: controller
              ),
              flex: ProportionalRatios.OnboardingPage.flexMiddle,
            ),
            Spacer(
              flex: ProportionalRatios.OnboardingPage.flexSpace,
            ),
            Expanded(
              child: BottomSection(controller: controller),
              flex: ProportionalRatios.OnboardingPage.flexBottom,
            ),
          ],
        );
      },
    );
  }
}
