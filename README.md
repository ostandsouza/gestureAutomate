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

## Code coverage

### Steps
- Add Jacoco Dependency in build.gradle file
- Add Jacoco plugin and enable testcoverage flag under builds in app/build.gradle file
- Finally create Jacoco Report generator task under app/build.gradle file
- Extend Main activity with Instrumented activity
- EndEmmaBroadcast to send kill app signal before generating coverage.ec
- JacocoInstrumentation class will help in creating coverage.ec file in phone memory
- Update AndroidManifest.xml inorder to instrument the app and to provide required user permission for the app.
- Set Java home under Gradle.properties to required version (-v11).
- Update gradle version under graddle-wrapper.properties.
- Build the apk version after instrumenting the app with above stpes.
- Install apk with desired permission using.
```adb install -g build/app/outputs/flutter-apk/app-debug.apk```
- Verify the installed app is properly instrumented. Use below command to list out instrumented app from the mobile phone.
```adb shell pm list instrumentation```
- Use below adb command to launch the app.
```db shell am instrument -e coverage true -w com.example.gesture_automate/.JacocoInstrumentation```
- Perform the manual or automated testing on the app.
- After performing all the tests, finally kill the app. Use can use below command to do so.
```adb shell am broadcast -a com.example.gesture_automate.EndEmmaBroadcast```
- Check if coverage.ec is getting generated and coped to phone memory successfuly using
```adb logcat |grep coverage```
- If not able to copy because of the restriction, go to settings -> apps ->fileand storage-> allow management of all files.
- Copy the coverage.ec file from phone memory to disk memory using below command.
```adb pull /sdcard/Download/coverage.ec ```
- Finally run gradle task jacocoRootReport to generate jacoco report under builds folder.
``` cd android && ./gradlew jacocoRootReport```


### Reference Links
- https://www.linkedin.com/pulse/android-app-code-coverage-manual-appium-automation-tests-suram
- https://medium.com/jamf-engineering/android-kotlin-code-coverage-with-jacoco-sonar-and-gradle-plugin-6-x-3933ed503a6e
