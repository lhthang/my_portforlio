import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_portfolio/api/Api.dart';
import 'package:my_portfolio/api/Back4AppApi.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/blogs/BlogCard.dart';
import 'package:my_portfolio/controller/BlogsController.dart';
import 'package:my_portfolio/navbar/AuthNavbar.dart';
import 'package:my_portfolio/utils/error.dart';
import 'package:my_portfolio/utils/functions.dart';

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
    _loadIsLoggedIn();
    onListen();
  }

  _loadIsLoggedIn() {
    setState(() {
      isLoggedIn = loadIsLoggedIn();
    });
  }

  onListen() {
    GetStorage().listenKey(Store.LOGGED_IN, (value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    onListen().call();
  }

  @override
  Widget build(BuildContext context) {
    return AuthNavBar(
      title: "Blogs",
      child: Container(
          child: Obx(() => ListView.builder(
                itemCount: blogController.blogs.length,
                itemBuilder: (context, index) {
                  return BlogCard(
                    isLoggedIn: isLoggedIn,
                    blog: blogController.blogs[index],
                    onClick: () {
                      Get.toNamed("/blog/" + blogController.blogs[index].id);
                    },
                    onEdit: () async {
                      var isSuccess = await Get.toNamed(routes.edit_blog,
                          arguments: blogController.blogs[index]);
                      if (isSuccess) {
                        showSuccesfull("Update successfully!");
                        blogController.loadData();
                      }
                    },
                    onDelete: () async {
                      try {
                        var isSuccess = await Back4AppApi.instance
                            .deleteBlog(blogController.blogs[index].id);
                        if (isSuccess) {
                          showSuccesfull("Delete successfully!");
                          blogController.loadData();
                        }
                      } catch (e) {
                        showError(e);
                      }
                    },
                  );
                },
              ))),
    );
  }
}
