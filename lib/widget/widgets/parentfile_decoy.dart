import 'package:flutter/material.dart';

class TextWithCorners extends StatefulWidget {
  const TextWithCorners({super.key});

  @override
  State<TextWithCorners> createState() => _TextWithCornersState();
}

class _TextWithCornersState extends State<TextWithCorners> {
  final double circleDiameter = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
        color: Colors.yellow[100],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Center(
            child: Text(
              'Sample Text',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Positioned(
            top: -(circleDiameter / 2),
            right: -(circleDiameter / 2),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  debugPrint('Delete button pressed');
                },
              ),
            ),
          ),
          Positioned(
            bottom: -(circleDiameter / 2),
            right: -(circleDiameter / 2),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: Icon(Icons.drag_indicator_rounded),
                onPressed: () {
                  debugPrint('Resize button pressed');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
