import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  var exps = [
    0,
    1,
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
        height: 600,
        width: MediaQuery.of(context).size.width *
            MediaQuery.of(context).devicePixelRatio,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: exps.map((index) {
            return TimelineTile(
              axis: TimelineAxis.vertical,
              alignment: TimelineAlign.center,
              indicatorStyle: IndicatorStyle(
                  iconStyle: IconStyle(iconData: Icons.insert_emoticon)),
              startChild: Text("From 2017 to present"),
              endChild: Container(
                height: 600 / exps.length,
                width: 200,
                color: index % 2 == 0 ? Colors.lightGreenAccent : Colors.red,
              ),
            );
          }).toList(),
        ));
  }
}
