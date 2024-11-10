import 'package:flutter/material.dart';
import 'package:halonot/global_values.dart';
import 'package:halonot/summon_widget.dart';
import 'package:halonot/widget/widgets/calendar.dart';
import 'package:halonot/widget/widgets/clock.dart';
import 'package:halonot/widget/widgets/embed.dart';
//import 'package:halonot/widget/widgets/image_frame.dart';
import 'package:halonot/widget/widgets/text.dart';
import 'package:pair/pair.dart';

List<PopupMenuEntry<Pair<StatefulWidget, Pair<double, double>>>> widgetList = [
  // PopupMenuItem(
  //   child: Text('Add ParentWidget'),
  //   value: ParentWidget(stubWidget as Widget),
  // ),
  // PopupMenuItem(
  //   child: Text('Add ParentResizableWidget'),
  //   value: ResizableParentWidget(stubWidget as Widget),
  // ),
  PopupMenuItem(
    child: Text('Add Calendar'),
    value: Pair(
        CalendarWidget(), Pair(400, 350)), //<CalendarWidget(),Pair<int,int>>,
  ),
  PopupMenuItem(
    child: Text('Add Analog Clock'),
    value: Pair(ClockWidget(), Pair(150, 150)),
  ),
  PopupMenuItem(
    child: Text('Add Digital Clock'),
    value: Pair(DigitalClockWidget(), Pair(100, 50)),
  ),
  // PopupMenuItem(
  //   child: Text('Add HTML embed'),
  //   value:
  //   HtmlEmbed(
  //     htmlContent: vid,
  //   ),
  // ),
  // PopupMenuItem(
  //   child: Text('Add Image'),
  //   value: ResizableImage(),
  // ),
  PopupMenuItem(
    child: Text('Add Text'),
    value: Pair(MarkdownNotepad(), Pair(400, 400)),
  ),
  // PopupMenuItem(
  //   child: Text('Add Video'),
  //   value: '',
  // ),
];
