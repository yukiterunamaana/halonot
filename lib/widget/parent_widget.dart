import 'dart:math';

import 'package:flutter/material.dart';
import 'package:halonot/main.dart';

class ParentWidget extends StatefulWidget {
  ParentWidget();

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  double _width = 100;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors
            .amber, //Colors.primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Widget',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
