import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:smart_home/design/designs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppBarGroup(),
          Gap.expand(20),
          YouGoingGroup(),
          Gap.expand(20),
          MyDivider(),
          Gap.expand(20),
          RoomsGroup(),
          Gap.expand(40),
          MyDivider(),
        ],
      ),
    ));
  }
}

class RoomsGroup extends StatelessWidget {
  const RoomsGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SmartHomeCopys.roomsHouse,
            style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
                color: SmartHomeColors.brandSecondaryColor, fontSize: 18),
          ),
          const Gap.expand(20),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.amber,
          )
          //GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
        ],
      ),
    );
  }
}

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

class YouGoingGroup extends StatelessWidget {
  const YouGoingGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          SmartHomeCopys.youGoing,
          style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
              color: SmartHomeColors.brandSecondaryColor, fontSize: 18),
        ),
        const Gap.expand(15),
        Container(
          margin: const EdgeInsets.only(left: 45, right: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Icon(
                    Symbols.rainy,
                    size: 30,
                    color: SmartHomeColors.brandPrimaryColor,
                  ),
                  Text(
                    'Rainny',
                    style: SmartHomeThemes.defaultTheme.textTheme.bodyMedium!
                        .copyWith(color: SmartHomeColors.brandSecondaryColor),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '30 °C',
                    style: SmartHomeThemes.defaultTheme.textTheme.bodyMedium!
                        .copyWith(
                            color: SmartHomeColors.brandPrimaryColor,
                            fontSize: 24),
                  ),
                  Text(
                    SmartHomeCopys.temperature,
                    style: SmartHomeThemes.defaultTheme.textTheme.bodyMedium!
                        .copyWith(color: SmartHomeColors.brandSecondaryColor),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '25 °C',
                    style: SmartHomeThemes.defaultTheme.textTheme.bodyMedium!
                        .copyWith(
                            color: SmartHomeColors.brandPrimaryColor,
                            fontSize: 24),
                  ),
                  Text(
                    SmartHomeCopys.outSide,
                    style: SmartHomeThemes.defaultTheme.textTheme.bodyMedium!
                        .copyWith(color: SmartHomeColors.brandSecondaryColor),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AppBarGroup extends StatelessWidget {
  const AppBarGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration:
          BoxDecoration(gradient: SmartHomeColors.brandLinearGradientSecundary),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(
                Icons.menu,
                size: 30,
                color: SmartHomeColors.brandLightColor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 60,
                    color: SmartHomeColors.brandLightColor,
                  ),
                  Text(
                    'David, Home',
                    style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                        .copyWith(
                            color: SmartHomeColors.brandLightColor,
                            fontSize: 14),
                  )
                ],
              ),
              const Icon(
                Icons.settings,
                size: 30,
                color: SmartHomeColors.brandLightColor,
              )
            ]),
      ),
    );
  }
}
