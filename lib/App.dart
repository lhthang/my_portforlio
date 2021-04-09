import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/home/Home.dart';
import 'package:my_portfolio/navbar/Navbar.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;
  ScrollToId scrollToId;
  final ScrollController controller = ScrollController();

  void _scrollListener() {
    int widgetIndex = int.parse(scrollToId.idPosition());
    if (widgetIndex != currentIndex) {
      setState(() {
        currentIndex = widgetIndex;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Create ScrollToId instance
    scrollToId = ScrollToId(scrollController: controller);
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: NavigationBar(
            index: currentIndex,
            scrollToId: scrollToId,
          ),
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        resizeToAvoidBottomInset: true,
        floatingActionButton: currentIndex != 0
            ? IconButton(
                icon: Icon(
                  Icons.arrow_upward,
                  size: 35,
                ),
                color: Colors.white,
                onPressed: () {
                  scrollToId.animateTo("0",
                      duration: Duration(seconds: 1), curve: Curves.ease);
                })
            : null,
        body: SafeArea(
          child: InteractiveScrollViewer(scrollToId: scrollToId, children: [
            ScrollContent(id: '0', child: Home()),
            ScrollContent(
              id: '1',
              child: Container(
                height: height,
                color: Colors.pink,
              ),
            ),
            ScrollContent(
              id: '2',
              child: Container(
                height: height,
                color: Colors.green,
              ),
            ),
            ScrollContent(
              id: '3',
              child: Container(
                height: height,
                color: Colors.yellow,
              ),
            ),
            ScrollContent(
              id: '4',
              child: Container(
                height: height,
                color: Colors.purple,
              ),
            ),
          ]),
        ));
  }
}
