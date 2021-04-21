import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/models/Skill.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PersonalProjects extends StatefulWidget {
  @override
  _PersonalProjectsState createState() => _PersonalProjectsState();
}

class _PersonalProjectsState extends State<PersonalProjects> {
  CarouselController buttonCarouselController = CarouselController();

  final projects = [
    PersonalProject(
        name: "Minerva Reader",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/MinervaReader.png?alt=media&token=62a2fe9c-a2f7-4b11-b60d-679f97046cbc"),
    PersonalProject(
        name: "Minerva Reader",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/MinervaReader.png?alt=media&token=62a2fe9c-a2f7-4b11-b60d-679f97046cbc"),
    PersonalProject(
        name: "Minerva Reader",
        image:
            "https://firebasestorage.googleapis.com/v0/b/common-shared-e07ec.appspot.com/o/MinervaReader.png?alt=media&token=62a2fe9c-a2f7-4b11-b60d-679f97046cbc"),
  ];

  final size = 40.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    final height = MediaQuery.of(context).size.height *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
        child: Column(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: height * 0.5,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
          ),
          items: projects.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? width * 0.5
                        : width * 0.8,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              e.image,
                            ))),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () {
                        print('a');
                      },
                    ));
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              customBorder: CircleBorder(),
              child: Icon(
                Icons.arrow_left,
                size: size,
              ),
              onTap: () => buttonCarouselController.previousPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              customBorder: CircleBorder(),
              child: Icon(
                Icons.arrow_right,
                size: size,
              ),
              onTap: () => buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear),
            )
          ],
        )
      ],
    ));
  }
}
