import 'package:flutter/material.dart';
import 'package:halonot/widget/global_values.dart';
import 'package:halonot/widget/widget_data.dart';
import 'package:halonot/summon_widget.dart';
import 'package:halonot/widgets_list.dart';
import '../background/grid.dart';
import 'package:pair/pair.dart';

class InteractiveBoard extends StatefulWidget {
  @override
  _InteractiveBoardState createState() => _InteractiveBoardState();
}

class _InteractiveBoardState extends State<InteractiveBoard> {
  List<WidgetData> _widgets = [];
  //!!
  List<StatefulWidget> _w = [];
  GlobalValues globalValues = GlobalValues();
  // bool _showGrid = true;
  // bool _snapToGrid = true;
  // bool _isEditAllowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: globalValues.getShowGrid(),
              onChanged: (value) {
                globalValues.setShowGrid(value);
              }
              // async {
              //   setState(() {
              //     global._showGrid = value;
              //   });
              // },
              ),
          Switch(
              value: globalValues.getSnapToGrid(),
              onChanged: (value) {
                globalValues.setSnapToGrid(value);
              }
              // async {
              //   setState(() {
              //     global._snapToGrid = value;
              //   });
              //   if (global._snapToGrid) {
              //     bool shouldSnap = await _showAlertDialog(context);
              //     if (shouldSnap) {
              //       _snapWidgetsToGrid();
              //     }
              //   }
              // },
              ),
          Switch(
            value: globalValues.getIsEditAllowed(),
            onChanged: (value) async {
              setState(() {
                globalValues.setEditAllowed(value);
                // _widgets.forEach((widgetData) {
                //   widgetData.child.enabled = value;
                // });
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (globalValues.getShowGrid())
            CustomPaint(
              painter: GridPainter(),
              size: Size.infinite,
            ),
          ..._widgets.map((widgetData) => Positioned(
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
                    if (globalValues.getSnapToGrid()) _snapWidgetsToGrid();
                  },
                  child: widgetData.child,
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO make this appear in the center, slightly blurring screen
          showMenu<
                  Pair<StatefulWidget,
                      Pair<double, double>>> //somebody, please, kill me.
              (
            context: context,
            position: const RelativeRect.fromLTRB(100, 100, 100, 100),
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

                //!!
                newsummon(
                    _w,
                    value
                        .key); //I hate myself as much as you hate me reading this
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
          title: const Text('Snap to Grid'),
          content: const Text(
              'Some widgets might be not aligned to the grid. Do you want to snap them to the grid?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Yes'),
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
    int gridStep = globalValues.getGridStep();
    setState(() {
      _widgets = _widgets.map((widgetData) {
        Offset newPosition = Offset(
          (widgetData.offset.dx / gridStep).round() * gridStep * 1.0,
          (widgetData.offset.dy / gridStep).round() * gridStep * 1.0,
          //I hate you mutually
        );
        return WidgetData(child: widgetData.child, offset: newPosition);
      }).toList(); //TODO add resizing as well
    });
  }
}
