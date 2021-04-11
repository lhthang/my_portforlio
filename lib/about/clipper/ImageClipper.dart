import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(3 * size.width / 4, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(3 * size.width / 4, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
