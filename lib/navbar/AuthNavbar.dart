import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
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
                  Get.toNamed(routes.edit_blog);
                })
            : null,
        body: widget.child);
  }

  _showLoginForm() {
    Get.defaultDialog(
        title: "Enter",
        content: Container(
          padding: EdgeInsets.all(10.0),
          child: TextFormField(
            controller: controller,
            enableInteractiveSelection: false,
            autofocus: true,
            obscureText: true,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            onFieldSubmitted: (val) {
              _onSubmit();
            },
          ),
        ),
        actions: [
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
              Get.back();
            },
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Text("Log in",
                  style: TextStyle(color: Colors.green, fontSize: 15)),
            ),
            onTap: () {
              _onSubmit();
            },
          )
        ]);
  }

  _onSubmit() async {
    try {
      Get.back();
      String password = await Server.instance.getPassword();
      bool isRight = MyPassword.instance.checkPwd(controller.text, password);
      if (isRight) {
        setState(() {
          isLoggedIn = true;

          Store.instance.saveBool(Store.LOGGED_IN, true);
        });
      } else {
        _catchLoginFail();
      }

      controller.clear();
    } catch (e) {
      _catchLoginFail();
    }
  }

  _catchLoginFail() {
    Get.snackbar("Failed", "Something went wrong",
        titleText: Text(
          "Failed",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        messageText: Text(
          "Something went wrong",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }
}
