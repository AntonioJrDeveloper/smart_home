import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';

class CardThing extends StatelessWidget {
  final IconData icon;
  final String thing;
  const CardThing({super.key, required this.icon, required this.thing});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () => print('Card $thing'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: const BoxDecoration(
                  color: SmartHomeColors.brandPrimaryColor,
                  borderRadius: BorderRadius.all(SmartHomeRadius.card)),
              child: Icon(
                icon,
                color: SmartHomeColors.brandLightColor,
              ),
            ),
            const Gap(5),
            Text(
              thing,
              style: SmartHomeThemes.defaultTheme.textTheme.bodySmall,
            )
          ],
        ));
  }
}
