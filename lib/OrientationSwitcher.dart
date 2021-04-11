import 'package:flutter/material.dart';

class OrientationSwitcher extends StatefulWidget {
  final List<Widget> children;

  OrientationSwitcher({Key key, @required this.children});
  @override
  _OrientationSwitcherState createState() => _OrientationSwitcherState();
}

class _OrientationSwitcherState extends State<OrientationSwitcher> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return orientation == Orientation.portrait
        ? Column(children: widget.children)
        : Row(
            children: widget.children,
          );
  }
}
