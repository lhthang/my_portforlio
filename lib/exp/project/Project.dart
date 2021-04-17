import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/Experience.dart';

class Project extends StatefulWidget {
  final ProjectModel project;
  Project({Key key, @required this.project});
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  final projectStyle =
      GoogleFonts.merriweatherSans(fontSize: 16, fontWeight: FontWeight.bold);
  final positionStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.italic,
  );

  final descriptionStyle = GoogleFonts.merriweather(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            widget.project.projectName,
            style: projectStyle,
          ),
        ),
        Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Position: " + widget.project.position,
              style: positionStyle,
            )),
        Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Stack: " + widget.project.stack,
              style: descriptionStyle,
            )),
        Container(
            child: Text(
          widget.project.description,
          style: descriptionStyle,
        )),
      ],
    );
  }
}
