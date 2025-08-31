/*
import 'package:flutter/material.dart';

import 'package:halonot/widget/global_values.dart';
import 'package:halonot/widget/widget_data.dart';

class ParentResizableWidget extends StatefulWidget {
  WidgetData widgetData;
  ParentResizableWidget({Key? key, required this.widgetData})
      : super(key: key);

  @override
  _ParentResizableWidgetState createState() => _ParentResizableWidgetState();
}

class _ParentResizableWidgetState extends State<ParentResizableWidget> {
  @override
  void initState() {
    super.initState();
    widgetData = widget.widgetData;
  }

  void _updatePosition(Offset newPosition) {
    setState(() {
      widgetData.offset = newPosition;
    });
  }

  void _updateSize(Offset delta) {
    setState(() {
      double newWidth = widgetData.size.width + delta.dx;
      double newHeight = widgetData.size.height + delta.dy;

      widgetData.size = Size(
        newWidth.clamp(50.0, 500.0),
        newHeight.clamp(50.0, 500.0),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widgetData.offset.dx,
      top: widgetData.offset.dy,
      child: LongPressDraggable(
        //enabled: true,
        feedback: widgetData.child,
        onDragStarted: () {
          print('Drag started');
        },
        onDragUpdate: (details) {
          Offset newPosition = widgetData.offset + details.delta;
          setState(() {
            widgetData.offset = newPosition;
          });
        },
        onDragEnd: (details) {
          print('Drag ended');
          if (_snapToGrid) _snapWidgetsToGrid();
        },
        child: widgetData.child,
      ),
    );
  }
}
*/