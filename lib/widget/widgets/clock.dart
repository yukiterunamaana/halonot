import 'package:flutter/material.dart';
import 'package:halonot/widget/parent_widget.dart';
import 'package:one_clock/one_clock.dart';

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({Key? key}) : super(key: key);

  @override
  State<DigitalClockWidget> createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
  @override
  Widget build(BuildContext context) {
    return const DigitalClock(
      isLive: true,
    );
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Widget w = const AnalogClock(
    isLive: true,
    showDigitalClock: false,
    showSecondHand: true,
  );

  @override
  Widget build(BuildContext context) {
    return //ParentWidget(content: w);
        AnalogClock(
      isLive: true,
      showDigitalClock: false,
      showSecondHand: true,
    );
  }
}
