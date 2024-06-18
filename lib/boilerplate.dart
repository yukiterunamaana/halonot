import 'package:flutter/material.dart';
import 'package:halonot/widgets/local/calendar.dart';
import 'package:one_clock/one_clock.dart';
class BoilerPlate
    extends StatefulWidget {
  @override
  _BoilerPlateState createState() => _BoilerPlateState();
}

class _BoilerPlateState extends State<BoilerPlate> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Column(children: [

          SizedBox(width: 300, height: 312, child: TableBasicsExample()),
          SizedBox(width: 300, height: 50, child: DigitalClock())
        ])
    );
  }
}