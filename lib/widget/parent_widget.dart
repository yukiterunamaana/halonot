import 'package:flutter/material.dart';

class stubWidget extends StatelessWidget {
  const stubWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Widget',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  final Widget content;
  final int width;
  final int height;
  ParentWidget(this.content, {super.key, this.width = 100, this.height = 100});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width as double,
      height: widget.height as double,
      decoration: BoxDecoration(
        color: Colors
            .amber, //Colors.primaries[Random().nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.content,
    );
  }
}
