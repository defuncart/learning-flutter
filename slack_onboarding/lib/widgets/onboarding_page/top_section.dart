import 'package:flutter/material.dart';

import 'package:slack_onboarding/configs/animation_timeline.dart';
import 'package:slack_onboarding/configs/proportional_ratios.dart' as ProportionalRatios;
import 'package:slack_onboarding/utils/animations.dart';

/// The top section of the onboarding page
class TopSection extends StatelessWidget {
  final AnimationController controller;

  const TopSection({@required this.controller, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = ProportionalRatios.TopSection.fontSizeRatio * MediaQuery.of(context).size.width;
    final animationOffsetYBegin = -ProportionalRatios.TopSection.height * MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        child: SlideTransition(
          position: AnimationUtils.slideAnimation(
            controller: controller,
            startPosition: Offset(0, animationOffsetYBegin),
            endPosition: Offset.zero,
            startTime: AnimationTimeline.textSlideBegin,
            endTime: AnimationTimeline.textSlideEnd,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'All your team communication\n',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
                TextSpan(
                  text: 'in one place, instantly searchable.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
