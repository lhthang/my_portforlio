import 'package:flutter/material.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class NavigationBar extends StatefulWidget {
  final int index;

  final ScrollToId scrollToId;

  NavigationBar({Key key, @required this.index, @required this.scrollToId});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  var textStyle = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarTextStyle: TextStyle(color: Colors.white),
      backgroundColor: Colors.black87,
      elevation: 1,
      actions: [
        FlatButton(
          color: widget.index == 1 ? Colors.red : Colors.transparent,
          child: Text(
            "About",
            style: textStyle,
          ),
          onPressed: () {
            widget.scrollToId.animateTo("1",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
        FlatButton(
          color: widget.index == 2 ? Colors.red : Colors.transparent,
          child: Text(
            "Experience",
            style: textStyle,
          ),
          onPressed: () {
            widget.scrollToId.animateTo("2",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
        FlatButton(
          color: widget.index == 3 ? Colors.red : Colors.transparent,
          child: Text(
            "Skill",
            style: textStyle,
          ),
          onPressed: () {
            widget.scrollToId.animateTo("3",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
        FlatButton(
          color: widget.index == 4 ? Colors.red : Colors.transparent,
          child: Text(
            "Contact",
            style: textStyle,
          ),
          onPressed: () {
            widget.scrollToId.animateTo("4",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
      ],
    );
  }
}
