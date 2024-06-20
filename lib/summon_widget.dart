import 'package:flutter/material.dart';
import 'package:halonot/main.dart';
import 'package:halonot/widget/parent_widget.dart';

void summon(List<WidgetData> _widgets, Widget contents) async {
  _widgets.add(WidgetData(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Colors
              .amber, //Colors.primaries[Random().nextInt(Colors.primaries.length)],

          borderRadius: BorderRadius.circular(10),
        ),
        child: contents,
        // const Center(
        //   child: Text(
        //     'Widget',
        //     style: TextStyle(fontSize: 18),
        //   ),
        // ),
      ),
      offset: Offset(0, 0)));
}
