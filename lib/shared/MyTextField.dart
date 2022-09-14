import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  final String fieldName;
  final String validatorText;
    final String keytext;
  final IconData myIcon;
  final Color prefixIconColor;

  const MyTextField({
    Key key,
    @required this.fieldName,
    @required this.myController,
    @required this.validatorText,
    @required this.keytext,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(keytext),
      style: TextStyle(fontFamily: "OpenSans"),
      keyboardType: TextInputType.text,
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade300),
          ),
          labelStyle: TextStyle(color: Colors.red)),
      validator: (val) =>
          val == null || val.isEmpty ?? true ? validatorText : null,
    );
  }
}
