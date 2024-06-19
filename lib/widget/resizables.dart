import 'package:flutter/material.dart';

class ParentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ResizableParentWidget(
          child: Container(
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

class ResizableParentWidget extends StatefulWidget {
  final Widget child;
  final double gridSize;

  ResizableParentWidget({required this.child, this.gridSize = 1});

  @override
  _ResizableParentWidgetState createState() => _ResizableParentWidgetState();
}

class _ResizableParentWidgetState extends State<ResizableParentWidget> {
  Offset _offset = Offset.zero;
  Size _size = Size(100, 100);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _offset.dx,
          top: _offset.dy,
          child: GestureDetector(
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
              width: _size.width,
              height: _size.height,
              child: widget.child,
            ),
          ),
        ),
        _buildResizeHandles(),
      ],
    );
  }

  Widget _buildResizeHandles() {
    return Stack(
      children: [
        Positioned(
          top: _offset.dy + _size.height,
          left: _offset.dx + _size.width,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (widget.gridSize != null) {
                _size += details.delta;
                _size = Size(
                  (_size.width / widget.gridSize).round() * widget.gridSize,
                  (_size.height / widget.gridSize).round() * widget.gridSize,
                );
              } else {
                _size += details.delta;
              }
              setState(() {});
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: _offset.dy,
          left: _offset.dx + _size.width,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (widget.gridSize != null) {
                _size = Size(
                  (_size.width + details.delta.dx / widget.gridSize).round() *
                      widget.gridSize,
                  _size.height,
                );
                _offset = Offset(
                  (_offset.dx + details.delta.dx / widget.gridSize).round() *
                      widget.gridSize,
                  _offset.dy,
                );
              } else {
                _size = Size(_size.width + details.delta.dx, _size.height);
                _offset += Offset(details.delta.dx, 0);
              }
              setState(() {});
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: _offset.dy + _size.height,
          left: _offset.dx,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (widget.gridSize != null) {
                _size = Size(
                  _size.width,
                  (_size.height + details.delta.dy / widget.gridSize).round() *
                      widget.gridSize,
                );
                _offset = Offset(
                  _offset.dx,
                  (_offset.dy + details.delta.dy / widget.gridSize).round() *
                      widget.gridSize,
                );
              } else {
                _size = Size(_size.width, _size.height + details.delta.dy);
                _offset += Offset(0, details.delta.dy);
              }
              setState(() {});
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: _offset.dy,
          left: _offset.dx,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (widget.gridSize != null) {
                _size = Size(
                  (_size.width - details.delta.dx / widget.gridSize).round() *
                      widget.gridSize,
                  _size.height,
                );
                _offset = Offset(
                  (_offset.dx - details.delta.dx / widget.gridSize).round() *
                      widget.gridSize,
                  _offset.dy,
                );
              } else {
                _size = Size(_size.width - details.delta.dx, _size.height);
                _offset += Offset(-details.delta.dx, 0);
              }
              setState(() {});
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: _offset.dy + _size.height,
          left: _offset.dx,
          child: GestureDetector(
            onPanUpdate: (details) {
              if (widget.gridSize != null) {
                _size = Size(
                  _size.width,
                  (_size.height - details.delta.dy / widget.gridSize).round() *
                      widget.gridSize,
                );
                _offset = Offset(
                  _offset.dx,
                  (_offset.dy - details.delta.dy / widget.gridSize).round() *
                      widget.gridSize,
                );
              } else {
                _size = Size(_size.width, _size.height - details.delta.dy);
                _offset += Offset(0, -details.delta.dy);
              }
              setState(() {});
            },
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
