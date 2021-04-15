import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:gesture_automate/shared/CustomList.dart';
import 'package:gesture_automate/shared/Dismissable.dart';

class Swipe extends StatefulWidget {
  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  final data = [
    {
      "avatar" : "assets/lisa.jpeg",
      "name" : "Lisa",
      "message" : "Hey, can you help me?"
    },
    {
      "avatar" : "assets/G.png",
      "name" : "Gagan",
      "message" : "Let\' go for a run."
    },
    {
      "avatar" : "assets/samuel.jpeg",
      "name" : "Samuel",
      "message" : "Wassup Bro!"
    },
    {
      "avatar" : "assets/jessica.jpeg",
      "name" : "Jessica",
      "message" : "Busy!! Call me later"
    },
    {
      "avatar" : "assets/Roy.jpeg",
      "name" : "Roy",
      "message" : "Hello there"
    },
    {
      "avatar" : "assets/Jane.jpeg",
      "name" : "Jane",
      "message" : "are you up for a coffee?"
    },
    {
      "avatar" : "assets/mona.jpeg",
      "name" : "Mona",
      "message" : "omg, thats funny"
    },
    {
      "avatar" : "assets/J.png",
      "name" : "Joythi",
      "message" : "Alright! next time"
    },
    {
      "avatar" : "assets/walt.jpeg",
      "name" : "Walt",
      "message" : "bye bro.. Gn"
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
                            child: Text("Swipe", 
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
                    print("data ${data.length}");
                    final item = data[index];
                    return DismissableWidget(
                      item: data, 
                      index: index,
                      child: CustomTile(item["name"],item["message"],item["avatar"]),
                      onDismissed: (direction) => dismissItem(context,index,direction));
                  }
                ),
              )
            ]
        ),
      ),
    );
  }

  void dismissItem(BuildContext ctx, int index, DismissDirection direction){
    setState((){
      data.removeAt(index);
    });

    switch(direction){
      
      case DismissDirection.endToStart:
          ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          content: const Text('Chat deleted Successful'),
          duration: const Duration(seconds: 1),
          action: SnackBarAction(
            label: 'Success',
            onPressed: () { },
          ),
        ));
        break;
      default:
        break;
    }

  }
}