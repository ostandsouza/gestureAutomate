import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';

class Tap extends StatefulWidget {
  @override
  _TapState createState() => _TapState();
}

class _TapState extends State<Tap> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
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
                                color: Colors.white,
                                onPressed:() => Navigator.pop(context, false),),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50,0.0,0,0.0),
                            child: Center(
                              child: Text("Tap", 
                              textAlign: TextAlign.center,
                              style:TextStyle(color: Colors.white, fontSize: 40,
                              ),),
                            ),
                          ),  
                          ]),
                    ),  
                  ]),
                ),
              ),
               Expanded(child: Semantics(
                          label: 'switch',
                          child: Transform.scale(
                          scale: 3,
                          child: CupertinoSwitch(
                          value: status,
                          onChanged: (value) {
                            print("VALUE : $value");
                            setState(() {
                              status = value;
                            });
                            _showToast(context);
                          }
                    ),
                 ),
               ))
            ]
          
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Tap Successful'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Success',
          onPressed: () { },
        ),
      ));
  }
}