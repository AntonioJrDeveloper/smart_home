import 'package:flutter/material.dart';
import 'package:smart_home/design/colors.dart';

import 'package:smart_home/widgets/widgets.dart';

class ProgressCardCircle extends StatelessWidget {
  final double progressPercent;
  final VoidCallback incrementProgressPercent;
  final VoidCallback decrementProgressPercent;

  const ProgressCardCircle({
    Key? key,
    required this.progressPercent,
    required this.incrementProgressPercent,
    required this.decrementProgressPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinearGradient backgroundPercentageColor =
        SmartHomeColors.brandLinearGradientPrimary;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: CircleBar(
                backgroundPercentageColor: backgroundPercentageColor,
                value: progressPercent,
              ),
              onTap: () => incrementProgressPercent(),
              onDoubleTap: () => decrementProgressPercent(),
            ),
          ),
        ),
      ],
    );
  }
}
