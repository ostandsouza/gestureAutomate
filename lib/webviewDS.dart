import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewD extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<WebviewD> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebView Ds"),
        ),
        body: WebView(
          key: _key,
          debuggingEnabled: false,
          initialUrl: "https://google.com",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewController) {
            _controller.complete(webviewController);
          },
        ));
  }
}
