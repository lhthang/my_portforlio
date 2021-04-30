import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
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
  TextEditingController controller = new TextEditingController();
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

                    Store.instance.saveBool(Store.LOGGED_IN, false);
                  });
                } else {
                  _showLoginForm();
                }
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

  _showLoginForm() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomDialog(
          child: Container(
            width: 300,
            height: 150,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: controller,
                    enableInteractiveSelection: false,
                    autofocus: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ),
                        onTap: () {
                          controller.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Log in",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15)),
                        ),
                        onTap: () async {
                          String password = await Server.instance.getPassword();
                          try {
                            bool isRight = MyPassword.instance
                                .checkPwd(controller.text, password);
                            if (isRight) {
                              setState(() {
                                isLoggedIn = true;

                                Store.instance.saveBool(Store.LOGGED_IN, true);
                              });
                            } else {
                              _catchLoginFail();
                            }
                            Navigator.of(context).pop();

                            controller.clear();
                          } catch (e) {
                            _catchLoginFail();
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _catchLoginFail() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Container(
          height: 25,
          child: Text(
            "Login failed",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
