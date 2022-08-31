import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DismissableWidget<T> extends StatelessWidget {
  final item;
  final int index;
  final Widget child;
  final DismissDirectionCallback onDismissed;


  DismissableWidget({
    @required this.item,
    @required this.index,
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(item[index]),
      background: buildSwipeRight(),
      child: child,
      onDismissed: onDismissed,
    );
  }

  Widget buildSwipeRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        color: Colors.red,
        child: Icon(FontAwesomeIcons.trashAlt, color: Colors.white, size: 32),
      );
}
