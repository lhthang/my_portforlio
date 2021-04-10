import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constant.dart';
import 'package:my_portfolio/utils/functions.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isHover = false;
  AnimationController animateController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 0.5,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/avt.jpeg"),
                          ),
                        ),
                        Positioned.fill(
                          child: InkWell(
                            onHover: (value) {
                              setState(() {
                                isHover = value;
                              });
                            },
                            child: Container(
                              color: isHover
                                  ? Colors.white.withOpacity(0.2)
                                  : null,
                              child: isHover
                                  ? Icon(
                                      Icons.search,
                                      size: 50,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      titlePadding: EdgeInsets.all(5.0),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            customBorder: CircleBorder(),
                                            child: Icon(
                                              Icons.close,
                                              size: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      content: Container(
                                        width: width * 0.5,
                                        height: height,
                                        child: Image(
                                          fit: BoxFit.contain,
                                          image: AssetImage("images/avt.jpeg"),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: AnimateIfVisible(
                key: Key("about"),
                duration: Duration(seconds: 1),
                builder: (context, animation) {
                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About me"),
                        Text("Software Engineer"),
                        FlatButton(
                          child: Text("Download CV"),
                          onPressed: () {
                            downloadFile(pdfCV);
                          },
                        )
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
