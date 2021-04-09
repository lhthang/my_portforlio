import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textStyle = GoogleFonts.pressStart2p(
    fontSize: 50,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image(
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            image: AssetImage(
              "images/background.jpg",
            ),
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: DefaultTextStyle(
                style: textStyle,
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText("DO WHAT YOU LOVE"),
                    RotateAnimatedText('LOVE WHAT YOU DO'),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
