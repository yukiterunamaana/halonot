import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'dart:math';

import 'package:halonot/widgets/local/calendar.dart';
import 'package:halonot/widgets/local/clock.dart';
import 'package:halonot/widgets/local/text.dart';
import 'package:one_clock/one_clock.dart';
import 'package:table_calendar/table_calendar.dart';

import 'grid.dart';
import 'interactive_board.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Board',
      home: InteractiveBoard(),
    );
  }
}




