// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:markdown/markdown.dart' as md;

// // // class MarkdownNotepad extends StatefulWidget {
// // //   @override
// // //   _MarkdownNotepadState createState() => _MarkdownNotepadState();
// // // }

// // // class _MarkdownNotepadState extends State<MarkdownNotepad> {
// // //   bool _isEditing = false;
// // //   String _markdownText = '';

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       children: [
// // //         Expanded(
// // //           child: GestureDetector(
// // //             onTap: () {
// // //               setState(() {
// // //                 _isEditing = true;
// // //               });
// // //             },
// // //             child: _isEditing
// // //                 ? TextField(
// // //                     maxLines: null,
// // //                     keyboardType: TextInputType.multiline,
// // //                     onChanged: (value) {
// // //                       setState(() {
// // //                         _markdownText = value;
// // //                       });
// // //                     },
// // //                     controller: TextEditingController(text: _markdownText),
// // //                     decoration: InputDecoration.collapsed(hintText: ''),
// // //                   )
// // //                 : Padding(
// // //                     padding: const EdgeInsets.all(8.0),
// // //                     child: md.(
// // //                       data: _markdownText,
// // //                       selectable: true,
// // //                     ),
// // //                   ),
// // //           ),
// // //         ),
// // //         Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //           children: [
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 setState(() {
// // //                   _isEditing = false;
// // //                 });
// // //               },
// // //               child: Text('Preview'),
// // //             ),
// // //             ElevatedButton(
// // //               onPressed: () {
// // //                 setState(() {
// // //                   _isEditing = true;
// // //                 });
// // //               },
// // //               child: Text('Edit'),
// // //             ),
// // //           ],
// // //         ),
// // //         ElevatedButton(
// // //           onPressed: _markdownText.isNotEmpty
// // //               ? () {
// // //                   final now = DateTime.now();
// // //                   final file = File('${now.toString()}.md');
// // //                   file.writeAsString(_markdownText);
// // //                   ScaffoldMessenger.of(context).showSnackBar(
// // //                     SnackBar(
// // //                       content: Text('Markdown saved to ${file.path}'),
// // //                     ),
// // //                   );
// // //                 }
// // //               : null,
// // //           child: Text('Save'),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // // Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// // // for details. All rights reserved. Use of this source code is governed by a
// // // BSD-style license that can be found in the LICENSE file.

// // import 'dart:async';
// // import 'dart:js_interop';

// // import 'package:markdown/markdown.dart' as md;
// // import 'package:web/web.dart';

// // //import 'highlight.dart';

// // final markdownInput =
// //     document.querySelector('#markdown') as HTMLTextAreaElement;
// // final htmlDiv = document.querySelector('#html') as HTMLDivElement;
// // final versionSpan = document.querySelector('.version') as HTMLSpanElement;

// // //const typing = Duration(milliseconds: 150);
// // const introText = '''Markdown is the **best**!

// // * It has lists.
// // * It has [links](https://dart.dev).
// // * It has...
// //   ```dart
// //   void sourceCode() {}
// //   ```
// // * ...and _so much more_...''';

// // // // Flavor support.
// // // final basicRadio = document.querySelector('#basic-radio') as HTMLElement;
// // // final commonmarkRadio =
// // //     document.querySelector('#commonmark-radio') as HTMLElement;
// // final gfmRadio = document.querySelector('#gfm-radio') as HTMLElement;
// // md.ExtensionSet? extensionSet;

// // final extensionSets = {
// //   'basic-radio': md.ExtensionSet.none,
// //   'commonmark-radio': md.ExtensionSet.commonMark,
// //   'gfm-radio': md.ExtensionSet.gitHubWeb,
// // };

// // void main() {
// //   versionSpan.text = 'v${md.version}';
// //   markdownInput.onKeyUp.listen(_renderMarkdown);

// //   final savedMarkdown = window.localStorage['markdown'];

// //   if (savedMarkdown != null &&
// //       savedMarkdown.isNotEmpty &&
// //       savedMarkdown != introText) {
// //     markdownInput.value = savedMarkdown;
// //     markdownInput.focus();
// //     _renderMarkdown();
// //   }
// //   // else {
// //   //   _typeItOut(introText, 82);
// //   //}

// //   // GitHub is the default extension set.
// //   gfmRadio.attributes.getNamedItem('checked')?.value = '';
// //   gfmRadio.querySelector('.glyph')!.text = 'radio_button_checked';
// //   extensionSet = extensionSets[gfmRadio.id];
// //   _renderMarkdown();

// //   // basicRadio.onClick.listen(_switchFlavor);
// //   // commonmarkRadio.onClick.listen(_switchFlavor);
// //   gfmRadio.onClick.listen(_switchFlavor);
// // }

// // void _renderMarkdown([Event? event]) {
// //   final markdown = markdownInput.value;

// //   htmlDiv.innerHTML = md.markdownToHtml(markdown, extensionSet: extensionSet);

// //   for (final block in htmlDiv.querySelectorAll('pre code').items) {
// //     try {
// //       //highlightElement(block);
// //     } catch (e) {
// //       console.error('Error highlighting markdown:'.toJS);
// //       console.error(e.toString().toJS);
// //     }
// //   }

// //   if (event != null) {
// //     // Not simulated typing. Store it.
// //     window.localStorage['markdown'] = markdown;
// //   }
// // }

// // // void _typeItOut(String msg, int pos) {
// // //   late Timer timer;
// // //   markdownInput.onKeyUp.listen((_) {
// // //     timer.cancel();
// // //   });
// // //   void addCharacter() {
// // //     if (pos > msg.length) {
// // //       return;
// // //     }
// // //     markdownInput.value = msg.substring(0, pos);
// // //     markdownInput.focus();
// // //     _renderMarkdown();
// // //     pos++;
// // //     timer = Timer(typing, addCharacter);
// // //   }

// // //   timer = Timer(typing, addCharacter);
// // // }

// // void _switchFlavor(Event e) {
// //   final target = e.currentTarget as HTMLElement;
// //   if (target.attributes.getNamedItem('checked') == null) {
// //     // if (basicRadio != target) {
// //     //   basicRadio.attributes.safeRemove('checked');
// //     //   basicRadio.querySelector('.glyph')!.text = 'radio_button_unchecked';
// //     // }
// //     // if (commonmarkRadio != target) {
// //     //   commonmarkRadio.attributes.safeRemove('checked');
// //     //   commonmarkRadio.querySelector('.glyph')!.text = 'radio_button_unchecked';
// //     // }
// //     if (gfmRadio != target) {
// //       gfmRadio.attributes.safeRemove('checked');
// //       gfmRadio.querySelector('.glyph')!.text = 'radio_button_unchecked';
// //     }

// //     target.attributes.getNamedItem('checked')?.value = '';
// //     target.querySelector('.glyph')!.text = 'radio_button_checked';
// //     extensionSet = extensionSets[target.id];
// //     _renderMarkdown();
// //   }
// // }

// // extension on NodeList {
// //   List<Node> get items => [
// //         for (var i = 0; i < length; i++) item(i)!,
// //       ];
// // }

// // extension on NamedNodeMap {
// //   void safeRemove(String qualifiedName) {
// //     if (getNamedItem(qualifiedName) != null) removeNamedItem(qualifiedName);
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:markdown/markdown.dart' as md;

// class MarkdownNotepad extends StatefulWidget {
//   @override
//   _MarkdownNotepadState createState() => _MarkdownNotepadState();
// }

// class _MarkdownNotepadState extends State<MarkdownNotepad> {
//   final TextEditingController _controller = TextEditingController();
//   final md.ExtensionSet _extensionSet = md.ExtensionSet.gitHubWeb;

//   @override
//   void initState() {
//     super.initState();
//     _controller.text = '''Markdown is the **best**!

// * It has lists.

// * It has [links](https://dart.dev).

// * It has...

//   ```dart

//   void sourceCode() {}

//   ...and so much more...''';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _controller,
//                 maxLines: null,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Markdown',
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: MarkdownBody(
//                 data: _controller.text,
//                 extensionSet: _extensionSet,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownNotepad extends StatefulWidget {
  const MarkdownNotepad({super.key});

  @override
  _MarkdownNotepadState createState() => _MarkdownNotepadState();
}

class _MarkdownNotepadState extends State<MarkdownNotepad> {
  final TextEditingController _controller = TextEditingController();
  final md.ExtensionSet _extensionSet = md.ExtensionSet.gitHubWeb;
  bool _isEditMode = true;

  @override
  void initState() {
    super.initState();
    _controller.text = '''Markdown is the **best**!


* It has lists.

* It has [links](https://dart.dev).

* It has...

  ```dart

  void sourceCode() {}

 ...and so much more...''';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [Colors.black, Colors.black]),
            width: 4,
          ),
          //borderRadius: BorderRadius.circular(16),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Markdown Notepad'),
            actions: [
              Switch(
                value: _isEditMode,
                onChanged: (value) {
                  setState(() {
                    _isEditMode = value;
                  });
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Visibility(
                  visible: _isEditMode,
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Markdown',
                    ),
                  ),
                ),
                Visibility(
                  visible: !_isEditMode,
                  child: MarkdownBody(
                    data: _controller.text,
                    extensionSet: _extensionSet,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
