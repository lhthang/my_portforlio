import 'package:flutter/material.dart';
import 'package:my_portfolio/api/Api.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/buttons/Button.dart';
import 'package:my_portfolio/routes/route_path.dart' as routes;

class AuthNavBar extends StatefulWidget {
  final Widget child;
  final String title;
  final bool showFloatButton;
  AuthNavBar(
      {Key key,
      @required this.child,
      @required this.title,
      this.showFloatButton = true});

  @override
  _AuthNavBarState createState() => _AuthNavBarState();
}

class _AuthNavBarState extends State<AuthNavBar> {
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          toolbarTextStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.black87,
          elevation: 1,
          title: Text(widget.title),
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
                  bool isRight =
                      MyPassword.instance.checkPwd("Lhthang@1998", password);
                  if (isRight) {
                    setState(() {
                      isLoggedIn = true;
                    });
                  }
                }
                Store.instance.saveBool(Store.LOGGED_IN, isLoggedIn);
              },
            ),
          ],
        ),
        floatingActionButton: widget.showFloatButton && isLoggedIn
            ? FloatingActionButton(
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed(routes.edit_blog);
                })
            : null,
        body: widget.child);
  }
}
