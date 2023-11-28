import 'dart:math';

import 'package:vector_math/vector_math_64.dart' as Vector;

import 'package:flutter/material.dart';
import 'package:smart_home/design/designs.dart';

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      /*
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(SmartHomeRadius.smallXX),
        color: SmartHomeColors.brandLightCircleColor.withOpacity(0.7),
      ),*/
      child: CustomPaint(
        painter: _PaintCircle(),
      ),
    );
  }
}

class _PaintCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintCiclePrincipal = Paint()
      ..color = SmartHomeColors.brandLightLineColor.withOpacity(0.7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawCircle(const Offset(125, 125), 125, paintCiclePrincipal);

    final paint = Paint()
      ..color = SmartHomeColors.brandLightLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(const Offset(125, 125), 125, paint);

    for (var i = 0; i < 60; i++) {
      //Calcular la posision de la linea
      double line = 360 / 16 * i;
      //Establecer estilo de la linea cada 5
      int distance = 0;
      if (i % 5 == 0) {
        paint.color = SmartHomeColors.brandLightLineColor;
        paint.strokeWidth = 2;
        distance = 1;
        paint.strokeCap = StrokeCap.round;
      }

      double x1 = (size.width / 2) +
          (size.width / 3 + distance) * cos(Vector.radians(line));
      double y1 = (size.height / 2) +
          (size.width / 3 + distance) * sin(Vector.radians(line));
      final p1 = Offset(x1, y1);

      double x2 =
          (size.width / 2) + (size.width / 3 + 35) * cos(Vector.radians(line));
      double y2 =
          (size.height / 2) + (size.width / 3 + 35) * sin(Vector.radians(line));
      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
