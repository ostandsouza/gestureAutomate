import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';

class Doubletap extends StatelessWidget {
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
                            padding: const EdgeInsets.fromLTRB(50,0.0,0,0.0),
                            child: Center(
                              child: Text("Double Tap", 
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
                        height:MediaQuery.of(context).size.height/4,
                ),
                Semantics(
                  label: 'double',
                      child: Transform.scale(
                          scale: 2,
                          child: GestureDetector(
                            child: ElevatedButton.icon(
                              label: Text('Double Tap Me'),
                              icon: Icon(Icons.notifications_rounded),
                              style: ButtonStyle( backgroundColor: MaterialStateProperty.all(ThemeData.dark().errorColor),),
                              onPressed: () {
                                print("VALUE : ");
                              }
                            ),
                            onDoubleTap:() {
                                print("VALUE : 123");
                                _showToast(context);
                              }
                        ),
                      ),
                )
              ]
          
        ),
            ),
      ),
    );
  }

   void _showToast(BuildContext context) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('DoubleTap Successful'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Success',
          onPressed: () { },
        ),
      ));
  }
}