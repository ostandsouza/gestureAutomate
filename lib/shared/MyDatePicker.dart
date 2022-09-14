import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/MyButton.dart';

class MyDatePicker extends StatefulWidget {
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime date;

  String getText() {
    if (date == null) {
      return 'Select D.O.B';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => MyButton(
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final finalDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1));

    if (finalDate == null) return;

    setState(() {
      date = finalDate;
    });
  }
}
