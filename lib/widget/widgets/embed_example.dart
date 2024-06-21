import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:html';
import 'dart:ui' as ui;

class EmbedCodeWidget extends StatefulWidget {
  @override
  _EmbedCodeWidgetState createState() => _EmbedCodeWidgetState();
}

class _EmbedCodeWidgetState extends State<EmbedCodeWidget> {
  final _formKey = GlobalKey<FormState>();
  final _embedCodeController = TextEditingController();
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Paste Embed Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _embedCodeController,
                decoration: InputDecoration(
                  labelText: 'Paste embed code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please paste an embed code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _loadEmbedCode(_embedCodeController.text);
                  }
                },
                child: Text('Load Embed Code'),
              ),
              SizedBox(height: 20),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: _height + (_height == 0 ? 0 : 50),
                child: _height > 0
                    ? InAppWebView(
                        initialData: InAppWebViewInitialData(
                            data: _embedCodeController.text),
                        initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            supportZoom: false,
                            javaScriptEnabled: true,
                            disableHorizontalScroll: false,
                            disableVerticalScroll: true,
                          ),
                        ),
                        onLoadError: (controller, url, code, message) =>
                            print("onLoadError: $url, $code, $message"),
                        onLoadHttpError:
                            (controller, url, statusCode, description) => print(
                                "onLoadHttpError: $url, $statusCode, $description"),
                        onConsoleMessage: (controller, consoleMessage) {
                          print('height: ${consoleMessage.message}');
                          setState(() {
                            _height = double.parse(consoleMessage.message);
                          });
                        },
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _loadEmbedCode(String embedCode) {
    setState(() {
      _height = 0;
    });
  }
}

class IframeScreen extends StatefulWidget {
  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.height = '80%';
    _iFrameElement.style.width = '80%';
    _iFrameElement.src = 'https://flutter.dev/';
    _iFrameElement.style.border = 'none';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _iframeWidget,
          )
        ],
      ),
    );
  }
}
