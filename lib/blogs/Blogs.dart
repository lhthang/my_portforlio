import 'package:flutter/material.dart';
import 'package:my_portfolio/api/Api.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/navbar/AuthNavbar.dart';

import '../buttons/Button.dart';
import 'package:my_portfolio/routes/route_path.dart' as routes;

class Blogs extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return AuthNavBar(
      title: "Blogs",
      child: Container(),
    );
  }
}
