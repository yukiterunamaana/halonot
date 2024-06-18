// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
//
// class Notepad extends StatefulWidget {
//   @override
//   _NotepadState createState() => _NotepadState();
// }
//
// class _NotepadState extends State<Notepad> {
//   final QuillController _controller = QuillController.basic();
//   final TextStyle _defaultStyle = TextStyle(fontSize: 18, color: Colors.black);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notepad'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.format_size),
//             onPressed: _showFontSizeDialog,
//           ),
//           IconButton(
//             icon: Icon(Icons.font_download),
//             onPressed: _showFontFamilyDialog,
//           ),
//           IconButton(
//             icon: Icon(Icons.color_lens),
//             onPressed: _showColorDialog,
//           ),
//         ],
//       ),
//       body: QuillEditor(
//         controller: _controller,
//         readOnly: false,
//         expands: true,
//         padding: EdgeInsets.all(16),
//         autoFocus: true,
//         scrollController: ScrollController(),
//         scrollable: true,
//         focusNode: FocusNode(),
//       ),
//     );
//   }
//
//   void _showFontSizeDialog() async {
//     final fontSize = await showDialog<double>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Font Size'),
//           content: Slider(
//             value: _defaultStyle.fontSize?? 18,
//             min: 12,
//             max: 36,
//             divisions: 6,
//             label: '${_defaultStyle.fontSize?.round()}',
//             onChanged: (value) {
//               setState(() {
//                 _defaultStyle = _defaultStyle.copyWith(fontSize: value);
//               });
//             },
//           ),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop(_defaultStyle.fontSize);
//               },
//             ),
//           ],
//         );
//       },
//     );
//     if (fontSize!= null) {
//       _controller.formatText(
//         0,
//         _controller.document.length,
//         TextStyle(fontSize: fontSize),
//       );
//     }
//   }
//
//   void _showFontFamilyDialog() async {
//     final fontFamily = await showDialog<String>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Font Family'),
//           content: DropdownButton<String>(
//             value: _defaultStyle.fontFamily,
//             onChanged: (value) {
//               setState(() {
//                 _defaultStyle = _defaultStyle.copyWith(fontFamily: value);
//               });
//             },
//             items: [
//               'OpenSans',
//               'Montserrat',
//               'Lato',
//               'Merriweather',
//               'Pacifico',
//             ].map((fontFamily) {
//               return DropdownMenuItem<String>(
//                 value: fontFamily,
//                 child: Text(fontFamily),
//               );
//             }).toList(),
//           ),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop(_defaultStyle.fontFamily);
//               },
//             ),
//           ],
//         );
//       },
//     );
//     if (fontFamily!= null) {
//       _controller.formatText(
//         0,
//         _controller.document.length,
//         TextStyle(fontFamily: fontFamily),
//       );
//     }
//   }
//
//   void _showColorDialog() async {
//     final color = await showDialog<Color>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Text Color'),
//           content: BlockPicker(
//             pickerColor: _defaultStyle.color,
//             onColorChanged: (color) {
//               setState(() {
//                 _defaultStyle = _defaultStyle.copyWith(color: color);
//               });
//             },
//           ),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop(_defaultStyle.color);
//               },
//             ),
//           ],
//         );
//       },
//     );
//     if (color!= null) {
//       _controller.formatText(
//         0,
//         _controller.document.length,
//         TextStyle(color: color),
//       );
//     }
//   }
// }