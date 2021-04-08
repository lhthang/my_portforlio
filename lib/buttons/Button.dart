import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String title;
  final TextStyle textStyle;
  final Function onClick;
  final bool isActive;
  final BoxDecoration decoration;

  MyButton(
      {Key key,
      @required this.title,
      this.onClick,
      this.textStyle,
      this.decoration,
      this.isActive});
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: widget.decoration.borderRadius,
        ),
        child: Container(
            decoration: widget.decoration,
            child: Center(
              child: Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                child: Text(
                  widget.title,
                  style: widget.textStyle,
                ),
              ),
            )),
        onTap: widget.onClick);
  }
}
