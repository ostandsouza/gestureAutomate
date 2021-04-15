import 'package:flutter/material.dart';

class SingleCell extends StatelessWidget {
final String title;
final String imageurl;

SingleCell(this.title,this.imageurl);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          alignment:Alignment.center,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(imageurl,
                width:100,
                height: 100,
                )
              )),
              Padding(
                padding:EdgeInsets.all(10.0),
                child: Text(
                  title,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  )
                ),
              )
            ],
          )
        )
    ));
  }
}