import 'package:flutter/material.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
class DraggableWidget extends StatefulWidget {
  final Widget content;
  const DraggableWidget({super.key, required this.content});
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: widget.content);
  }
}