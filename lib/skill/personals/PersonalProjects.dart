import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PersonalProjects extends StatefulWidget {
  @override
  _PersonalProjectsState createState() => _PersonalProjectsState();
}

class _PersonalProjectsState extends State<PersonalProjects> {
  CarouselController buttonCarouselController = CarouselController();

  final size = 40.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
    return Container(
        child: Column(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: 300.0,
            enlargeCenterPage: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: width * 0.7,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
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
