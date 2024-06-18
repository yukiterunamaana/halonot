

import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  DateTime dateTime = DateTime.now();

  void _setNewDateTime(DateTime dateTiime) {
    setState(() {
      dateTime = dateTiime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnalogClockExample(dateTime),
              const SizedBox(
                height: 50,
              ),
              ...DigitalClockExample(dateTime)
            ],
          ),
        ),
      ),
    );
  }
}
Widget AnalogClockExample(DateTime dateTimee) {
  return SingleChildScrollView(
    // padding: EdgeInsets.all(7),
    scrollDirection: Axis.horizontal,
    child: Column(
      children: [
        const Text(
          "Analog Clock Example",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            AnalogClock(
              isLive: false,
              width: 120,
              height: 120,
              datetime: dateTimee,
            ),
            const SizedBox(
              width: 10,
            ),
            AnalogClock.dark(
              width: 120,
              height: 120,
              isLive: true,
              datetime: dateTimee,
            ),
            const SizedBox(
              width: 10,
            ),
            AnalogClock(
              width: 120,
              height: 120,
              isLive: true,
              decoration: BoxDecoration(color: Colors.green[100], shape: BoxShape.circle),
              datetime: dateTimee,
            ),
            const SizedBox(
              width: 10,
            ),
            AnalogClock(
              width: 120,
              height: 120,
              isLive: true,
              decoration: BoxDecoration(color: Colors.yellow[100], shape: BoxShape.circle),
              datetime: dateTimee,
            ),
            const SizedBox(
              width: 10,
            ),
            AnalogClock(
              width: 120,
              height: 120,
              isLive: true,
              showDigitalClock: false,
              decoration: BoxDecoration(color: Colors.cyan[100], shape: BoxShape.circle),
              datetime: dateTimee,
            ),
            const SizedBox(
              width: 10,
            ),
            AnalogClock(
              width: 120,
              height: 120,
              isLive: true,
              showDigitalClock: false,
              decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
              datetime: dateTimee,
            ),
          ],
        ),
      ],
    ),
  );
}

List<Widget> DigitalClockExample(DateTime dateTimee) {
  return [
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          const Text(
            "Digital Clock Example",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DigitalClock(
                showSeconds: true,
                datetime: dateTimee,
                textScaleFactor: 1.3,
                isLive: true,
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock.dark(
                datetime: dateTimee,
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock.light(
                isLive: true,
                datetime: dateTimee,
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock(
                datetime: dateTimee,
                textScaleFactor: 2,
                showSeconds: false,
                isLive: true,
                decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock(
                datetime: dateTimee,
                isLive: true,
                decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock(
                datetime: dateTimee,
                isLive: true,
                decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ],
          ),
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
            isLive: true,
          ),
          DigitalClock.dark(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
          ),
          DigitalClock.light(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            isLive: true,
            datetime: dateTimee,
          )
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock.dark(
            datetime: dateTimee,
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock.light(
            isLive: true,
            datetime: dateTimee,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
            isLive: true,
          ),
          DigitalClock.dark(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          DigitalClock.light(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            isLive: true,
            datetime: dateTimee,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          )
        ],
      ),
    ),
    const SizedBox(
      height: 50,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          const Text(
            "Digital Clock Example with custom INTL format",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DigitalClock(
                format: "H",
                showSeconds: true,
                datetime: dateTimee,
                textScaleFactor: 1.3,
                isLive: true,
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock.dark(
                format: "Hm",
                datetime: dateTimee,
              ),
              const SizedBox(
                width: 10,
              ),
              DigitalClock.light(
                format: "Hms",
                isLive: true,
                datetime: dateTimee,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: DigitalClock(
                  format: 'yMMMEd',
                  datetime: dateTimee,
                  textScaleFactor: 1,
                  showSeconds: false,
                  isLive: true,
                  // decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ];
}

// import 'package:flutter/material.dart';
//
// class CustomizableDigitalClock extends StatefulWidget {
//   @override
//   _CustomizableDigitalClockState createState() => _CustomizableDigitalClockState();
// }
//
// class _CustomizableDigitalClockState extends State<CustomizableDigitalClock> {
//   bool _is24HourFormat = true;
//   TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DigitalClock(
//           is24HourFormat: _is24HourFormat,
//           selectedTime: _selectedTime,
//         ),
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('12-hour format: '),
//             Switch(
//               value: !_is24HourFormat,
//               onChanged: (value) {
//                 setState(() {
//                   _is24HourFormat = !value;
//                 });
//               },
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           child: Text('Set time'),
//           onPressed: () async {
//             final TimeOfDay? newTime = await showTimePicker(
//               context: context,
//               initialTime: _selectedTime,
//             );
//             if (newTime != null) {
//               setState(() {
//                 _selectedTime = newTime;
//               });
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class DigitalClock extends StatelessWidget {
//   final bool is24HourFormat;
//   final TimeOfDay selectedTime;
//
//   DigitalClock({required this.is24HourFormat, required this.selectedTime});
//
//   @override
//   Widget build(BuildContext context) {
//     final String formattedTime = is24HourFormat
//         ? '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}:00'
//         : '${selectedTime.hour > 12 ? selectedTime.hour - 12 : selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}:${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
//
//     return Text(
//       formattedTime,
//       style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//     );
//   }
// }