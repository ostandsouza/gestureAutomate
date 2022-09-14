import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const MyButton({Key key, @required this.text, @required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ButtonWidget(text: text, onClicked: onClicked);
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  ButtonWidget({Key key, @required this.text, @required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
          primary: Colors.white,
        ),
        label: Text(
          text,
          key: ValueKey('date_Key'),
          style: TextStyle(fontSize: 15, color: Colors.red.shade300),
        ),
        icon: Icon(
          Icons.date_range_rounded,
          color: Colors.red.shade300,
        ),
        onPressed: onClicked,
      );
}
