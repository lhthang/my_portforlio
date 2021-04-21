import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final titleStyle = GoogleFonts.montserrat(fontSize: 25);
  final labelStyle = GoogleFonts.montserrat(fontSize: 18);
  File file = null;

  DropzoneViewController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  "CONTACT",
                  style: titleStyle,
                )),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Your name",
                  style: labelStyle,
                )),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                enableInteractiveSelection: false,
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Subject",
                  style: labelStyle,
                )),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                enableInteractiveSelection: false,
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Message",
                  style: labelStyle,
                )),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                enableInteractiveSelection: false,
                autofocus: false,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 10,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 70,
                  margin: EdgeInsets.all(10.0),
                  child: DottedBorder(
                    strokeWidth: 0.5,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10.0),
                    child: Stack(
                      children: [
                        DropzoneView(
                          onCreated: (ctrl) => controller = ctrl,
                          onDrop: (val) {
                            setState(() {
                              file = val;
                            });
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 200,
                              padding: EdgeInsets.all(10),
                              child: RaisedButton(
                                child: Text(
                                  "Choose file",
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () async {
                                  FilePickerResult result = await FilePicker
                                      .platform
                                      .pickFiles(allowMultiple: true);
                                  if (result != null) {
                                    setState(() {
                                      file = File(result.files.single.bytes,
                                          result.files.single.name);
                                    });
                                  }
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                file != null
                                    ? file.name
                                    : "Or you can drag & drop",
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyan,
                          Colors.indigo,
                        ],
                      )),
                  child: Container(
                    width: 200,
                    height: 50, // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(
                      'Send',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.merriweather(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
