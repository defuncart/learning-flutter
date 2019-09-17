import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

import 'package:slack_onboarding/configs/proportional_ratios.dart' as ProportionalRatios;
import 'package:slack_onboarding/configs/app_colors.dart';
import 'package:slack_onboarding/widgets/onboarding_page/chat_message.dart';

/// A chat bubble featuring an avatar and chat text
class ChatBubble extends StatelessWidget {
  final String assetPath;
  final double height;
  final Alignment alignment;
  final BubbleNip nip;

  const ChatBubble({
    @required this.assetPath,
    @required this.height,
    @required this.alignment,
    @required this.nip,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingWidth = ProportionalRatios.MiddleSection.paddingWidthPercentage * MediaQuery.of(context).size.width;
    final width = ProportionalRatios.MiddleSection.bubbleWidthPercentage * MediaQuery.of(context).size.width;
    final messageHeight = ProportionalRatios.MiddleSection.messageHeight * MediaQuery.of(context).size.height;

    return Bubble(
      margin: alignment == Alignment.centerLeft
          ? BubbleEdges.only(left: paddingWidth)
          : BubbleEdges.only(right: paddingWidth),
      alignment: alignment,
      nip: nip,
      child: Container(
        height: height,
        width: width,
        child: Row(
          children: <Widget>[
            Image.asset(assetPath),
            Container(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ChatMessage(
                  width: width * 0.25,
                  height: messageHeight,
                  color: AppColors.grayDark,
                ),
                ChatMessage(
                  width: width * 0.5,
                  height: messageHeight,
                  color: AppColors.grayLight,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
