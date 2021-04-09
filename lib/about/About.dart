import 'package:flutter/material.dart';
import 'package:my_portfolio/buttons/Button.dart';
import 'package:my_portfolio/utils/constant.dart';
import 'package:my_portfolio/utils/functions.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          MediaQuery.of(context).devicePixelRatio,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text("About me"),
          ),
          Expanded(
            flex: 4,
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
          ),
        ],
      ),
    );
  }
}
