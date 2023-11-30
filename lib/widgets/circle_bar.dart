import 'dart:math' as Math;
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:vector_math/vector_math.dart' as Vector;

import 'package:smart_home/design/designs.dart';

/// Draws a circular animated progress bar.
class CircleBar extends StatefulWidget {
  final Duration? animationDuration;
  final LinearGradient backgroundPercentageColor;
  final double value;

  const CircleBar({
    Key? key,
    this.animationDuration,
    required this.backgroundPercentageColor,
    required this.value,
  }) : super(key: key);

  @override
  CircleBarState createState() {
    return CircleBarState();
  }
}

class CircleBarState extends State<CircleBar>
    with SingleTickerProviderStateMixin {
  // Used in tweens where a backgroundColor isn't given.
  static const TRANSPARENT = Color(0x00000000);
  late AnimationController _controller;

  late Animation<double> curve;
  late Tween<double> valueTween;
  late Tween<LinearGradient> backgroundColorTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration ?? const Duration(seconds: 1),
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Build the initial required tweens.
    valueTween = Tween<double>(
      begin: 0,
      end: widget.value,
    );

    backgroundColorTween = Tween<LinearGradient>(
        begin: widget.backgroundPercentageColor,
        end: widget.backgroundPercentageColor);

    _controller.forward();
  }

  @override
  void didUpdateWidget(CircleBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value) {
      // Try to start with the previous tween's end value. This ensures that we
      // have a smooth transition from where the previous animation reached.
      double beginValue = valueTween.evaluate(curve);

      // Update the value tween.
      valueTween = Tween<double>(
        begin: beginValue,
        end: widget.value,
      );

      _controller
        ..value = 0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: curve,
      child: Expanded(
        child: Container(
          width: double.infinity,
          height: 207,
        ),
      ),
      builder: (context, child) {
        final backgroundColor = widget.backgroundPercentageColor;
        return CustomPaint(
          foregroundPainter: CircleBarPainter(
            backgroundPercentageColor: backgroundColor,
            percentage: valueTween.evaluate(curve),
            strokeWidth: 17.5,
          ),
          child: child,
        );
      },
    );
  }
}

// Draws the progress bar.
class CircleBarPainter extends CustomPainter {
  final double percentage;
  late double strokeWidth;
  final LinearGradient backgroundPercentageColor;

  CircleBarPainter({
    required this.backgroundPercentageColor,
    required this.percentage,
    this.strokeWidth = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    strokeWidth = strokeWidth;
    final Offset center = size.center(Offset.zero);
    final Size constrainedSize =
        size - Offset(strokeWidth, strokeWidth) as Size;
    final shortestSide =
        Math.min(constrainedSize.width, constrainedSize.height);
    final radius = (shortestSide / 2);

    // Start at the top. 0 radians represents the right edge
    const double startAngle = -(2 * Math.pi * 0.25);
    final double sweepAngle = -(2 * Math.pi * (percentage));

    final paintCirclePrincipal = Paint()
      ..color = SmartHomeColors.brandLightLineColor.withOpacity(0.2)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawCircle(center, 125, paintCirclePrincipal);

    final paintCircleCenter = Paint()
      ..color = SmartHomeColors.brandLightLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, 125, paintCircleCenter);

    for (var i = 0; i < 60; i++) {
      //Calcular la posision de la linea
      double line = 360 / 16 * i;
      //Establecer estilo de la linea cada 5
      int distance = 0;
      if (i % 5 == 0) {
        paintCircleCenter.color = SmartHomeColors.brandLightLineColor;
        paintCircleCenter.strokeWidth = 2;
        distance = 1;
        paintCircleCenter.strokeCap = StrokeCap.round;
      }

      double x1 = (size.width / 2) +
          (size.width / 3 + distance) * cos(Vector.radians(line));
      double y1 = (size.height / 2) +
          (size.width / 3 + distance) * sin(Vector.radians(line));
      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) +
          (size.width / 3 + 37.5) * cos(Vector.radians(line));
      double y2 = (size.height / 2) +
          (size.width / 3 + 37.5) * sin(Vector.radians(line));
      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paintCircleCenter);
    }

    final backgroundPaintCircleCenter = Paint()
      ..color = SmartHomeColors.brandLightColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        center, radius + strokeWidth + 2.5, backgroundPaintCircleCenter);

    final backgroundPaintPercentageColor = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..shader = backgroundPercentageColor
          .createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, backgroundPaintPercentageColor);

    final backgroundPaintIconColor = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill
      ..shader = backgroundPercentageColor
          .createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius / 3, backgroundPaintIconColor);

    final beta = sweepAngle;
    final shiftX = -radius * sin(beta);
    final shiftY = radius * cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;

    final borderButtonPaint = Paint()
      ..color = SmartHomeColors.brandLightColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(translateX, translateY), radius / 5, borderButtonPaint);

    final buttonPaint = Paint()
      ..color = SmartHomeColors.brandLightControlColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(translateX, translateY), radius / 6, buttonPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleBarPainter);
    return oldPainter.percentage != percentage ||
        oldPainter.backgroundPercentageColor != backgroundPercentageColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
