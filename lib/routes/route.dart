import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/blogs/BlogAdd.dart';
import 'package:my_portfolio/blogs/blogs.dart';
import '../App.dart';
import 'route_path.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.blogs:
      return MaterialPageRoute(builder: (context) => Blogs());
    case routes.edit_blog:
      return MaterialPageRoute(builder: (context) => BlogAdd());
    case routes.home:
      return MaterialPageRoute(builder: (context) => App());
    default:
      return MaterialPageRoute(builder: (context) => App());
  }
}

final pages = [
  GetPage(name: "", page: () => App()),
  GetPage(name: routes.home, page: () => App()),
  GetPage(name: routes.blogs, page: () => Blogs()),
  GetPage(name: routes.edit_blog, page: () => BlogAdd()),
];
