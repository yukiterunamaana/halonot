import 'package:flutter/material.dart';
import 'window/window.dart';

void main() {
  runApp(MyApp());
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
