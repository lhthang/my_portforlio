import 'dart:ui';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/Skill.dart';
import 'package:my_portfolio/skill/SkillAvatar.dart';

class Skill extends StatefulWidget {
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  final style =
      GoogleFonts.merriweatherSans(fontSize: 18, fontWeight: FontWeight.bold);
  final languageSkills = [
    LanguageSkill(
        name: "Java",
        image:
            "https://codelearn.io/Upload/Blog/nhung-loi-thuong-gap-khi-lap-trinh-java-63725972059.7478.jpg"),
    LanguageSkill(
        name: "Golang",
        image:
            "https://blog.vietnamlab.vn/content/images/15nbR1DnN8fHxFD-VtmWBRnXYMU6_wnBk.png"),
    LanguageSkill(
        name: "Dart",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/dart-logo-FDA1939EC4-seeklogo.com.png?alt=media&token=e6ed34cf-2787-475a-970e-6d14f51e6eed"),
    LanguageSkill(
        name: "C#",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/csharp.jpg?alt=media&token=40f771f9-ce17-480d-81d9-8dee17a3d106"),
  ];
  final frameworkSkills = [
    LanguageSkill(
        name: "Flutter",
        image:
            "https://play-lh.googleusercontent.com/xSJpOmygFmnq_mgKI9jXVWaQcbEhCmOOc6EJgnneiZcnb6I3DOMK6xwzM0Pa82OyX9A_"),
    LanguageSkill(
        name: "Spring",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/spring_logo.png?alt=media&token=c087ac72-b823-487d-950c-673eb9f259cf"),
    LanguageSkill(
        name: "Spring",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/gin_golang.png?alt=media&token=6f10a196-ffa3-4d7f-9728-112f434391db"),
  ];
  final databaseSkills = [
    LanguageSkill(
        name: "SQL Server",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/sql_server.png?alt=media&token=eb64eb3d-d753-4451-85fa-67c264245cdd"),
    LanguageSkill(
        name: "MongoDB",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/mongo-logo.png?alt=media&token=6ac90cdf-4416-40a4-a154-e4841cf55b09"),
    LanguageSkill(
        name: "Oracle",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/oracle-db.png?alt=media&token=aae85891-12fd-4ea0-a961-7b6e2e3dafa2"),
    LanguageSkill(
        name: "MySQL",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/mysql_PNG22.png?alt=media&token=8b17c995-3d98-4ce1-ba07-570e07965bc4"),
  ];
  final otherSkills = [
    LanguageSkill(
        name: "Docker",
        image:
            "https://www.zencode.nl/wp-content/uploads/2015/05/docker-logo.png"),
    LanguageSkill(
        name: "Elasticsearch",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/elastic-elasticsearch-logo.png?alt=media&token=c91bd84f-b916-4631-ae47-984a4b2d312e"),
    LanguageSkill(
        name: "Microserivces",
        image:
            "https://image.shutterstock.com/image-vector/microservices-icon-vector-260nw-1326628895.jpg"),
    LanguageSkill(
        name: "Git",
        image: "https://miro.medium.com/max/380/1*OvMsmQs0Rzs_ScuiTsuWjw.png"),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
      width: width,
      child: AnimateIfVisible(
        key: Key("skill"),
        duration: Duration(seconds: 1),
        builder: (context, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Languages",
                    style: style,
                  ),
                  padding: EdgeInsets.only(bottom: 20, top: 10),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      spacing: 10,
                      children: languageSkills.map((e) {
                        return SkillAvatar(skill: e);
                      }).toList()),
                ),
                Container(
                  child: Text(
                    "Framworks",
                    style: style,
                  ),
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      spacing: 10,
                      children: frameworkSkills.map((e) {
                        return SkillAvatar(skill: e);
                      }).toList()),
                ),
                Container(
                  child: Text(
                    "Databases",
                    style: style,
                  ),
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      spacing: 10,
                      children: databaseSkills.map((e) {
                        return SkillAvatar(skill: e);
                      }).toList()),
                ),
                Container(
                  child: Text(
                    "Others",
                    style: style,
                  ),
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 10,
                      spacing: 10,
                      children: otherSkills.map((e) {
                        return SkillAvatar(skill: e);
                      }).toList()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
