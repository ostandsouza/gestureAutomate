import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gesture_automate/shared/Clipper.dart';
import 'package:gesture_automate/singlecell.dart';

class Longpress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                            "Long Press",
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
              height: MediaQuery.of(context).size.height / 5,
            ),
            FocusedMenuHolder(
              menuOffset: 100,
              menuItemExtent: 70,
              menuWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {},
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                    title: Text(
                      "Close",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {},
                    trailingIcon: Icon(
                      FontAwesomeIcons.timesCircle,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.redAccent),
              ],
              child: Transform.scale(
                scale: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Flexible(
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          "assets/lisa.jpeg",
                                          semanticLabel: 'image',
                                          key: ValueKey('assetImg'),
                                          width: 100,
                                          height: 100,
                                        ))),
                              ]))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("Long Press on Image",
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  )),
            )
            // Transform.scale(
            //   scale: 2,
            //   child: GestureDetector(
            //     onLongPress: () {
            //       _showToast(context);
            //     },
            // child: SingleCell("Long press image", "assets/lisa.jpeg")))
          ]),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Long Press action Successful'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'Success',
        onPressed: () {},
      ),
    ));
  }
}
