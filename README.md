# gesture_automate

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## To run integration

Below command is used to run on chrome, if chromedriver is started on port 4444 using ```chromedriver --port=4444``` 
 
And finally use below command to run test ```flutter drive \                                           
  --driver=integration_test_driver/integration_test.dart \
  --target=integration_test/app_test.dart -d chrome```

## To run flutter_driver test

Use Blow command to run flutter driver test on active device.

```flutter driver --target=test_driver/e2e.dart ```

## Difference in approach

### Flutter Driver
1. Flutter driver only runs on targeted device and never can run on CI tools like Firebase Test Lab/CodeMagic.
2. Flutter_driver API not starightforward.
3. Appium Flutter driver is build on top of this.

### Integration Test
1. Integration test instruments the app which can be easily run on CI tools like Firebase Test Lab/CodeMagic.
2. Integration test API startightforward.
3. Flutter Driver tests are being deprecated in favor of new Integration Tests.
