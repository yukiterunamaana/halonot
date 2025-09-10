import 'package:flutter/material.dart';
import 'package:halonot/widget/widgets/calendar.dart';
import 'package:halonot/widget/widgets/clock.dart';
import 'package:halonot/widget/widgets/parentfile_decoy.dart';
import 'package:halonot/widget/widgets/text.dart';
import 'package:halonot/widget/widgets/currency_ticker.dart';
import 'package:halonot/widget/widgets/stock_ticker.dart';
import 'package:pair/pair.dart';

List<PopupMenuEntry<Pair<StatefulWidget, Pair<double, double>>>> widgetList = [
  PopupMenuItem(
    child: Text('Add Calendar'),
    value: Pair(
        CalendarWidget(), Pair(400, 350)), //<CalendarWidget(),Pair<int,int>>,
  ),
  // PopupMenuItem(
  //   child: Text('Add 2-week Calendar'),
  //   value: Pair(
  //       CalendarWidget(2), Pair(400, 350)), //<CalendarWidget(),Pair<int,int>>,
  // ),
  PopupMenuItem(
    child: Text('Add Analog Clock'),
    value: Pair(ClockWidget(), Pair(150, 150)),
  ),
  PopupMenuItem(
    child: Text('Add Digital Clock'),
    value: Pair(DigitalClockWidget(), Pair(100, 50)),
  ),
  PopupMenuItem(
    child: Text('Add Text'),
    value: Pair(MarkdownNotepad(), Pair(400, 400)),
  ),
  PopupMenuItem(
    child: Text('Add Demo'),
    value: Pair(TextWithCorners(), Pair(200, 200)),
  ),

  PopupMenuItem(
    child: Text('Add Currency'),
    value: Pair(CurrencyTicker(), Pair(200, 100)),
  ),

  PopupMenuItem(
    child: Text('Add Stock'),
    value: Pair(StockTicker(), Pair(200, 100)),
  ),
];

List<PopupMenuEntry<StatefulWidget>> wList = [
  PopupMenuItem(
    child: Text('Add Calendar'),
    value: CalendarWidget(),
  ),
  // PopupMenuItem(
  //   child: Text('Add 2-week Calendar'),
  //   value: Pair(
  //       CalendarWidget(2), Pair(400, 350)), //<CalendarWidget(),Pair<int,int>>,
  // ),
  PopupMenuItem(child: Text('Add Analog Clock'), value: ClockWidget()),
  PopupMenuItem(child: Text('Add Digital Clock'), value: DigitalClockWidget()),
  PopupMenuItem(child: Text('Add Text'), value: MarkdownNotepad()),
  PopupMenuItem(child: Text('Add Demo'), value: TextWithCorners()),
];
