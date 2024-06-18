import 'dart:math';

import 'package:flutter/material.dart';
import 'package:halonot/main.dart';

class ParentResizableWidget extends StatefulWidget {
  final double gridSize;

  ParentResizableWidget({required this.gridSize});

  @override
  _ParentResizableWidgetState createState() => _ParentResizableWidgetState();
}

class _ParentResizableWidgetState extends State<ParentResizableWidget> {
  double _width = 100;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          // onScaleUpdate: (scaleUpdateDetails) {
          //   setState(() {
          //     _width = (_width * scaleUpdateDetails.scale)
          //             .roundToDouble()
          //             .toInt()
          //             .toDouble() /
          //         widget.gridSize *
          //         widget.gridSize;
          //     _height = (_height * scaleUpdateDetails.scale)
          //             .roundToDouble()
          //             .toInt()
          //             .toDouble() /
          //         widget.gridSize *
          //         widget.gridSize;
          //   });
          // },
          onScaleUpdate: (scaleUpdateDetails) {
            if (scaleUpdateDetails.scale - 1.0 > 0.01 ||
                scaleUpdateDetails.scale - 1.0 < -0.01) {
              setState(() {
                _width = (_width * scaleUpdateDetails.scale)
                        .roundToDouble()
                        .toInt()
                        .toDouble() /
                    widget.gridSize *
                    widget.gridSize;
                _height = (_height * scaleUpdateDetails.scale)
                        .roundToDouble()
                        .toInt()
                        .toDouble() /
                    widget.gridSize *
                    widget.gridSize;
              });
            }
          },
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.green,
                //Colors.primaries[Random().nextInt(Colors.primaries.length)],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Widget++',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
