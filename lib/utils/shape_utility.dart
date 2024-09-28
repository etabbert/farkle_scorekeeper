import 'package:flutter/material.dart';

class TrapezoidClipper extends CustomClipper<Path> {
  final double cornerRadius;

  TrapezoidClipper({this.cornerRadius = 10.0});

  @override
  Path getClip(Size size) {
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

class TrapezoidWidget extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color fillColor;
  final Widget child;

  const TrapezoidWidget(
      {super.key,
      this.width = 300,
      this.height = 200,
      this.cornerRadius = 10.0,
      this.borderWidth = 2.0,
      this.borderColor = Colors.white,
      this.fillColor = Colors.blueAccent,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: TrapezoidPainter(
              cornerRadius: cornerRadius,
              borderWidth: borderWidth,
              borderColor: borderColor,
              fillColor: fillColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color fillColor;

  TrapezoidPainter({
    this.cornerRadius = 10.0,
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
    this.fillColor = Colors.blueAccent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final Path path = Path();

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

    canvas.drawPath(path, fillPaint);

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant TrapezoidPainter oldDelegate) {
    return oldDelegate.cornerRadius != cornerRadius ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.fillColor != fillColor;
  }
}
