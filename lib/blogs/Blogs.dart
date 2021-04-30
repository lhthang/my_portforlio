import 'package:flutter/material.dart';
import 'package:my_portfolio/api/Api.dart';
import 'package:my_portfolio/api/Store.dart';

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        toolbarTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.black87,
        elevation: 1,
        title: Text("Blogs"),
        centerTitle: true,
        actions: [
          MyButton(
            title: isLoggedIn ? "Log out" : "Log in",
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ),
            onClick: () async {
              if (isLoggedIn) {
                Store.instance.clearAll();
                setState(() {
                  isLoggedIn = false;
                });
              } else {
                String password = await Server.instance.getPassword();
                print(password);
                setState(() {
                  isLoggedIn = true;
                });
              }
              Store.instance.saveBool(Store.LOGGED_IN, isLoggedIn);
            },
          ),
        ],
      ),
      floatingActionButton: isLoggedIn
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
                size: 30,
              ),
              backgroundColor: Colors.blue,
              onPressed: () {
                // Navigator.of(context).pushNamed(routes.edit_blog);
              })
          : null,
    );
  }
}
