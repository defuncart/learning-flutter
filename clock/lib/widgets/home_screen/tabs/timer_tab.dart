import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock/widgets/home_screen/circular_button.dart';
import 'package:clock/widgets/home_screen/tabs/base_tab.dart';
import 'package:clock/widgets/home_screen/timer_widget.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({Key key}) : super(key: key);

  @override
  _TimerTabState createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  Duration timerDuration = Duration(minutes: 1, seconds: 10);
  Timer timer;
  int elapsedSeconds;
  Duration remainingDuration;
  double progress;
  bool isPaused;

  bool get isTimerActive => timer != null && timer.isActive;

  @override
  void initState() {
    super.initState();
    isPaused = false;
    _initializeDisplay();
  }

  /// Initializes the display to timerDuration
  void _initializeDisplay() {
    progress = 0;
    remainingDuration = timerDuration;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  /// Callback every second to update the timer
  void callback(Timer timer) {
    elapsedSeconds++;
    final remainingSeconds = timerDuration.inSeconds - elapsedSeconds;

    setState(() {
      remainingDuration = Duration(seconds: remainingSeconds);
      progress = remainingSeconds / (timerDuration.inSeconds * 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color accentColor = Theme.of(context).accentColor;
    Color highlightColor = Theme.of(context).highlightColor;

    return BaseTab(
      title: 'Timer',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TimerWidget(
              progress: progress,
              remaining: remainingDuration,
            ),
            if (!isTimerActive)
              CircularButton(
                callback: () => _startTimer(),
                fillColor: accentColor,
                icon: Icons.play_arrow,
                iconColor: Colors.white,
              ),
            if (isTimerActive)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircularButton(
                    callback: () => _pauseTimer(),
                    fillColor: highlightColor,
                    icon: Icons.pause,
                    iconColor: Colors.white,
                  ),
                  CircularButton(
                    callback: () => _stopTimer(),
                    fillColor: accentColor,
                    icon: Icons.stop,
                    iconColor: Colors.white,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), callback);

    setState(() {
      if (isPaused) {
        isPaused = false;
      } else {
        elapsedSeconds = 0;
        _initializeDisplay();
      }
    });
  }

  void _pauseTimer() {
    isPaused = true;

    setState(() {
      _cancelTimer();
    });
  }

  void _stopTimer() {
    _cancelTimer();

    setState(() {
      _initializeDisplay();
    });
  }

  void _cancelTimer() {
    timer.cancel();
    timer = null;
  }
}
