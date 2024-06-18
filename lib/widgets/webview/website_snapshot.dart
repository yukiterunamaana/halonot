import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveSnapshot extends StatefulWidget {
  @override
  _LiveSnapshotState createState() => _LiveSnapshotState();
}

class _LiveSnapshotState extends State<LiveSnapshot> {
  final WebViewController _webViewController = WebViewController();

  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Snapshot'),
      ),
      body: RepaintBoundary(
        child: WebViewWidget( // Replace with the website you want to snapshot
          controller: _webViewController,
        ),
      ),
    );
  }
}