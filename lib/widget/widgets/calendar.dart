import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _classNameState();
}

class _classNameState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(DateTime.now().year, DateTime.now().month, 1),
      lastDay: DateTime.utc(
          DateTime.now().year,
          DateTime.now().month + 1,
          DateTimeRange(
                  start: DateTime(DateTime.now().year, DateTime.now().month, 1),
                  end: DateTime(DateTime.now().year, DateTime.now().month + 1))
              .duration
              .inDays),
      focusedDay: DateTime.now(),
    );
  }
}
