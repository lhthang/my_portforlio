import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/navbar/Navbar.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 1;

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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: NavigationBar(
            index: currentIndex,
            scrollToId: scrollToId,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: InteractiveScrollViewer(scrollToId: scrollToId, children: [
          ScrollContent(
              id: '1',
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Image(
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      image: AssetImage(
                        "images/background.jpg",
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('AWESOME'),
                        RotateAnimatedText('OPTIMISTIC'),
                        RotateAnimatedText('DIFFERENT'),
                      ],
                    )),
                  )
                ],
              )),
          ScrollContent(
            id: '2',
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.green,
            ),
          ),
          ScrollContent(
            id: '3',
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.yellow,
            ),
          ),
          ScrollContent(
            id: '4',
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.purple,
            ),
          ),
        ]));
  }
}
