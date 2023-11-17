import 'package:flutter/material.dart';

import 'package:smart_home/design/designs.dart';

class CardRoom extends StatelessWidget {
  final IconData icon;
  final String room;
  const CardRoom({super.key, required this.icon, required this.room});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => print('Card $room'),
      child: Container(
        width: double.infinity,
        height: 135,
        decoration: const BoxDecoration(
            color: SmartHomeColors.cardsColor,
            borderRadius: BorderRadius.all(SmartHomeRadius.card)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: SmartHomeColors.brandLightColor,
              size: 75,
            ),
            Text(
              room,
              style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
                  color: SmartHomeColors.brandLightColor, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
