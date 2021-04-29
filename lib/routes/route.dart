import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/blogs/blogs.dart';
import '../App.dart';
import 'route_path.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.blogs:
      return MaterialPageRoute(builder: (context) => Blogs());
    case routes.home:
      return MaterialPageRoute(builder: (context) => App());
    default:
      return MaterialPageRoute(builder: (context) => App());
  }
}
