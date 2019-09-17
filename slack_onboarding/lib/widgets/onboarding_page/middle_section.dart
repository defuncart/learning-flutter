import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

import 'package:slack_onboarding/configs/animation_timeline.dart';
import 'package:slack_onboarding/configs/asset_paths.dart';
import 'package:slack_onboarding/configs/proportional_ratios.dart' as ProportionalRatios;
import 'package:slack_onboarding/utils/animations.dart';
import 'package:slack_onboarding/widgets/onboarding_page/chat_bubble.dart';

/// The middle section of the onboarding page
class MiddleSection extends StatelessWidget {
  final AnimationController controller;

  const MiddleSection({this.controller, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * ProportionalRatios.MiddleSection.height;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ScaleTransition(
            scale: AnimationUtils.fadeInAnimation(
              controller: controller,
              startTime: AnimationTimeline.chatBubble1Begin,
              endTime: AnimationTimeline.chatBubble1End,
            ),
            child: ChatBubble(
              assetPath: AssetPaths.avatar1,
              height: height * 0.2,
              alignment: Alignment.centerLeft,
              nip: BubbleNip.leftBottom,
            ),
          ),
          ScaleTransition(
            scale: AnimationUtils.fadeInAnimation(
              controller: controller,
              startTime: AnimationTimeline.chatBubble2Begin,
              endTime: AnimationTimeline.chatBubble2End,
            ),
            child: ChatBubble(
              assetPath: AssetPaths.avatar2,
              height: height * 0.2,
              alignment: Alignment.centerRight,
              nip: BubbleNip.rightBottom,
            ),
          ),
          ScaleTransition(
            scale: AnimationUtils.fadeInAnimation(
              controller: controller,
              startTime: AnimationTimeline.chatBubble3Begin,
              endTime: AnimationTimeline.chatBubble3End,
            ),
            child: ChatBubble(
              assetPath: AssetPaths.avatar3,
              height: height * 0.2,
              alignment: Alignment.centerLeft,
              nip: BubbleNip.leftBottom,
            ),
          ),
        ],
      ),
    );
  }
}
