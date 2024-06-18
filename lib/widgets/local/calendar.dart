// // import 'package:flutter/material.dart';
// //
// // class CalendarWidget extends StatefulWidget {
// //   @override
// //   _CalendarWidgetState createState() => _CalendarWidgetState();
// // }
// //
// // class _CalendarWidgetState extends State<CalendarWidget> {
// //   DateTime _selectedDate = DateTime.now();
// //
// //   List<DateTime> _getDaysInMonth(DateTime date) {
// //     final DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
// //     final int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
// //     return List.generate(daysInMonth, (index) {
// //       return DateTime(date.year, date.month, index + 1);
// //     });
// //   }
// //
// //   List<Widget> _buildWeekdays() {
// //     final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
// //     return weekdays.map((weekday) {
// //       return Container(
// //         padding: EdgeInsets.symmetric(vertical: 8),
// //         alignment: Alignment.center,
// //         child: Text(
// //           weekday,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       );
// //     }).toList();
// //   }
// //
// //   List<Widget> _buildDays() {
// //     final List<Widget> days = [];
// //     final List<DateTime> daysInMonth = _getDaysInMonth(_selectedDate);
// //     for (int i = 0; i < daysInMonth.length; i++) {
// //       final DateTime day = daysInMonth[i];
// //       final bool isSelected = _selectedDate.year == day.year && _selectedDate.month == day.month && _selectedDate.day == day.day;
// //       final bool isCurrentDay = DateTime.now().year == day.year && DateTime.now().month == day.month && DateTime.now().day == day.day;
// //       final Widget dayWidget = Container(
// //         padding: EdgeInsets.all(8),
// //         child: Center(
// //           child: Text(
// //             day.day.toString(),
// //             style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //               color: isSelected ? Colors.white : isCurrentDay ? Colors.red : Colors.black,
// //             ),
// //           ),
// //         ),
// //       );
// //       days.add(
// //         GestureDetector(
// //           onTap: () {
// //             setState(() {
// //               _selectedDate = day;
// //             });
// //           },
// //           child: Container(
// //             decoration: BoxDecoration(
// //               color: isSelected ? Colors.blue : Colors.transparent,
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: dayWidget,
// //           ),
// //         ),
// //       );
// //     }
// //     return days;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(16),
// //       child: Column(
// //         children: [
// //           Row(
// //             children: _buildWeekdays(),
// //           ),
// //           Container(
// //             height: 300,
// //             child: GridView.count(
// //               crossAxisCount: 7,
// //               children: _buildDays(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0
//
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
//
// import 'pages/basics_example.dart';
// import 'pages/complex_example.dart';
// import 'pages/events_example.dart';
// import 'pages/multi_example.dart';
// import 'pages/range_example.dart';
//
// void main() {
//   initializeDateFormatting().then((_) => runApp(MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TableCalendar Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: StartPage(),
//     );
//   }
// }
//
// class StartPage extends StatefulWidget {
//   @override
//   _StartPageState createState() => _StartPageState();
// }
//
// class _StartPageState extends State<StartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20.0),
//             ElevatedButton(
//               child: Text('Basics'),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => TableBasicsExample()),
//               ),
//             ),
//             const SizedBox(height: 12.0),
//             ElevatedButton(
//               child: Text('Range Selection'),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => TableRangeExample()),
//               ),
//             ),
//             const SizedBox(height: 12.0),
//             ElevatedButton(
//               child: Text('Events'),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => TableEventsExample()),
//               ),
//             ),
//             const SizedBox(height: 12.0),
//             ElevatedButton(
//               child: Text('Multiple Selection'),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => TableMultiExample()),
//               ),
//             ),
//             const SizedBox(height: 12.0),
//             ElevatedButton(
//               child: Text('Complex'),
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => TableComplexExample()),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//import '../utils.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        daysOfWeekVisible: false,
        headerVisible: false,
        firstDay: DateTime.utc(DateTime.now().year,DateTime.now().month),
        lastDay: DateTime.utc(DateTime.now().year,DateTime.now().month+1),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}