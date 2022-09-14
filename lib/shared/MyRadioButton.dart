import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

enum GenderEnum { Male, Female }

class MyRadioButton extends StatelessWidget {
  String title;
  String keyText;
  GenderEnum value;
  GenderEnum selectedGenderType;
  Function(GenderEnum) onChanged;

  MyRadioButton(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.keyText,
      @required this.selectedGenderType,
      @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<GenderEnum>(
      key: ValueKey(keyText),
      title: Text(title),
      value: value,
      groupValue: selectedGenderType,
      contentPadding: EdgeInsets.all(0.0),
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      tileColor: Colors.red.shade50,
      onChanged: onChanged,
      activeColor: Colors.red.shade300,
    ));
  }
}
