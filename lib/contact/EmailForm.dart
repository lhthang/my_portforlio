import 'dart:html';
import 'dart:io' as io;
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  String username = 'lhthang.98@gmail.com';
  String password = 'reborn1231301211';

  var smtpServer = null;

  final titleStyle = GoogleFonts.montserrat(fontSize: 25);
  final labelStyle = GoogleFonts.montserrat(fontSize: 18);
  File file = null;

  TextEditingController _bodyController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _subjectController = new TextEditingController();

  DropzoneViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    smtpServer = gmail(username, password);
  }

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
                  "Contact",
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
                controller: _nameController,
                autofocus: false,
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
                controller: _subjectController,
                enableInteractiveSelection: false,
                autofocus: false,
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
                controller: _bodyController,
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
            Container(
                height: 100,
                margin: EdgeInsets.all(10.0),
                child: DottedBorder(
                  strokeWidth: 0.5,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      DropzoneView(
                        onCreated: (ctrl) => controller = ctrl,
                        onDrop: (val) {
                          setState(() {
                            file = val;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            child: Text(
                              "Choose or drop file",
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
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          file != null ? file.name : "",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  openAppEmail();
                  //sendEmail();
                },
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

  openAppEmail() async {
    final Uri _emailLaunchUri =
        Uri(scheme: 'mailto', path: 'lhthang.1998@gmail.com', queryParameters: {
      'subject': _subjectController.text,
      'body': _bodyController.text,
      'attachments': file != null ? file.relativePath : null,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Container(
          height: 25,
          child: Text(
            "This feature is not available now. Please send email normally!",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
    try {
      await launch(_emailLaunchUri.toString(), enableJavaScript: true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e),
        ),
      );
    }
  }

  Future<void> sendEmail() async {
    final equivalentMessage = Message()
      ..from = Address(username, _nameController.text)
      ..recipients.add(Address('lhthang.1998@gmail.com'))
      ..subject = _subjectController.text
      ..text = _bodyController.text;
    if (file != null) {
      equivalentMessage.attachments = [
        FileAttachment(io.File(file.relativePath))
          ..location = Location.inline
          ..cid = file.name
      ];
    }

    String platformResponse;

    try {
      await send(equivalentMessage, smtpServer);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
}
