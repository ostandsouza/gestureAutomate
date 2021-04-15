import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Zoom extends StatefulWidget {
  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  double _scale = 1.0;
  double _previousScale =1.0;

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
                          padding: const EdgeInsets.fromLTRB(50,0.0,50,0.0),
                          child: Center(
                            child: Text("Pinch Zoom", 
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
                height:MediaQuery.of(context).size.height/6,
              ),
              Center(
                child: GestureDetector(
                  onScaleStart: (ScaleStartDetails details){
                  _previousScale = _scale ;
                   setState((){});
                  },
                  onScaleUpdate: (ScaleUpdateDetails details){
                  _scale = _previousScale * details.scale ;
                   setState((){});
                  },
                  onScaleEnd: (ScaleEndDetails details){
                  if(_scale > _previousScale){
                    _showToast(context, "Zoom in was Successful");
                  }
                  else if(_scale < _previousScale){
                    _showToast(context, "Zoom out was Successful");
                  }
                  _previousScale = 1.0 ;
                  _scale =1.0;
                  setState((){});
                  },
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.diagonal3(Vector3(_scale,_scale,_scale)),
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/dogs.jpeg",),),
                    ),
                )
              )
            ]
          
        ),
      ),
    );
  }

   void _showToast(BuildContext context, String text) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Success',
          onPressed: () { },
        ),
      ));
  }
}