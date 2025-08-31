import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});
  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime currentMonth;
  late List<DateTime> datesGrid;
  int weeks = 6; //TODO add 1 and 2 week calendars!
  @override
  void initState() {
    super.initState();
    currentMonth = DateTime.now();
    datesGrid = _generateDatesGrid(currentMonth);
  }

  List<DateTime> _generateDatesGrid(DateTime month) {
    int numDays = DateTime(month.year, month.month + 1, 0).day;
    int firstWeekday = DateTime(month.year, month.month, 1).weekday % 7;
    List<DateTime> dates = [];

    // Fill previous month's dates
    DateTime previousMonth = DateTime(month.year, month.month - 1);
    int previousMonthLastDay =
        DateTime(previousMonth.year, previousMonth.month + 1, 0).day;
    for (int i = firstWeekday; i > 0; i--) {
      dates.add(DateTime(previousMonth.year, previousMonth.month,
          previousMonthLastDay - i + 1));
    }

    // Fill current month's dates
    for (int day = 1; day <= numDays; day++) {
      dates.add(DateTime(month.year, month.month, day));
    }

    // Fill next month's dates
    int remainingBoxes = 7 * weeks - dates.length; // 6 weeks * 7 days
    for (int day = 1; day <= remainingBoxes; day++) {
      dates.add(DateTime(month.year, month.month + 1, day));
    }

    return dates;
  }

  // void _changeMonth(int offset) {
  //   setState(() {
  //     currentMonth = DateTime(currentMonth.year, currentMonth.month + offset);
  //     datesGrid = _generateDatesGrid(currentMonth);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     IconButton(
        //       icon: const Icon(Icons.arrow_back_ios),
        //       onPressed: () => _changeMonth(-1),
        //     ),
        //     Text(
        //       '${_monthName(currentMonth.month)} ${currentMonth.year}',
        //       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.arrow_forward_ios),
        //       onPressed: () => _changeMonth(1),
        //     ),
        //   ],
        // ),
        // const Gap(12),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: List.generate(
        //         7,
        //         (index) => Text(
        //               ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 18,
        //                   color: Colors.blueGrey),
        //             )),
        //   ),
        // ),
        // const Gap(12),
        Flexible(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7),
            itemCount: datesGrid.length,
            itemBuilder: (context, index) {
              DateTime date = datesGrid[index];
              bool isCurrentMonth = date.month == currentMonth.month;
              bool isToday = date.day == DateTime.now().day &&
                  date.month == DateTime.now().month;
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  backgroundColor: isToday
                      ? Colors.red
                      : (isCurrentMonth ? Colors.white : Colors.transparent),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: isCurrentMonth ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
