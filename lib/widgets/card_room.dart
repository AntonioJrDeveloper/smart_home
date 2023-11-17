import 'package:flutter/material.dart';

import 'package:smart_home/design/designs.dart';

class CardRoom extends StatelessWidget {
  final IconData icon;
  final String room;
  const CardRoom({super.key, required this.icon, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7.5),
      child: Ink(
        decoration: const BoxDecoration(
            color: SmartHomeColors.cardsColor,
            borderRadius: BorderRadius.all(SmartHomeRadius.card)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.roomPage);
              },
              icon: Icon(icon),
              iconSize: 75,
              color: SmartHomeColors.brandLightColor,
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
