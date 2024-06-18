import 'package:flutter/material.dart';

class DigitalClockWidget extends StatefulWidget {
  @override
  _DigitalClockWidgetState createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
  String _currentTime = '';
  String _date = '';
  String _amPm = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      DateTime now = DateTime.now();
      _currentTime = now.hour.toString().padLeft(2, '0') + ':' + now.minute.toString().padLeft(2, '0') + ':' + now.second.toString().padLeft(2, '0');
      _date = now.month.toString().padLeft(2, '0') + '/' + now.day.toString().padLeft(2, '0') + '/' + now.year.toString();
      _amPm = now.hour < 12? 'AM' : 'PM';
    });
    Future.delayed(Duration(seconds: 1), _updateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
      Text(
      _currentTime + _amPm,
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Text(
    _date,
    style: TextStyle(
    fontSize: 24,
    color: Colors.white,
    ),
    ),
    ],
    ),
    );
  }
}