// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class ResponsiveHtmlEmbed extends StatefulWidget {
//   final String htmlContent;
//
//   const ResponsiveHtmlEmbed({Key? key, required this.htmlContent})
//       : super(key: key);
//
//   @override
//   _ResponsiveHtmlEmbedState createState() => _ResponsiveHtmlEmbedState();
// }
//
// class _ResponsiveHtmlEmbedState extends State<ResponsiveHtmlEmbed> {
//   late WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: WebViewWidget(
//         onWebViewCreated: (controller) {
//           _webViewController = controller;
//           _webViewController.loadHtmlString(widget.htmlContent);
//         },
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }