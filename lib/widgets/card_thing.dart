import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';

class CardThing extends StatefulWidget {
  final IconData icon;
  final String thing;
  final int? index;
  const CardThing(
      {super.key, required this.icon, required this.thing, this.index});

  @override
  State<CardThing> createState() => _CardThingState();
}

class _CardThingState extends State<CardThing> {
  Border activeBorder =
      Border.all(color: SmartHomeColors.brandPrimaryColor, width: 4);
  late int? controller;

  @override
  void initState() {
    controller = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Ink(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: widget.index == controller
                  ? SmartHomeColors.brandPrimaryColor
                  : null,
              border: widget.index != controller ? activeBorder : null,
              borderRadius: const BorderRadius.all(SmartHomeRadius.card)),
          child: IconButton(
            onPressed: () {
              setState(() {
                print('Card ${widget.thing}');
                controller = widget.index;
              });
            },
            icon: Icon(
              widget.icon,
            ),
            iconSize: 30,
            color: widget.index == controller
                ? SmartHomeColors.brandLightColor
                : SmartHomeColors.brandPrimaryColor,
          ),
        ),
        const Gap(5),
        Text(
          widget.thing,
          style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
              color: SmartHomeColors.brandSecondaryColor,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
