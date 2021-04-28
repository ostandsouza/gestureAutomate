import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hybrid"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: WebView(
        key: _key,
        debuggingEnabled: true,
        initialUrl: "https://www.iplt20.com",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webviewController) {
          _controller.complete(webviewController);
        },
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                  child: Icon(Icons.navigation),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    controller.data.loadUrl(
                        "https://www.hotstar.com/in/sports/cricket/tournament/vivo-indian-premier-league-2021-248");
                  });
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_left),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_right), label: ""),
        ],
      ),
    );
  }

  void _onTapped(int selectedIndex) {
    if (selectedIndex == 0) {
      _controller.future
          .then((value) async => {if (await value.canGoBack()) value.goBack()});
    } else if (selectedIndex == 1) {
      _controller.future.then((value) async => value.reload());
    } else {
      _controller.future.then(
          (value) async => {if (await value.canGoForward()) value.goForward()});
    }
  }
}
