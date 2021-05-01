import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/api/Api.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/controller/BlogsController.dart';
import 'package:my_portfolio/navbar/AuthNavbar.dart';

import '../buttons/Button.dart';
import 'package:my_portfolio/routes/route_path.dart' as routes;

class Blogs extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  bool isLoggedIn = false;
  BlogsController blogController = Get.put(BlogsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogController.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return AuthNavBar(
      title: "Blogs",
      child: Container(
          child: Obx(() => ListView.builder(
                itemCount: blogController.blogs.length,
                itemBuilder: (context, index) {
                  return Text(blogController.blogs[index].id);
                },
              ))),
    );
  }
}
