import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  File file = null;
  DropzoneViewController controller;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
      height: height,
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 12,
            md: 8,
            child: Center(
              child: Form(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text("Send me message")),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Your name")),
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
                          child: Text("Subject")),
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
                          child: Text("Message")),
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
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10.0)),
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
                                        child: Text("Attach file"),
                                        onPressed: () async {
                                          FilePickerResult result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                                      allowMultiple: true);
                                          print(result.files.single.name);
                                          if (result != null) {
                                            setState(() {
                                              file = File(
                                                  result.files.single.bytes,
                                                  result.files.single.name);
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    file != null
                                        ? Align(
                                            alignment: Alignment.center,
                                            child: Text(file.name),
                                          )
                                        : Container(),
                                  ],
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
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
