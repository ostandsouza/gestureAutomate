import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gesture_automate/shared/Clipper.dart';

import 'model/ItemModel.dart';

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  List<ItemModel> data1;

  List<ItemModel> data;

  @override
  void initState(){
    super.initState();
    initRandom();
  }

  initRandom(){
      data = [
        ItemModel("Java","Java",FontAwesomeIcons.java),
        ItemModel("python","python",FontAwesomeIcons.python),
        ItemModel("php","php",FontAwesomeIcons.php),
        ItemModel("node","node",FontAwesomeIcons.nodeJs),
        ItemModel("reactjs","reactjs",FontAwesomeIcons.react)
      ];
      data1 = List<ItemModel>.from(data);
      data.shuffle();
      print(data);
      data1.shuffle();
      print(data);
  }

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
                                  color: Colors.white,
                                  onPressed:() => Navigator.pop(context, false),),
                              ),
                            ),
                            Padding(
                            padding: const EdgeInsets.fromLTRB(50,0.0,0,0.0),
                            child: Center(
                              child: Text("Drag n Drop", 
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
                child: Row(children: [
                Column(children: data.map((e){
                return Container(
                margin: const EdgeInsets.all(20.0),
                child: Draggable<ItemModel>(
                data: e,
                childWhenDragging: Icon(e.icon ,color: Colors.grey, size: 50,),
                feedback: Icon(e.icon ,color: Colors.red, size: 50,),
                child: Icon(e.icon ,color: Colors.red, size: 50,semanticLabel: 'i${e.value}',)),);
                  }).toList(),
                  ),
                Spacer(),
                 Column(children: data1.map((e){
                 return DragTarget<ItemModel>(
                     onAccept: (receivedItem){
                       if(e.value == receivedItem.value){
                         setState((){
                           data1.remove(receivedItem);
                           data.remove(e);
                         });
                       }
                     },
                     onWillAccept: (receivedItem)=>true,
                     builder: (context, acceptedItems, receivedItems)=>Container(
                     color: Colors.red,
                     height:50,
                     width:100,
                     alignment: Alignment.center,
                     margin:const EdgeInsets.all(20.0),
                     child: Text(e.name,style : TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                       )),
                 );
                }).toList(),
                ),
                  ],)
                  )
              ]
          
        ),
            ),
      ),
    );
  }
}