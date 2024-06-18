import 'package:flutter/material.dart';

class InteractiveBoard extends StatefulWidget {
  @override
  _InteractiveBoardState createState() => _InteractiveBoardState();
}

class _InteractiveBoardState extends State<InteractiveBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const GridPaper(
      interval: 25,
    ));
  }
}
