import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gesture_automate/shared/Clipper.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    "assets/first.jpeg",
    "assets/second.jpeg",
    "assets/third.jpeg",
    "assets/fourth.jpeg",
    "assets/fifth.jpeg"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
                            "Carousel",
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
              height: MediaQuery.of(context).size.height / 12,
            ),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  CarouselSlider(
                    key: ValueKey('carouselList'),
                    options: CarouselOptions(
                      height: 400.0,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      reverse: false,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                              child: Image.asset(
                                imgUrl,
                                semanticLabel: '${imgUrl}',
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Semantics(
                    label: 'highlight',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(imgList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Colors.redAccent
                                : Colors.green,
                          ),
                        );
                      }),
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}
