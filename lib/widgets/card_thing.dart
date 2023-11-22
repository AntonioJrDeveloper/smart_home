import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';

class CardThing extends StatelessWidget {
  final IconData icon;
  final String thing;
  final BoxDecoration boxDecoration;
  final Color iconColor;
  const CardThing(
      {super.key,
      required this.icon,
      required this.thing,
      required this.boxDecoration,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: 60,
            height: 60,
            decoration: boxDecoration,
            child: Icon(
              icon,
              color: iconColor,
              size: 30,
            )),
        const Gap(5),
        Text(
          thing,
          style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
              color: SmartHomeColors.brandSecondaryColor,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
