import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';

class Alarm extends StatefulWidget {
  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _picked;

  Future<Null> selectTime(BuildContext ctx) async {
    _picked = await showTimePicker(context: ctx, initialTime: _time);

    if (_picked == null) return;

    setState(() {
      _time = _picked;
    });
  }

  String getText() {
    if (_time == null) {
      return 'Select Time';
    } else {
      final hrs = _time.hour.toString().padLeft(2, '0');
      final mins = _time.minute.toString().padLeft(2, '0');
      final period = _time.period.toString().split('.')[1].toUpperCase();

      return '$hrs:$mins ${period}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          ClipPath(
            clipper: PathClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF54B64),
                    Color(0xFFF78361),
                  ],
                  stops: [0.25, 0.75],
                ),
              ),
              child: Column(children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Container(
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          tooltip: 'Back',
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0.0, 0, 0.0),
                      child: Center(
                        child: Text(
                          "Timer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(getText(),
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                key: ValueKey('clock_Key')),
          ),
          Semantics(
            label: 'clock',
            child: IconButton(
              icon: Icon(Icons.alarm),
              iconSize: 200,
              onPressed: () {
                selectTime(context);
              },
            ),
          )
        ]),
      ),
    );
  }
}
