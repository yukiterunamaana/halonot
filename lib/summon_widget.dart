import 'package:flutter/material.dart';
import 'package:halonot/main.dart';
import 'package:halonot/widget/parent_widget.dart';
import 'package:halonot/widget/widget_data.dart';

void summon(List<WidgetData> _widgets, StatefulWidget contents, double w,
    double h) async {
  _widgets.add(WidgetData(
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: contents,
      ),
      offset: Offset(0, 0)));
}

//dynamic List<PopupMenuEntry<StatefulWidget>>

void newsummon(List<StatefulWidget> _w, StatefulWidget contents) async {
  _w.add(contents);
}
