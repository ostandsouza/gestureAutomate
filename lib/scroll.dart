import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:gesture_automate/shared/CustomList.dart';

class Scroll extends StatelessWidget {
  
  final data = const[
    {
      "avatar" : "assets/Jane.jpeg",
      "name" : "Jane",
      "phone" : "5987461358"
    },
    {
      "avatar" : "assets/Roy.jpeg",
      "name" : "Roy",
      "phone" : "2314689798"
    },
    {
      "avatar" : "assets/samuel.jpeg",
      "name" : "Samuel",
      "phone" : "4678946569"
    },
    {
      "avatar" : "assets/mona.jpeg",
      "name" : "Mona",
      "phone" : "1546879498"
    },
    {
      "avatar" : "assets/walt.jpeg",
      "name" : "Walt",
      "phone" : "9989898989"
    },
    {
      "avatar" : "assets/lisa.jpeg",
      "name" : "lisa",
      "phone" : "9998754588"
    },
    {
      "avatar" : "assets/jessica.jpeg",
      "name" : "Jessica",
      "phone" : "9874561235"
    },
    {
      "avatar" : "assets/J.png",
      "name" : "Joythi",
      "phone" : "9986545791"
    },
    {
      "avatar" : "assets/G.png",
      "name" : "Gagan",
      "phone" : "7845961234"
    }
  ];

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
                            child: Text("Scroll", 
                            style:TextStyle(color: Colors.white, fontSize: 40,
                            ),),
                          ),
                        ),  
                          ]),
                    ),
                  
                  ]),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (context,index) => Divider(),
                  itemBuilder: (context,index){
                    final item = data[index];
                    return CustomTile(item["name"],item["phone"],item["avatar"]);
                  }
                ),
              )
            ]
        ),
      ),
    );
  }
}