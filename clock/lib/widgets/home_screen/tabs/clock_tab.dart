import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:clock/widgets/home_screen/tabs/base_tab.dart';

/// The clock tab displays an analog clock
class ClockTab extends StatelessWidget {
  const ClockTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// A white color used in rendering the clock
    final whiteColor = Theme.of(context).textTheme.body1.color;
    /// The clock's width, 85% of the screen's width
    final width = MediaQuery.of(context).size.width * 0.85;

    return BaseTab(
      title: 'Clock',
      child: Center(
        child: AnalogClock(
          width: width,
          datetime: null,
          key: GlobalObjectKey(2),
          showDigitalClock: true,
          hourHandColor: whiteColor,
          minuteHandColor: whiteColor,
          secondHandColor: Theme.of(context).accentColor,
          tickColor: Theme.of(context).unselectedWidgetColor,
          digitalClockColor: whiteColor,
          numberColor: whiteColor,
        ),
      ),
    );
  }
}
