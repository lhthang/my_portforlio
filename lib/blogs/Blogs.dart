import 'package:flutter/material.dart';

import '../buttons/Button.dart';
import 'package:my_portfolio/routes/route_path.dart' as routes;

class Blogs extends StatefulWidget {
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        toolbarTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black87,
        elevation: 1,
        title: Text("Blogs"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).pushNamed(routes.edit_blog);
          }),
    );
  }
}
