import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final style = GoogleFonts.openSans(
    fontStyle: FontStyle.italic,
    fontSize: 15,
  );
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          lg: 4,
          md: 12,
          xs: 12,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text(
                    "Birthday: 10th August, 1998",
                    style: style,
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text("Email: lhthang.1998@gmail.com", style: style)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text("Phone: +84 38492****", style: style)
                ],
              )
            ],
          ),
        ),
        ResponsiveGridCol(
          lg: 8,
          md: 12,
          xs: 12,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text("Address: Binh Tan district, Ho Chi Minh city",
                      style: style)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text("Degree: Bachelor of Software Engineer", style: style)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_right),
                  Text("University: University of Information Technology",
                      style: style)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
