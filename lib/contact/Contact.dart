import 'package:drop_zone/drop_zone.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
                        child: DropZone(
                          onDrop: (files) {
                            print(files);
                          },
                          child: Container(
                              width: 200,
                              height: 50,
                              child: RaisedButton(
                                child: Text("Send"),
                                onPressed: () async {
                                  FilePickerResult result = await FilePicker
                                      .platform
                                      .pickFiles(allowMultiple: true);
                                },
                              )),
                        ),
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
