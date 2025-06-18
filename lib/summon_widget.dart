import 'package:flutter/material.dart';
import 'package:halonot/main.dart';
import 'package:halonot/widget/parent_widget.dart';

void summon(
    List<WidgetData> _widgets, Widget contents, double w, double h) async {
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
