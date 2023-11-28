import 'package:flutter/material.dart';

import 'package:smart_home/widgets/widgets.dart';

class ProgressCardCircle extends StatefulWidget {
  const ProgressCardCircle({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressCardCircle> createState() => _ProgressCardArcState();
}

class _ProgressCardArcState extends State<ProgressCardCircle> {
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    Color foreground = Colors.red;

    if (progressPercent >= 0.8) {
      foreground = Colors.green;
    } else if (progressPercent >= 0.4) {
      foreground = Colors.orange;
    }

    Color background = foreground;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: CircleBar(
                backgroundColor: background,
                foregroundColor: foreground,
                value: progressPercent,
              ),
              onTap: () {
                final updated = ((progressPercent + 0.1).clamp(0.0, 1.0) * 100);
                setState(() {
                  progressPercent = updated.round() / 100;
                });
              },
              onDoubleTap: () {
                final updated = ((progressPercent - 0.1).clamp(0.0, 1.0) * 100);
                setState(() {
                  progressPercent = updated.round() / 100;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
