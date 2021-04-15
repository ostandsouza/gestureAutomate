import 'package:flutter/material.dart';
import 'package:gesture_automate/carousel.dart';
import 'package:gesture_automate/doubletap.dart';
import 'package:gesture_automate/drag.dart';
import 'package:gesture_automate/longpress.dart';
import 'package:gesture_automate/scroll.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:gesture_automate/singlecell.dart';
import 'package:gesture_automate/slider.dart';
import 'package:gesture_automate/swipe.dart';
import 'package:gesture_automate/tap.dart';
import 'package:gesture_automate/wheelpicker.dart';
import 'package:gesture_automate/zoom.dart';

class Landing extends StatelessWidget {
  final data = const [
    {
      "text" : "Tap",
      "image" : "assets/tap.png",
    },
    {
      "text" : "DoubleTap",
      "image" : "assets/doubletap.png",
    },
    {
      "text" : "Vertical Swipe",
      "image" : "assets/verticalswipe.png",
    },
    {
      "text" : "Swipe Left",
      "image" : "assets/swipe.jpeg",
    },
    {
      "text" : "Long Press",
      "image" : "assets/longpress.png",
    },
    {
      "text" : "Slider",
      "image" : "assets/slider.png",
    },
    {
      "text" : "Pinch Zoom",
      "image" : "assets/zoom.png",
    },
    {
      "text" : "Carousel",
      "image" : "assets/carousel.png",
    },
    {
      "text" : "Picker Wheel",
      "image" : "assets/no_image.png",
    },  
    {
      "text" : "Drag n Drop",
      "image" : "assets/Drag-drop-icon.jpeg",
    },
    {
      "text" : "",
      "image" : "",
    },
    {
      "text" : "",
      "image" : "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // body: Stack(
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
                    Center(
                      child: Text("Gestures", 
                      style:TextStyle(color: Colors.white, fontSize: 40,
                      ),),
                      ),  
                    ]),
                  ),
                ),
                Container(
                   height: MediaQuery.of(context).size.height/1.1,
                    child: GridView.count(
                      scrollDirection: Axis.vertical, 
                      crossAxisCount: 2 ,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      children: data.map((val){
                        return GestureDetector(
                            child: GridTile(
                            // width: double.infinity,
                            // height: double.infinity,
                            child: SingleCell(val["text"],val["image"])
                          ),
                          onTap: (){
                            cellClick(context,val["text"]);
                          },
                        );
                      
                      }).toList(),
                    ),
                )
              ],
            )
            ))
      );
    }

    cellClick(BuildContext ctx,String text){
      if(text.startsWith("Tap"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Tap()));
      else if(text.contains("DoubleTap"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Doubletap()));
      else if(text.contains("Slider"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Sliderbar()));
      else if(text.contains("Vertical Swipe"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Scroll()));
      else if(text.contains("Drag n Drop"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Drag()));
      else if(text.contains("Long Press"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Longpress()));
      else if(text.contains("Pinch Zoom"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Zoom()));
      else if(text.contains("Carousel"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Carousel()));
      else if(text.contains("Picker Wheel"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Wheelpicker()));
      else if(text.contains("Swipe Left"))
        Navigator.push(ctx, MaterialPageRoute(builder: (context) => Swipe()));
    }
}