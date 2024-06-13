// /*
// <iframe width="560" height="315" src="https://www.youtube.com/embed/jfKfPfyJRdk?si=UZT-A4NoMQfmBApT&amp;controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
// * */
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class HtmlEmbedContainer extends StatefulWidget {
//   @override
//   _HtmlEmbedContainerState createState() => _HtmlEmbedContainerState();
// }
//
// class _HtmlEmbedContainerState extends State<HtmlEmbedContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 200,
//       child: WebView(
//         initialUrl: Uri.dataFromString(
//           '''
//           <html>
//             <body>
//               <h1>Hello World!</h1>
//               <p>This is an HTML embed.</p>
//               <iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>
//             </body>
//           </html>
//           ''',
//           mimeType: 'text/html',
//         ).toString(),
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
