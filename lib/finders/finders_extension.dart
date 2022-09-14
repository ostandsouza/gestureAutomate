import 'dart:io';

import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart'
    show SerializableFinder, Command, Tap, Result;
import 'finders.dart';

class FloatingActionButtonFinderExtension extends FinderExtension {
  String get finderType => 'FloatingActionButtonFinder';

  SerializableFinder deserialize(
      Map<String, String> params, DeserializeFinderFactory finderFactory) {
    return FloatingActionButtonFinder();
  }

  Finder createFinder(
      SerializableFinder finder, CreateFinderFactory finderFactory) {
    return find.byElementPredicate((Element element) {
      if (element.widget is ElevatedButton) {
        return true;
      }
      return false;
    });
  }
}

class FloatingActionButtonCommandExtension extends CommandExtension {
  @override
  String get commandKind => 'FloatingActionButtonCommand';

  @override
  Future<Result> call(
      Command command,
      WidgetController prober,
      CreateFinderFactory finderFactory,
      CommandHandlerFactory handlerFactory) async {
    final FloatingActionButtonCommand someCommand = command;

    final Finder finder = finderFactory.createFinder(someCommand.finder);
    await handlerFactory.waitForElement(finder);
    for (int index = 0; index < someCommand.times; index++) {
      await handlerFactory.handleCommand(
          Tap(someCommand.finder), prober, finderFactory);
    }

    return FloatingActionButtonCommandResult(
        'Tapped ${someCommand.times} times');
  }

  @override
  Command deserialize(
      Map<String, String> params,
      DeserializeFinderFactory finderFactory,
      DeserializeCommandFactory commandFactory) {
    return FloatingActionButtonCommand.deserialize(params, finderFactory);
  }
}


// class TimerCommandExtension extends CommandExtension {
//   @override
//   String get commandKind => 'timerCommand';

//   @override
//   Future<Result> call(
//       Command command,
//       WidgetController prober,
//       CreateFinderFactory finderFactory,
//       CommandHandlerFactory handlerFactory) async {
//     final FloatingActionButtonCommand someCommand = command;

//     final Finder finder = finderFactory.createFinder(someCommand.finder);
//     await handlerFactory.waitForElement(finder).timeout(command.timeout!,
//           onTimeout: () => throw ("Failed to find the time picker dialog"));
//       final hoursAngleDeg = command.hours * 360 / 12;
//       final minutesAngleDeg = command.minutes * 360 / 60;
//       final center = prober.getCenter(finder);
//       final topRight = prober.getTopRight(finder);
//       final radius = topRight.dx - center.dx;
//       final tapAtHours = Offset(
//           center.dx + radius * cos((hoursAngleDeg - 90) * pi / 180),
//           center.dy + radius * sin((hoursAngleDeg - 90) * pi / 180));
//       final tapAtMinutes = Offset(
//           center.dx + radius * cos((minutesAngleDeg - 90) * pi / 180),
//           center.dy + radius * sin((minutesAngleDeg - 90) * pi / 180));
//       await prober.tapAt(tapAtHours);
//       await handlerFactory.waitForElement(finder).timeout(command.timeout!,
//           onTimeout: () =>
//               throw ("Failed to find the minutes time picker dialog"));
//       await prober.tapAt(tapAtMinutes);
//     }

//     return FloatingActionButtonCommandResult(
//         'Tapped ${someCommand.times} times');
//   }
  
//   @override
//   Command deserialize(Map<String, String> params, DeserializeFinderFactory finderFactory, DeserializeCommandFactory commandFactory) {
//     // TODO: implement deserialize
//     throw UnimplementedError();
//   }
  // }