import 'package:flutter/material.dart';

import 'package:slack_onboarding/configs/animation_timeline.dart';
import 'package:slack_onboarding/configs/proportional_ratios.dart' as ProportionalRatios;
import 'package:slack_onboarding/configs/app_colors.dart';
import 'package:slack_onboarding/utils/animations.dart';

/// The bottom section of the onboarding page
class BottomSection extends StatelessWidget {
  final AnimationController controller;

  const BottomSection({@required this.controller, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = ProportionalRatios.BottomSection.fontSizeRatio * MediaQuery.of(context).size.width;
    double buttonHeight = MediaQuery.of(context).size.height * ProportionalRatios.BottomSection.height * 0.25;
    final fadeInAnimation = AnimationUtils.fadeInAnimation(
      controller: controller,
      startTime: AnimationTimeline.buttonsFadeBegin,
      endTime: AnimationTimeline.buttonsFadeEnd,
    );

    return Container(
      width: MediaQuery.of(context).size.width * ProportionalRatios.BottomSection.widthPercentage,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FadeTransition(
              opacity: fadeInAnimation,
              child: MaterialButton(
                height: buttonHeight,
                onPressed: () {},
                color: AppColors.green,
                child: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.button.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
            FadeTransition(
              opacity: fadeInAnimation,
              child: MaterialButton(
                height: buttonHeight,
                onPressed: () {},
                color: AppColors.white,
                child: Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.button.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
