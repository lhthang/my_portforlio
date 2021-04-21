import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  final titleStyle = GoogleFonts.montserrat(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Information",
          style: titleStyle,
        ),
      ),
    );
  }
}
