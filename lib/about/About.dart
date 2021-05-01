import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/routes/route_path.dart' as routes;
import 'package:my_portfolio/about/clipper/ImageClipper.dart';
import 'package:my_portfolio/about/information/Information.dart';
import 'package:my_portfolio/utils/constant.dart';
import 'package:my_portfolio/utils/functions.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final width = MediaQuery.of(context).size.width * pixelRatio;
    final height = MediaQuery.of(context).size.height * pixelRatio;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
        constraints: BoxConstraints(maxWidth: width),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 4,
              xs: 12,
              child: Container(
                  height: 600,
                  child: Center(
                    child: ClipPath(
                      clipper: ImageClipper(),
                      child: Image(
                        width: 300,
                        fit: BoxFit.contain,
                        image: AssetImage("images/avt.jpeg"),
                      ),
                    ),
                  )),
            ),
            ResponsiveGridCol(
              md: 8,
              xs: 12,
              child: Container(
                height: 600,
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
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ABOUT ME",
                            style: GoogleFonts.montserrat(fontSize: 30),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Software Engineer",
                              style: GoogleFonts.merriweather(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Information(),
                          _renderDescription(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  downloadFile(pdfCV);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80.0)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.cyan,
                                          Colors.indigo,
                                        ],
                                      )),
                                  child: Container(
                                    width: 150,
                                    height:
                                        50, // min sizes for Material buttons
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
                              SizedBox(
                                width: 10,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Get.toNamed(routes.blogs);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80.0)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.orangeAccent,
                                          Colors.red,
                                        ],
                                      )),
                                  child: Container(
                                    width: 150,
                                    height:
                                        50, // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Blogs',
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
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
