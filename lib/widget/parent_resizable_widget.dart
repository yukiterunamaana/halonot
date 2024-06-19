// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:halonot/main.dart';

import 'package:flutter/material.dart';
import 'package:halonot/global_values.dart';

class ParentResizableWidget extends StatefulWidget {
  final double gridSize;

  ParentResizableWidget({required this.gridSize});

  @override
  _ParentResizableWidgetState createState() => _ParentResizableWidgetState();
}

class _ParentResizableWidgetState extends State<ParentResizableWidget> {
  double _width = 100;
  double _height = 100;
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: InteractiveViewer(
        boundaryMargin: EdgeInsets.all(50),
        minScale: 0.1,
        maxScale: 5,
        child: GestureDetector(
          onScaleUpdate: (details) {
            if (widget.gridSize != null) {
              _width = (_width * details.scale).roundToDouble() /
                  widget.gridSize *
                  widget.gridSize;
              _height = (_height * details.scale).roundToDouble() /
                  widget.gridSize *
                  widget.gridSize;
            } else {
              _width *= details.scale;
              _height *= details.scale;
            }
            setState(() {});
          },
          onPanUpdate: (details) {
            if (widget.gridSize != null) {
              _offset += details.delta;
              _offset = Offset(
                (_offset.dx / widget.gridSize).round() * widget.gridSize,
                (_offset.dy / widget.gridSize).round() * widget.gridSize,
              );
            } else {
              _offset += details.delta;
            }
            setState(() {});
          },
          child: Container(
            width: _width,
            height: _height,
            color: Colors.red,
            child: Center(
              child: Text('Resizable Widget'),
            ),
          ),
        ),
      ),
    );
  }
}

// class ParentResizableWidget extends StatefulWidget {
//   final double gridSize;

//   ParentResizableWidget({required this.gridSize});

//   @override
//   _ParentResizableWidgetState createState() => _ParentResizableWidgetState();
// }

// class _ParentResizableWidgetState extends State<ParentResizableWidget> {
//   double _width = 100;
//   double _height = 100;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return GestureDetector(
//           // onScaleUpdate: (scaleUpdateDetails) {
//           //   setState(() {
//           //     _width = (_width * scaleUpdateDetails.scale)
//           //             .roundToDouble()
//           //             .toInt()
//           //             .toDouble() /
//           //         widget.gridSize *
//           //         widget.gridSize;
//           //     _height = (_height * scaleUpdateDetails.scale)
//           //             .roundToDouble()
//           //             .toInt()
//           //             .toDouble() /
//           //         widget.gridSize *
//           //         widget.gridSize;
//           //   });
//           // },
//           onScaleUpdate: (scaleUpdateDetails) {
//             if (scaleUpdateDetails.scale - 1.0 > 0.01 ||
//                 scaleUpdateDetails.scale - 1.0 < -0.01) {
//               setState(() {
//                 _width = (_width * scaleUpdateDetails.scale)
//                         .roundToDouble()
//                         .toInt()
//                         .toDouble() /
//                     widget.gridSize *
//                     widget.gridSize;
//                 _height = (_height * scaleUpdateDetails.scale)
//                         .roundToDouble()
//                         .toInt()
//                         .toDouble() /
//                     widget.gridSize *
//                     widget.gridSize;
//               });
//             }
//           },
//           child: Container(
//             width: _width,
//             height: _height,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//             ),
//             child: Container(
//               width: _width,
//               height: _height,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 //Colors.primaries[Random().nextInt(Colors.primaries.length)],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   'Widget++',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
