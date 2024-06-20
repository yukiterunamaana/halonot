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
    return Material(
        child: TableCalendar(
      calendarStyle: CalendarStyle(
        todayDecoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        todayTextStyle: TextStyle(fontSize: 18, color: Colors.white),
        defaultTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        weekendTextStyle: TextStyle(fontSize: 18, color: Colors.red),
        holidayTextStyle: TextStyle(fontSize: 18, color: Colors.red),
      ),
      headerVisible: false,
      daysOfWeekVisible: false,
      pageAnimationEnabled: false,
      sixWeekMonthsEnforced: true,
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
    ));
  }
}
