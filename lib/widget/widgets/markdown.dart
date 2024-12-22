import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownNotepad extends StatefulWidget {
  const MarkdownNotepad({super.key});

  @override
  _MarkdownNotepadState createState() => _MarkdownNotepadState();
}

class _MarkdownNotepadState extends State<MarkdownNotepad> {
  final TextEditingController _controller = TextEditingController();
  final md.ExtensionSet _extensionSet = md.ExtensionSet.gitHubWeb;
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Visibility(
              visible: _isEditMode,
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Visibility(
              visible: !_isEditMode,
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    _isEditMode = true;
                  });
                },
                child: MarkdownBody(
                  data: _controller.text,
                  extensionSet: _extensionSet,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isEditMode = !_isEditMode;
          });
        },
        child: Icon(_isEditMode ? Icons.preview : Icons.edit),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
