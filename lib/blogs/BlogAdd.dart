import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:my_portfolio/navbar/AuthNavbar.dart';

import '../buttons/Button.dart';

class BlogAdd extends StatefulWidget {
  @override
  _BlogAddState createState() => _BlogAddState();
}

class _BlogAddState extends State<BlogAdd> {
  final HtmlEditorController controller = HtmlEditorController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return AuthNavBar(
      title: "New Blog",
      showFloatButton: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your text here...',
                  shouldEnsureVisible: false,
                  autoAdjustHeight: true
                  //initialText: "<p>text content initial, if any</p>",
                  ),
              htmlToolbarOptions: HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.aboveEditor, //by default
                toolbarType: ToolbarType.nativeGrid, //by default
              ),
              otherOptions: OtherOptions(
                height: height * 0.9,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
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
                        Colors.orangeAccent,
                        Colors.red,
                      ],
                    )),
                child: Container(
                  width: double.infinity,
                  height: 40, // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
