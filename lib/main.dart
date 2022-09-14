import 'package:flutter/material.dart';
import 'package:gesture_automate/finders/finders_extension.dart';
import 'package:gesture_automate/shared/AppRouter.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // enableFlutterDriverExtension(
  //     commands: [FloatingActionButtonCommandExtension()],
  //     finders: [FloatingActionButtonFinderExtension()]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFFF54B64),
          backgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
