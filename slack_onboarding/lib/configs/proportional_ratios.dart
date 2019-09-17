/*  A config of proportional ratios to adapt the app across multiple screen resolutions and aspect ratios
 *
 *  This should be imported as
 *  import 'package:slack_onboarding/configs/proportional_ratios.dart' as ProportionalRatios;
 *  
 *  so that ProportionalRatios.OnboardingPage.flexTop can be utilized. Workaround as inner classes aren't supported.
 */

const referenceScreenWidth = 320;

/// A config of flex values (which sum to 100) of how the OnboardingPage should be proportionally displayed
class OnboardingPage {
  static const flexTop = 18;
  static const flexMiddle = 55;
  static const flexSpace = 3;
  static const flexBottom = 24;
}

/// A config for TopSection
class TopSection {
  static double get height => OnboardingPage.flexTop / 100.0;
  static const _fontSize = 18;
  static double get fontSizeRatio => _fontSize / referenceScreenWidth;
}

/// A config for MiddleSection
class MiddleSection {
  static double get height => OnboardingPage.flexMiddle / 100.0;
  static const _messageHeight = 6;
  static double get messageHeight => _messageHeight / referenceScreenWidth;
  static const bubbleWidthPercentage = 0.6;
  static const paddingWidthPercentage = 0.05;
}

/// A config for BottomSection
class BottomSection {
  static double get height => OnboardingPage.flexBottom / 100.0;
  static const widthPercentage = 0.6;
  static const _fontSize = 16;
  static double get fontSizeRatio => _fontSize / referenceScreenWidth;
}
