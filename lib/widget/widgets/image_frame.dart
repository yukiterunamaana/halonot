// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_box_transform/flutter_box_transform.dart';

// // // class ResizableImage extends StatefulWidget {
// // //   const ResizableImage({Key? key}) : super(key: key);

// // //   @override
// // //   _ResizableImageState createState() => _ResizableImageState();
// // // }

// // // class _ResizableImageState extends State<ResizableImage> {
// // //   Rect rect = Rect.zero;
// // //   ImageProvider? imageProvider;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return TransformableBox(
// // //       rect: rect,
// // //       contentBuilder: (BuildContext context, Rect rect, Flip flip) {
// // //         return imageProvider != null
// // //             ? Container(
// // //                 decoration: BoxDecoration(
// // //                   image: DecorationImage(
// // //                     image: imageProvider!,
// // //                     fit: BoxFit.cover,
// // //                   ),
// // //                 ),
// // //               )
// // //             : const Center(
// // //                 child: IconButton(
// // //                   icon: Icon(Icons.image),
// // //                   onPressed: null,
// // //                 ),
// // //               );
// // //       },
// // //       visibleHandles: {...HandlePosition.corners},
// // //       cornerHandleBuilder: (context, handle) => DefaultCornerHandle(
// // //         handle: handle,
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           border: Border.all(
// // //             color: Colors.blue,
// // //             width: 2,
// // //           ),
// // //         ),
// // //       ),
// // //       onChanged: (result, event) {
// // //         setState(() {
// // //           rect = result.rect;
// // //         });
// // //       },
// // //       dragWidgetsArea: const [
// // //         DragWidgetsArea(
// // //           widgets: [
// // //             WidgetsAreaItem(
// // //               key: Key('image_menu'),
// // //               builder: (context) => _buildImageMenu(),
// // //             ),
// // //           ],
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildImageMenu() {
// // //     return Container(
// // //       width: 200,
// // //       height: 150,
// // //       color: Colors.white,
// // //       child: Column(
// // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //         children: [
// // //           IconButton(
// // //             icon: const Icon(Icons.image),
// // //             onPressed: () async {
// // //               final imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
// // //               if (imageFile != null) {
// // //                 setState(() {
// // //                   imageProvider = FileImage(File(imageFile.path));
// // //                 });
// // //               }
// // //             },
// // //           ),
// // //           TextField(
// // //             onChanged: (value) async {
// // //               if (value.isNotEmpty) {
// // //                 final imageUrl = value.trim();
// // //                 final response = await http.get(Uri.parse(imageUrl));
// // //                 if (response.statusCode == 200) {
// // //                   setState(() {
// // //                     imageProvider = NetworkImage(imageUrl);
// // //                   });
// // //                 }
// // //               }
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';

// // // // class ImageWidget extends StatefulWidget {
// // // //   final String imageUrl;

// // // //   ImageWidget({required this.imageUrl});

// // // //   @override
// // // //   _ImageWidgetState createState() => _ImageWidgetState();
// // // // }

// // // // class _ImageWidgetState extends State<ImageWidget> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return SizedBox.expand(
// // // //       child: Image.network(
// // // //         widget.imageUrl,
// // // //         fit: BoxFit.cover,
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_box_transform/flutter_box_transform.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'dart:io';
// // import 'package:http/http.dart' as http;

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         body: Center(
// // //           child: ResizableImage(),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // class ResizableImage extends StatefulWidget {
// //   @override
// //   _ResizableImageState createState() => _ResizableImageState();
// // }

// // class _ResizableImageState extends State<ResizableImage> {
// //   Rect rect = Rect.fromCenter(
// //     center: Offset(0, 0),
// //     width: 200,
// //     height: 200,
// //   );
// //   ImageProvider? imageProvider;

// //   @override
// //   Widget build(BuildContext context) {
// //     return TransformableBox(
// //       rect: rect,
// //       contentBuilder: (BuildContext context, Rect rect, Flip flip) {
// //         return imageProvider != null
// //             ? Container(
// //                 decoration: BoxDecoration(
// //                   image: DecorationImage(
// //                     image: imageProvider!,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               )
// //             : Center(
// //                 child: IconButton(
// //                   icon: Icon(Icons.broken_image),
// //                   onPressed: () {
// //                     _showMenu(context);
// //                   },
// //                 ),
// //               );
// //       },
// //       visibleHandles: {...HandlePosition.corners},
// //       cornerHandleBuilder: (context, handle) => DefaultCornerHandle(
// //         handle: handle,
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           border: Border.all(
// //             color: Colors.blue,
// //             width: 2,
// //           ),
// //         ),
// //       ),
// //       onChanged: (result, event) {
// //         setState(() {
// //           rect = result.rect;
// //         });
// //       },
// //     );
// //   }

// //   void _showMenu(BuildContext context) async {
// //     await showMenu(
// //       context: context,
// //       position: RelativeRect.fromLTRB(100, 100, 100, 100),
// //       items: [
// //         PopupMenuItem(
// //           child: Text('Select Local File'),
// //           value: 'local',
// //         ),
// //         PopupMenuItem(
// //           child: Text('Paste Link'),
// //           value: 'link',
// //         ),
// //       ],
// //       elevation: 8.0,
// //     ).then((value) async {
// //       if (value == 'local') {
// //         final imageFile =
// //             await ImagePicker().pickImage(source: ImageSource.gallery);
// //         if (imageFile != null) {
// //           setState(() {
// //             imageProvider = FileImage(File(imageFile.path));
// //           });
// //         }
// //       } else if (value == 'link') {
// //         final link = await _showLinkDialog(context);
// //         if (link != null) {
// //           final response = await http.get(Uri.parse(link));
// //           if (response.statusCode == 200) {
// //             setState(() {
// //               imageProvider = NetworkImage(link);
// //             });
// //           }
// //         }
// //       }
// //     });
// //   }

// //   Future<String?> _showLinkDialog(BuildContext context) async {
// //     final controller = TextEditingController();
// //     return showDialog<String>(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Paste Link'),
// //           content: TextField(
// //             controller: controller,
// //             decoration: InputDecoration(
// //               labelText: 'Link',
// //               border: OutlineInputBorder(),
// //             ),
// //           ),
// //           actions: [
// //             TextButton(
// //               child: Text('Cancel'),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //             TextButton(
// //               child: Text('OK'),
// //               onPressed: () {
// //                 Navigator.of(context).pop(controller.text);
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_box_transform/flutter_box_transform.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:async/async.dart' as async;

// class ImageWidgetExample extends StatefulWidget {
//   @override
//   _ImageWidgetExampleState createState() => _ImageWidgetExampleState();
// }

// class _ImageWidgetExampleState extends State<ImageWidgetExample> {
//   late File _image;
//   late String _imageUrl;

//   // Future<void> _pickImage() async {
//   //   final picker = ImagePicker();
//   //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
//   //   setState(() {
//   //     if (pickedFile!= null) {
//   //       _image = File(pickedFile.path);
//   //       _imageUrl = null;
//   //     } else {
//   //       _image = null;
//   //     }
//   //   });
//   // }

//   Future<void> _selectImageFromGallery() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//         _imageUrl = null;
//       } else {
//         _image = null;
//       }
//     });
//   }

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Add Image"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: _selectImageFromGallery,
//                 child: Text('Select from gallery'),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Enter image URL',
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _imageUrl = value;
//                     _image = null;
//                   });
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Widget Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image != null
//                 ? TransformWidget(
//                     child: Image.file(_image),
//                     transform: BoxTransform(
//                       scale: 2.0,
//                       rotate: 45.0,
//                       translate: Offset(50.0, 50.0),
//                     ),
//                   )
//                 : _imageUrl != null
//                     ? TransformWidget(
//                         child: Image.network(_imageUrl),
//                         transform: BoxTransform(
//                           scale: 2.0,
//                           rotate: 45.0,
//                           translate: Offset(50.0, 50.0),
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: _showDialog,
//                         child: Text('Put an image here'),
//                       ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
