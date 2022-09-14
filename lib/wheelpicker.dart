import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';

class Wheelpicker extends StatefulWidget {
  @override
  _WheelpickerState createState() => _WheelpickerState();
}

class _WheelpickerState extends State<Wheelpicker> {
  DateTime datetime = DateTime.now();
  int selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ClipPath(
                  clipper: PathClipper(),
                  child: Container( 
                    height: MediaQuery.of(context).size.height/4,
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFF54B64),
                        Color(0xFFF78361),
                      ],
                      stops: [0.25 ,0.75],
                    ),
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height:MediaQuery.of(context).size.height/15,
                      ),
                      Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                             padding: const EdgeInsets.fromLTRB(0,0.0,0,0.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(icon: Icon(Icons.arrow_back), 
                                  tooltip: 'Back',
                                  color: Colors.white,
                                  onPressed:() => Navigator.pop(context, false),),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.fromLTRB(25,0.0,0,0.0),
                            child: Center(
                              child: Text("Wheel Picker", 
                              style:TextStyle(color: Colors.white, fontSize: 40,
                              ),),
                            ),
                          ),  
                            ]),
                      ),
                    
                    ]),
                  ),
                ),
                SizedBox(
                height:MediaQuery.of(context).size.height/15,
              ),
              Container(
                child: buildDatePicker(),
              )
              ]
          
        ),
            ),
      ),
    );
  }

  Widget buildDatePicker() {
  if (Platform.isIOS){ return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
      minimumYear: 2010,
      maximumYear: DateTime.now().year,
      initialDateTime: datetime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime) =>
       setState(() => this.datetime = datetime),
       ),
      );
    }
    else if(Platform.isAndroid){return SizedBox(
      height: 500,
      child: CupertinoPicker(
      itemExtent: 45,
      backgroundColor: Colors.white,
      onSelectedItemChanged: (int i) =>
       setState(() => this.selected = i),
      children: <Widget>[
          Text("Apple",style:TextStyle(color:selected ==0?Colors.blue:Colors.black)),
          Text("Facebook",style:TextStyle(color:selected ==1?Colors.blue:Colors.black)),
          Text("Amazon",style:TextStyle(color:selected ==2?Colors.blue:Colors.black)),
          Text("Google",style:TextStyle(color:selected ==3?Colors.blue:Colors.black)),
          Text("Microsoft",style:TextStyle(color:selected ==4?Colors.blue:Colors.black)),
      ],
       ),
    );
    }
  }
}