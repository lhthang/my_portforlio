import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:my_portfolio/api/Api.dart';
import 'package:my_portfolio/api/Back4AppApi.dart';
import 'package:my_portfolio/api/MongoApi.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/api/model/Model.dart';
import 'package:my_portfolio/controller/BlogsController.dart';
import 'package:my_portfolio/navbar/AuthNavbar.dart';
import 'package:my_portfolio/utils/error.dart';
import 'package:my_portfolio/utils/functions.dart';

import '../buttons/Button.dart';

class BlogAdd extends StatefulWidget {
  final Blog blog;
  BlogAdd({
    Key key,
    this.blog = null,
  });
  @override
  _BlogAddState createState() => _BlogAddState();
}

class _BlogAddState extends State<BlogAdd> {
  BlogsController blogController = Get.put(BlogsController());
  bool isLoggedIn = false;
  HtmlEditorController controller = HtmlEditorController();
  TextEditingController _titleController = new TextEditingController();
  String result = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadIsLoggedIn();
    if (widget.blog != null) {
      print('aaa');
      controller.setText(widget.blog.content);
      _titleController.text = widget.blog.title;
    }
  }

  _loadIsLoggedIn() {
    setState(() {
      isLoggedIn = loadIsLoggedIn();
    });
  }

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
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _titleController,
              enableInteractiveSelection: false,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Blog's title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
          Expanded(
            child: HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                hint: 'Your text here...',
                shouldEnsureVisible: false,
                autoAdjustHeight: true,
                initialText: widget.blog != null ? widget.blog.content : null,
              ),
              htmlToolbarOptions: HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.aboveEditor, //by default
                toolbarType: ToolbarType.nativeGrid, //by default
              ),
              otherOptions: OtherOptions(
                height: height * 0.9,
              ),
              callbacks: Callbacks(onChange: (changed) {
                result = changed;
              }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: RaisedButton(
              onPressed: () async {
                isLoggedIn = GetStorage().read(Store.LOGGED_IN);
                if (isLoggedIn) {
                  Blog blog =
                      new Blog(title: _titleController.text, content: result);
                  try {
                    bool isSuccess = await Back4AppApi.instance.addBlog(blog);
                    if (isSuccess) {
                      Get.back(result: isSuccess);
                    }
                  } catch (e) {
                    showError(e.error);
                  }
                } else {
                  showError("Please log in again");
                }
              },
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
