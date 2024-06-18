import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
class DraggableWidget extends StatefulWidget {
  final int i;
  const DraggableWidget({super.key, required this.i});
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return               Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors
            .primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'Widget ${widget.i}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}