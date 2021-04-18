import 'package:flutter/material.dart';
import 'package:my_portfolio/buttons/Button.dart';
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
        MyButton(
          title: "About",
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: widget.index == 1 ? Colors.red : Colors.transparent),
          onClick: () {
            widget.scrollToId.animateTo("1",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
        MyButton(
          title: "Experience",
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: widget.index == 2 ? Colors.red : Colors.transparent),
          onClick: () {
            widget.scrollToId.animateTo("2",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
        MyButton(
          title: "Skills",
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: widget.index == 3 ? Colors.red : Colors.transparent),
          onClick: () {
            widget.scrollToId.animateTo("3",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
        MyButton(
          title: "Contact",
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: widget.index == 4 ? Colors.red : Colors.transparent),
          onClick: () {
            widget.scrollToId.animateTo("4",
                duration: Duration(seconds: 1), curve: Curves.ease);
          },
        ),
      ],
    );
  }
}
