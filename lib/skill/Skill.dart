import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Skill extends StatefulWidget {
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
      height: height,
      width: width,
      child: AnimateIfVisible(
        key: Key("skill"),
        duration: Duration(seconds: 1),
        builder: (context, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Language"),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                    ],
                  ),
                ),
                Text("Database"),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                    ],
                  ),
                ),
                Text("Others"),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
