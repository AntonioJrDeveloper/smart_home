import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:smart_home/design/designs.dart';
import 'package:smart_home/mocks/mocks.dart';
import 'package:smart_home/widgets/widgets.dart';

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
          Gap.expand(30),
          ThingsGroup(),
          Gap.expand(30),
        ],
      ),
    ));
  }
}

class ThingsGroup extends StatelessWidget {
  const ThingsGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Center(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Mocks.listThingsHome.length,
          itemBuilder: (_, index) => CardThing(
              icon: Mocks.listThingsHome[index].icon,
              thing: Mocks.listThingsHome[index].name),
          separatorBuilder: (_, index) => const Gap.expand(35),
        ),
      ),
    );
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
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (_, index) => CardRoom(
                icon: Mocks.listRoom[index].icon,
                room: Mocks.listRoom[index].name),
            itemCount: Mocks.listRoom.length,
          )
        ],
      ),
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
                    size: 34,
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
                    '30 °c',
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
                    '25 °c',
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
    return MyAppBar(
      height: 130,
      gradient: SmartHomeColors.brandLinearGradientSecundary,
      widget: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                onPressed: () => print('Menú'),
                child: const Icon(
                  Icons.menu,
                  size: 30,
                  color: SmartHomeColors.brandLightColor,
                ),
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
              MaterialButton(
                onPressed: () => print('Settings'),
                child: const Icon(
                  Icons.settings,
                  size: 30,
                  color: SmartHomeColors.brandLightColor,
                ),
              )
            ]),
      ),
    );
  }
}
