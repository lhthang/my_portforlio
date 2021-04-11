import 'package:flutter/material.dart';
import 'package:my_portfolio/models/Experience.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  var exps = [
    ExperienceModel(
        company: "ELCA Viet Nam",
        time: "From August 2020 to present",
        title: "Associate Engineer"),
    ExperienceModel(
        company: "KMS Technology",
        time: "From August 2019 to January 2020",
        title: "Internship"),
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
          children: exps.map((e) {
            return TimelineTile(
              axis: TimelineAxis.vertical,
              alignment: TimelineAlign.center,
              indicatorStyle: IndicatorStyle(
                  iconStyle: IconStyle(iconData: Icons.insert_emoticon)),
              startChild: Container(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(e.time),
                ),
              ),
              endChild: Container(
                height: 600 / exps.length,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title),
                    Text(e.company),
                    Divider(color: Colors.black)
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
