import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

const String vid =
    '<iframe width="560" height="315" src="https://www.youtube.com/embed/jfKfPfyJRdk?si=UZT-A4NoMQfmBApT&amp;controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>';

class HtmlEmbed extends StatefulWidget {
  final String htmlContent;

  HtmlEmbed({required this.htmlContent});

  @override
  _HtmlEmbedState createState() => _HtmlEmbedState();
}

class _HtmlEmbedState extends State<HtmlEmbed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HtmlWidget(widget.htmlContent),
    );
  }
}
