import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/contact/EmailForm.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 12,
            md: 8,
            child: Center(
              child: EmailForm(),
            ),
          ),
          ResponsiveGridCol(
            xs: 12,
            md: 4,
            child: Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
              child: Align(
                alignment: Alignment.center,
                child: Text("Information"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
