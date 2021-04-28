import 'package:flutter/material.dart';
import 'package:gesture_automate/carousel.dart';
import 'package:gesture_automate/doubletap.dart';
import 'package:gesture_automate/drag.dart';
import 'package:gesture_automate/longpress.dart';
import 'package:gesture_automate/scroll.dart';
import 'package:gesture_automate/slider.dart';
import 'package:gesture_automate/swipe.dart';
import 'package:gesture_automate/tap.dart';
import 'package:gesture_automate/webview.dart';
import 'package:gesture_automate/webviewDS.dart';
import 'package:gesture_automate/webviewEN.dart';
import 'package:gesture_automate/wheelpicker.dart';
import 'package:gesture_automate/zoom.dart';

import '../landing.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Landing(),
        );
      case '/tap':
        return MaterialPageRoute(
          builder: (context) => Tap(),
        );
      case '/doubletap':
        return MaterialPageRoute(
          builder: (context) => Doubletap(),
        );
      case '/slider':
        return MaterialPageRoute(
          builder: (context) => Sliderbar(),
        );
      case '/scroll':
        return MaterialPageRoute(
          builder: (context) => Scroll(),
        );
      case '/drag':
        return MaterialPageRoute(
          builder: (context) => Drag(),
        );
      case '/longpress':
        return MaterialPageRoute(
          builder: (context) => Longpress(),
        );
      case '/zoom':
        return MaterialPageRoute(
          builder: (context) => Zoom(),
        );
      case '/carousel':
        return MaterialPageRoute(
          builder: (context) => Carousel(),
        );
      case '/wheelpicker':
        return MaterialPageRoute(
          builder: (context) => Wheelpicker(),
        );
      case '/swipe':
        return MaterialPageRoute(
          builder: (context) => Swipe(),
        );
      case '/nodebug':
        return MaterialPageRoute(
          builder: (context) => WebviewD(),
        );
      case '/debug':
        return MaterialPageRoute(
          builder: (context) => WebviewE(),
        );
      case '/hybrid':
        return MaterialPageRoute(
          builder: (context) => Webview(),
        );
      default:
        return _errorRoute();
    }
  }
}

Route _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}
