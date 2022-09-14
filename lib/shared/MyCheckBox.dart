import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatelessWidget {
  bool checkBoxValue;
  Function(bool val) onChanged;
  String keyText;

  MyCheckBox({Key key, this.checkBoxValue, this.onChanged, this.keyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.red.shade50,
              ),
              // child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [R
              child: CheckboxListTile(
                  key: ValueKey(keyText),
                  checkColor: Colors.white,
                  activeColor: Colors.red,
                  tristate: false,
                  value: checkBoxValue,
                  title: Text("Terms & Conditions"),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: onChanged)
              //   ],
              // )),
              ),
        ));
  }
}
