import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:gesture_automate/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end to end test for training app", () {
    testWidgets('Test tap action', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(ValueKey('Tap_Key')), findsOneWidget);

      await tester.tap(find.byKey(ValueKey('Tap_Key')));
      await tester.pumpAndSettle();

      final Finder toggle = find.byKey(ValueKey('toggle'));

      await tester.tap(toggle);
      await tester.pumpAndSettle();

      expect(find.text('Tap Successful'), findsOneWidget);
    });
  });
}
