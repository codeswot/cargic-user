import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, 0.0);

    path.lineTo(size.width * 0.15, size.height);

    path.lineTo(size.width * 0.15, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
