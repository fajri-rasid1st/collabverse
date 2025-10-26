// Flutter imports:
import 'package:flutter/material.dart';

class AuthPageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 85);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 85,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
