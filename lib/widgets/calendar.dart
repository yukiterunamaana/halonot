import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();

  List<DateTime> _getDaysInMonth(DateTime date) {
    final DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    final int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(daysInMonth, (index) {
      return DateTime(date.year, date.month, index + 1);
    });
  }

  List<Widget> _buildWeekdays() {
    final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays.map((weekday) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        child: Text(
          weekday,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildDays() {
    final List<Widget> days = [];
    final List<DateTime> daysInMonth = _getDaysInMonth(_selectedDate);
    for (int i = 0; i < daysInMonth.length; i++) {
      final DateTime day = daysInMonth[i];
      final bool isSelected = _selectedDate.year == day.year && _selectedDate.month == day.month && _selectedDate.day == day.day;
      final bool isCurrentDay = DateTime.now().year == day.year && DateTime.now().month == day.month && DateTime.now().day == day.day;
      final Widget dayWidget = Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            day.day.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.white : isCurrentDay ? Colors.red : Colors.black,
            ),
          ),
        ),
      );
      days.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = day;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: dayWidget,
          ),
        ),
      );
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: _buildWeekdays(),
          ),
          Container(
            height: 300,
            child: GridView.count(
              crossAxisCount: 7,
              children: _buildDays(),
            ),
          ),
        ],
      ),
    );
  }
}