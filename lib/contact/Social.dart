import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  final titleStyle = GoogleFonts.montserrat(fontSize: 25);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 50, right: 50),
      child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "Information",
                style: titleStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    customBorder: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      size: 40,
                    ),
                    onTap: () {
                      launchURL("https://facebook.com/ThangLe.1998");
                    },
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Icon(
                      FontAwesomeIcons.linkedin,
                      size: 40,
                    ),
                    onTap: () {
                      launchURL("https://www.linkedin.com/in/lhthang1998/");
                    },
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    customBorder: CircleBorder(),
                    child: Icon(
                      FontAwesomeIcons.github,
                      size: 40,
                    ),
                    onTap: () {
                      launchURL("https://github.com/lhthang");
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }

  launchURL(String url) async {
    try {
      await launch(url, enableJavaScript: true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Container(
            height: 25,
            child: Text(
              "Can not open the URL!",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      );
    }
  }
}
