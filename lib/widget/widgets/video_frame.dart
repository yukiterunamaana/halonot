// import 'package:flutter/material.dart';
// import 'package:flutter_box_transform/flutter_box_transform.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Resizable Video Player Example'),
//         ),
//         body: Center(
//           child: ResizableVideoPlayer(),
//         ),
//       ),
//     );
//   }
// }

// class ResizableVideoPlayer extends StatefulWidget {
//   @override
//   _ResizableVideoPlayerState createState() => _ResizableVideoPlayerState();
// }

// class _ResizableVideoPlayerState extends State<ResizableVideoPlayer> {
//   Rect rect = Rect.fromCenter(
//     center: Offset(0, 0),
//     width: 400,
//     height: 300,
//   );
//   VideoPlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File('path_to_your_video_file'))
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TransformableBox(
//       rect: rect,
//       contentBuilder: (BuildContext context, Rect rect, Flip flip) {
//         return _controller!.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller!.value.aspectRatio,
//                 child: VideoPlayer(_controller!),
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               );
//       },
//       visibleHandles: {...HandlePosition.corners},
//       cornerHandleBuilder: (context, handle) => DefaultCornerHandle(
//         handle: handle,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.blue,
//             width: 2,
//           ),
//         ),
//       ),
//       onChanged: (result, event) {
//         setState(() {
//           rect = result.rect;
//         });
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }
// }
