import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';

class Sliderbar extends StatefulWidget {
  @override
  _SliderbarState createState() => _SliderbarState();
}

class _SliderbarState extends State<Sliderbar> {
  int _value = 0;  
  
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
                              child: Text("Slider", 
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
                Center(  
                  child: Row(  
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                      mainAxisSize: MainAxisSize.max,  
                      children: [  
                        Icon(  
                          Icons.volume_up,  
                          size: 40, 
                          semanticLabel: 'volume', 
                        ),  
                        new Expanded(  
                            child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 15,
                              minThumbSeparation: 100,
                              rangeThumbShape: RoundRangeSliderThumbShape(
                                enabledThumbRadius:10,
                                disabledThumbRadius:10
                              )
                            ),
                            child: Slider.adaptive(  
                            value: _value.toDouble(),  
                            min: 0.0,  
                            max: 100.0,  
                            divisions: 10,  
                            activeColor: Colors.indigo,  
                            // inactiveColor: Colors.orange,  
                            label: _value.round().toString(),  
                            onChanged: (double newValue) {  
                              setState(() {  
                                _value = newValue.round();  
                                });  
                              },  
                            onChangeEnd:(double newValue){_showToast(context);},
                            ),
                            )  
                        ),
                      ])
                )  
              ]
          
        ),
            ),
      ),
    );
  }

   void _showToast(BuildContext context) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Slider moved Successful'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Success',
          onPressed: () { },
        ),
      ));
  }
}