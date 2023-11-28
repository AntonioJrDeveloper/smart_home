import 'dart:math' as Math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_home/design/designs.dart';

/// Draws a circular animated progress bar.
class CircleBar extends StatefulWidget {
  final Duration? animationDuration;
  final Color? backgroundColor;
  final Color foregroundColor;
  final double value;

  const CircleBar({
    Key? key,
    this.animationDuration,
    this.backgroundColor,
    required this.foregroundColor,
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
  late Tween<Color> backgroundColorTween;
  late Tween<Color> foregroundColorTween;

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

    backgroundColorTween = Tween<Color>(
        begin: widget.backgroundColor, end: widget.backgroundColor);
    foregroundColorTween = Tween<Color>(
        begin: widget.foregroundColor, end: widget.foregroundColor);

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

      // Clear cached color tweens when the color hasn't changed.
      if (oldWidget.backgroundColor != widget.backgroundColor) {
        backgroundColorTween = Tween<Color>(
          begin: oldWidget.backgroundColor ?? TRANSPARENT,
          end: widget.backgroundColor ?? TRANSPARENT,
        );
      } else {
        backgroundColorTween;
      }

      if (oldWidget.foregroundColor != widget.foregroundColor) {
        foregroundColorTween = Tween<Color>(
          begin: oldWidget.foregroundColor,
          end: widget.foregroundColor,
        );
      } else {
        foregroundColorTween;
      }

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
          color: Colors.amber,
          width: double.infinity,
          height: 207,
        ),
      ),
      builder: (context, child) {
        final backgroundColor = widget.backgroundColor;
        final foregroundColor = widget.foregroundColor;
        return CustomPaint(
          foregroundPainter: CircleBarPainter(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            percentage: valueTween.evaluate(curve),
            strokeWidth: 10,
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
  final Color? backgroundColor;
  final Color foregroundColor;

  CircleBarPainter({
    this.backgroundColor,
    required this.foregroundColor,
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
      ..color = SmartHomeColors.brandLightLineColor.withOpacity(0.7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawCircle(center, 125, paintCirclePrincipal);

    final paintCircleCentral = Paint()
      ..color = SmartHomeColors.brandLightLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, 125, paintCircleCentral);

    // Don't draw the background if we don't have a background color
    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = backgroundColor!
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    final beta = sweepAngle;
    final shiftX = -radius * sin(beta);
    final shiftY = radius * cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;

    final borderbottonPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(translateX, translateY), radius / 3.25, borderbottonPaint);

    final buttonPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(translateX, translateY), radius / 4, buttonPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleBarPainter);
    return oldPainter.percentage != percentage ||
        oldPainter.backgroundColor != backgroundColor ||
        oldPainter.foregroundColor != foregroundColor ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
