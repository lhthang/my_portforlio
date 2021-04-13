import 'package:flutter/material.dart';
import 'package:my_portfolio/exp/project/Project.dart';
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
        title: "Associate Engineer",
        projects: [
          ProjectModel(
            projectName: "Papillon",
            position: "Fullstack",
            stack: "Java, Spring, Ant, HTML, Javascript",
            description: "ava, Spring, Ant, HTML, Javascript",
          ),
          ProjectModel(
            projectName: "Phoenix",
            position: "Fullstack",
            stack: "Java, Spring, Ant, HTML, Javascript",
            description: "ava, Spring, Ant, HTML, Javascript",
          )
        ]),
    ExperienceModel(
        company: "KMS Technology",
        time: "From August 2019 to January 2020",
        title: "Internship",
        isActive: false,
        projects: [
          ProjectModel(
            projectName: "KMS Library",
            position: "Backend",
            stack: "Golang, Elasticsearch, Docker, VueJS, MongoDB",
            description: "ava, Spring, Ant, HTML, Javascript",
          )
        ]),
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
                  width: 30,
                  height: 30,
                  color: e.isActive ? Colors.green : Colors.red,
                  iconStyle: IconStyle(
                      color: Colors.white,
                      iconData: e.isActive
                          ? Icons.check_circle_outline
                          : Icons.radio_button_unchecked,
                      fontSize: 20)),
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
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.black),
                    Text(e.company),
                    Text(e.title),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: e.projects.map((project) {
                          return Project(project: project);
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
