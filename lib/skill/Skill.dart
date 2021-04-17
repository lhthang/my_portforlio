import 'dart:ui';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/skill/personals/PersonalProjects.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Skill extends StatefulWidget {
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  final imageSize = 80.0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
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
                SizedBox(
                  height: 100,
                ),
                Text("Languages & Frameworks"),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      new Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33A6A6A6)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg")),
                        ),
                      ),
                      new Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33A6A6A6)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg")),
                        ),
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
                    spacing: 10,
                    children: [
                      new Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33A6A6A6)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg")),
                        ),
                      ),
                      new Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33A6A6A6)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg")),
                        ),
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
                    spacing: 10,
                    children: [
                      new Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33A6A6A6)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg")),
                        ),
                      ),
                      new Container(
                        height: imageSize,
                        width: imageSize,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33A6A6A6)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg")),
                        ),
                      ),
                    ],
                  ),
                ),
                PersonalProjects(),
              ],
            ),
          );
        },
      ),
    );
  }
}
