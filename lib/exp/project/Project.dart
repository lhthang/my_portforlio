import 'package:flutter/material.dart';
import 'package:my_portfolio/models/Experience.dart';

class Project extends StatefulWidget {
  final ProjectModel project;
  Project({Key key, @required this.project});
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.project.projectName),
        Text(widget.project.position),
        Text(widget.project.stack),
        Text(widget.project.description),
      ],
    );
  }
}
