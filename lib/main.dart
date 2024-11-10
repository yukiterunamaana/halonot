import 'package:flutter/material.dart';
import 'package:halonot/global_values.dart';
import 'package:halonot/summon_widget.dart';
//import 'package:halonot/widget/widgets/embed_example.dart';
import 'package:halonot/widgets_list.dart';
import 'package:halonot/grid.dart';
import 'package:pair/pair.dart';

void main() {
  //runApp(IframeScreen());
  runApp(MyApp());
  //EmbedCodeWidget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Board',
      home: InteractiveBoard(),
    );
  }
}

class InteractiveBoard extends StatefulWidget {
  @override
  _InteractiveBoardState createState() => _InteractiveBoardState();
}

class _InteractiveBoardState extends State<InteractiveBoard> {
  List<WidgetData> _widgets = [];
  bool _showGrid = true;
  bool _snapToGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: _showGrid,
            onChanged: (value) async {
              setState(() {
                _showGrid = value;
                _snapToGrid = value;
              });
              if (_showGrid) {
                bool shouldSnap = await _showAlertDialog(context);
                if (shouldSnap) {
                  _snapWidgetsToGrid();
                }
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (_showGrid)
            CustomPaint(
              painter: GridPainter(),
              size: Size.infinite,
            ),
          ..._widgets.map((widgetData) => Positioned(
                left: widgetData.offset.dx,
                top: widgetData.offset.dy,
                child: LongPressDraggable(
                  child: widgetData.child,
                  feedback: widgetData.child,
                  onDragStarted: () {
                    print('Drag started');
                  },
                  onDragUpdate: (details) {
                    Offset newPosition = widgetData.offset + details.delta;
                    // if (_snapToGrid) {
                    //   newPosition = Offset(
                    //     (newPosition.dx / 50).round() * 50,
                    //     (newPosition.dy / 50).round() * 50,
                    //   );
                    // }
                    setState(() {
                      widgetData.offset = newPosition;
                    });
                  },
                  onDragEnd: (details) {
                    print('Drag ended');
                    if (_snapToGrid) _snapWidgetsToGrid();
                  },
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMenu<
                  Pair<StatefulWidget,
                      Pair<double, double>>> //somebody, please, kill me.
              (
            context: context,
            position: RelativeRect.fromLTRB(100, 100, 100, 100),
            items: widgetList,
            elevation: 8.0,
          ).then((value) {
            if (value != null) {
              setState(() {
                Widget stub = const Center(
                  child: Text(
                    'Widget',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                //if (value == 'ParentWidget')
                summon(
                    _widgets,
                    value.key,
                    value.value.key,
                    value.value
                        .value); //I hate myself as much as you hate me reading this
                //summon(_widgets, stub);
                // _widgets.add(WidgetData(
                //     child: Container(
                //       width: 100,
                //       height: 100,
                //       decoration: BoxDecoration(
                //         color: Colors
                //             .amber, //Colors.primaries[Random().nextInt(Colors.primaries.length)],
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: const Center(
                //         child: Text(
                //           'Widget',
                //           style: TextStyle(fontSize: 18),
                //         ),
                //       ),
                //     ),
                //     offset: Offset(0, 0)));

                // else if (value == 'ParentResizableWidget')
                //   _widgets.add(WidgetData(
                //       child: ParentResizableWidget(
                //         gridSize: grid_step as double,
                //         // child: ParentWidget(),
                //       ),
                //       offset: Offset(0, 0)));
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<bool> _showAlertDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Snap to Grid'),
          content: Text(
              'Some widgets might be not aligned to the grid. Do you want to snap them to the grid?'),
          actions: [
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  void _snapWidgetsToGrid() {
    setState(() {
      _widgets = _widgets.map((widgetData) {
        Offset newPosition = Offset(
          (widgetData.offset.dx / 50).round() * 50,
          (widgetData.offset.dy / 50).round() * 50,
        );
        return WidgetData(child: widgetData.child, offset: newPosition);
      }).toList();
    });
  }
}

class WidgetData {
  Widget child;
  Offset offset;

  WidgetData({required this.child, required this.offset});
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5;

    for (int i = 0; i < size.height; i += 50) {
      canvas.drawLine(
          Offset(0, i.toDouble()), Offset(size.width, i.toDouble()), paint);
    }

    for (int i = 0; i < size.width; i += 50) {
      canvas.drawLine(
          Offset(i.toDouble(), 0), Offset(i.toDouble(), size.height), paint);
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) => false;
}
