import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:gesture_automate/finders/finders.dart';
import 'package:test/test.dart' as finder;

void main() {
  finder.group("Tap test", () {
    final tapButton = find.byValueKey("Tap_Key");
    final toggle = find.byValueKey("toggle");
    final toast = find.text("Tap Successful");

    final doubleTap = find.byValueKey("DoubleTap_Key");
    final doubleButton = find.text("Double Tap Me");
    final doubleToast = find.text("DoubleTap Successful");

    FlutterDriver driver;

    finder.setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    finder.tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    finder.tearDown(() async {
      await driver.tap(find.byTooltip('Back'));
    });

    finder.test('Verify Tap action', () async {
      await driver.tap(tapButton);

      await driver.tap(toggle);

      finder.expect(await driver.getText(toast), "Tap Successful");
    });

    finder.test('Verify DoubleTap action', () async {
      await driver.tap(doubleTap);
      sleep(Duration(seconds: 2));
      for (int i = 0; i < 2; i++) await driver.tap(doubleButton);
      // await driver.sendCommand(FloatingActionButtonCommand(
      //     FloatingActionButtonFinder(), 4,
      //     timeout: Duration(seconds: 5)));

      finder.expect(await driver.getText(doubleToast), "DoubleTap Successful");
    });
  });
}
