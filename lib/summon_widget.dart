import 'package:flutter/material.dart';
import 'package:halonot/main.dart';

void summon(List<WidgetData> _widgets) {
  _widgets.add(WidgetData(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors
              .amber, //Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Widget',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      offset: Offset(0, 0)));
}
