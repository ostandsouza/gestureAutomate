import 'package:flutter_driver/driver_extension.dart';
import 'package:gesture_automate/finders/finders_extension.dart';
import 'package:gesture_automate/main.dart' as app;

void main() {
  enableFlutterDriverExtension(
      commands: [FloatingActionButtonCommandExtension()],
      finders: [FloatingActionButtonFinderExtension()]);
  app.main();
}