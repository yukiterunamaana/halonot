library halonot.globals;

import 'package:flutter/material.dart';

// Color gridColor = Colors.black;
// double gridWidth = 0.5;
// int gridStep = 50;

// bool _showGrid = true;
// bool _snapToGrid = true;
// bool _isEditAllowed = false;

class GlobalValues {
  GlobalValues._();

  static Color gridColor = Colors.black;
  static double gridWidth = 0.5;
  static int gridStep = 50;

  static bool _showGrid = true;
  static bool _snapToGrid = true;
  static bool _isEditAllowed = false;

  static GlobalValues _instance = GlobalValues._();

  factory GlobalValues() {
    //_instance ??= GlobalValues._();
    return _instance;
  }

  // void doSomething() {
  //   print('Doing something...');
  // }
  Color getGridColor() {
    return gridColor;
  }

  double getGridWidth() {
    return gridWidth;
  }

  int getGridStep() {
    return gridStep;
  }

  bool getShowGrid() {
    return _showGrid;
  }

  void setShowGrid(bool b) {
    _showGrid = b;
  }

  bool getSnapToGrid() {
    return _snapToGrid;
  }

  void setSnapToGrid(bool b) {
    _snapToGrid = b;
  }

  bool getIsEditAllowed() {
    return _isEditAllowed;
  }

  void setEditAllowed(bool b) {
    _isEditAllowed = b;
  }
}
