import 'package:flutter/material.dart';

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cornerRadius = 10.0;

    final path = Path();
    path.moveTo(size.width * 0.1, 0);
    path.lineTo(size.width * 0.9, 0);
    path.lineTo(size.width, size.height - cornerRadius);
    path.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );
    path.lineTo(cornerRadius, size.height);
    path.arcToPoint(
      Offset(0, size.height - cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
