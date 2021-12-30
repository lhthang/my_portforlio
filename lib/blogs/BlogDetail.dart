import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/api/model/Model.dart';
import 'package:my_portfolio/controller/BlogsController.dart';

class BlogDetail extends StatefulWidget {
  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  Blog blog = null;
  String htmlData = "";
  BlogsController blogController = Get.put(BlogsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadBlog();
  }

  _loadBlog() {
    blogController.getBlog(Get.parameters["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        toolbarTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black87,
        elevation: 1,
        title: Text("Blog"),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, right: 30, left: 30),
          child: Obx(() {
            if (blogController.blog.value == null) {
              return Center(child: CircularProgressIndicator());
            }
            return renderView();
          })),
    );
  }

  Widget renderView() {
    var content = blogController.blog.value.content;
    blogController.reset();
    return ListView(
      children: [
        Html(
          data: """ ${content}""",
        )
      ],
    );
  }
}
