import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';

class CardThing extends StatelessWidget {
  final IconData icon;
  final String thing;
  const CardThing({super.key, required this.icon, required this.thing});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Ink(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              color: SmartHomeColors.brandPrimaryColor,
              borderRadius: BorderRadius.all(SmartHomeRadius.card)),
          child: IconButton(
            onPressed: () => print('Card $thing'),
            icon: Icon(
              icon,
            ),
            iconSize: 30,
            color: SmartHomeColors.brandLightColor,
          ),
        ),
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
