import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clock/widgets/home_screen/circular_button.dart';
import 'package:clock/widgets/home_screen/tabs/base_tab.dart';

/// The stopwatch tab
class StopwatchTab extends StatefulWidget {
  const StopwatchTab({Key key}) : super(key: key);

  @override
  _StopwatchTabState createState() => _StopwatchTabState();
}

class _StopwatchTabState extends State<StopwatchTab> {
  /// A timer to update the UI
  Timer timer;

  /// A stopwatch
  Stopwatch stopwatch;

  /// The time to display
  String displayString;

  @override
  void initState() {
    stopwatch = Stopwatch();
    _resetDisplay();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    stopwatch?.stop();
    stopwatch = null;
    super.dispose();
  }

  /// A callback for the update timer
  void updateCallback(Timer timer) {
    if (stopwatch.isRunning) {
      final int hundreds = ((stopwatch.elapsedMilliseconds % 1000) / 10.0).truncate(); //hs = first two digits of ms
      final int seconds = ((stopwatch.elapsedMilliseconds / 1000) % 60).truncate();
      final int minutes = (stopwatch.elapsedMilliseconds / (60 * 1000)).truncate();

      setState(() {
        displayString = _format(minutes, seconds, hundreds);
      });
    }
  }

  /// Formats minutes, seconds and hundres into a string mm:ss:hh
  String _format(int minutes, int seconds, int hundreds) {
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${hundreds.toString().padLeft(2, '0')}';
  }

  /// Resets the display to 00:00:00
  void _resetDisplay() {
    displayString = _format(0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      title: 'Stopwatch',
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              child: Text(
                displayString,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 68,
                ),
              ),
              flex: 2,
            ),
            if (stopwatch.isRunning)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircularButton(
                    callback: () => _onPause(),
                    fillColor: Theme.of(context).highlightColor,
                    icon: Icons.pause,
                    iconColor: Colors.white,
                  ),
                  CircularButton(
                    callback: () => _onStop(),
                    fillColor: Theme.of(context).accentColor,
                    icon: Icons.stop,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            if (!stopwatch.isRunning)
              CircularButton(
                callback: () => _onStart(),
                fillColor: Theme.of(context).accentColor,
                icon: Icons.play_arrow,
                iconColor: Colors.white,
              ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  /// Starts the update timer
  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1), updateCallback);
  }

  /// Cancels the update timer
  void _cancelTimer() {
    timer.cancel();
  }

  /// A callback when the stopwatch is started
  void _onStart() {
    setState(() {
      stopwatch.start();
      _startTimer();
    });
  }

  /// A callback when the stopwatch is paused
  void _onPause() {
    setState(() {
      stopwatch.stop();
      _cancelTimer();
    });
  }

  /// A callback when the stopwatch is stopped
  void _onStop() {
    setState(() {
      stopwatch.stop();
      stopwatch.reset();
      _cancelTimer();
      _resetDisplay();
    });
  }
}
