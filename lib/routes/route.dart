import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/blogs/BlogAdd.dart';
import 'package:my_portfolio/blogs/BlogDetail.dart';
import 'package:my_portfolio/blogs/blogs.dart';
import '../App.dart';
import 'route_path.dart' as routes;

final pages = [
  GetPage(name: "", page: () => App()),
  GetPage(name: routes.home, page: () => App()),
  GetPage(name: routes.blogs, page: () => Blogs()),
  GetPage(name: routes.blog, page: () => BlogDetail()),
  GetPage(name: routes.edit_blog, page: () => BlogAdd()),
];
