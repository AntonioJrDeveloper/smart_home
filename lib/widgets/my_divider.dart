import 'package:flutter/material.dart';

import 'package:smart_home/design/designs.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 2.5,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: SmartHomeColors.brandLightDividerColor,
          borderRadius: BorderRadius.all(SmartHomeRadius.xs)),
    );
  }
}
