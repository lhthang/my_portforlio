import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/constant.dart';
import 'package:my_portfolio/utils/functions.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isHover = false;
  AnimationController animateController;

  final description = [
    "A software engineer with 1 year of experience",
    "Interesting in listening to other people’s ideas and finding solutions to contribute to building better software architectures",
    "Taking responsibility at work and always looking for opportunities to learn new things"
  ];

  _renderDescription() {
    List<Widget> _list = new List();
    for (var item in description) {
      _list.add(Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: new Text(item,
            style: GoogleFonts.openSansCondensed(
              fontSize: 20,
            )),
      ));
    }
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
      width: width,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: width / MediaQuery.of(context).devicePixelRatio < 1000
            ? WrapAlignment.center
            : WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              constraints: BoxConstraints(maxWidth: 300, maxHeight: 400),
              child: Center(
                child: Image(
                  width: width / 5,
                  fit: BoxFit.contain,
                  image: AssetImage("images/avt.jpeg"),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 50),
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
                      Text(
                        "ABOUT ME",
                        style: GoogleFonts.montserrat(fontSize: 25),
                      ),
                      Text("Software Engineer",
                          style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          )),
                      _renderDescription(),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        onPressed: () {
                          downloadFile(pdfCV);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.cyan,
                                  Colors.indigo,
                                ],
                              )),
                          child: Container(
                            width: 150,
                            height: 50, // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: Text(
                              'Download CV',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
