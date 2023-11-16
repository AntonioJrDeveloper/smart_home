import 'package:flutter/material.dart';
import 'package:smart_home/design/designs.dart';

class RectangleCircle extends StatelessWidget {
  const RectangleCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 65,
      child: CustomPaint(
        painter: _PaintRectangleCircle(),
      ),
    );
  }
}

class _PaintRectangleCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = SmartHomeColors.brandPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.90, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.5, size.width * 0.90, size.height);
    path.lineTo(-size.width * -0.110, size.height);
    path.quadraticBezierTo(
        -size.width * 0.01, size.height * 0.5, size.width * 0.110, 0);
    path.lineTo(size.width * 0.5, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
