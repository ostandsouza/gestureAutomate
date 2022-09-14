import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Submission extends StatelessWidget {
  const Submission({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Submit'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          key: ValueKey('success_Key'),
          child: Text('Submit Successful',
              style: TextStyle(color: Colors.red.shade300, fontSize: 25)),
        ));
  }
}
