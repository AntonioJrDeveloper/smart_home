import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:smart_home/design/designs.dart';
import 'package:smart_home/mocks/mocks.dart';
import 'package:smart_home/widgets/widgets.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBarGroupRoom(),
          ThingsGroupRoom(),
          Gap.expand(30),
          TemperatureGroup(),
          Gap.expand(30),
          OtherGroup(),
          Gap.expand(30),
        ],
      ),
    ));
  }
}

class OtherGroup extends StatelessWidget {
  const OtherGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            SmartHomeCopys.airConditioners,
            style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
                color: SmartHomeColors.brandPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const AirConditionersGroup()
        ],
      ),
    );
  }
}

class AirConditionersGroup extends StatelessWidget {
  const AirConditionersGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: SmartHomeColors.brandPrimaryColor,
                borderRadius: BorderRadius.all(SmartHomeRadius.card)),
            child: const Icon(
              Symbols.mode_fan,
              color: SmartHomeColors.brandLightColor,
              size: 35,
            ),
          ),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(0, 35, 0),
              margin: const EdgeInsets.only(left: 20, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 10,
                    decoration: BoxDecoration(
                        gradient: SmartHomeColors.brandLinearGradientSecundary,
                        borderRadius:
                            const BorderRadius.all(SmartHomeRadius.xs)),
                  ),
                  const Gap.expand(10),
                  Container(
                    transform: Matrix4.translationValues(0, -10, 0),
                    width: double.infinity,
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Mocks.listLevel.length,
                      itemBuilder: (_, index) => Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () => print(Mocks.listLevel[index]),
                              icon: const Icon(Symbols.arrow_drop_down),
                              color: SmartHomeColors.brandLightControlColor,
                            ),
                            Text(
                              Mocks.listLevel[index],
                              style: SmartHomeThemes
                                  .defaultTheme.textTheme.bodySmall!
                                  .copyWith(
                                      color: SmartHomeColors.brandPrimaryColor,
                                      fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (_, index) => const Gap.expand(100),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TemperatureGroup extends StatelessWidget {
  const TemperatureGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      width: double.infinity,
      height: 400,
      color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          Text(
            SmartHomeCopys.temperature,
            style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!.copyWith(
                color: SmartHomeColors.brandSecondaryColor, fontSize: 30),
          ),
          const Gap.expand(5),
          Text(
            '26°C',
            style: SmartHomeThemes.defaultTheme.textTheme.bodyMedium!.copyWith(
                color: SmartHomeColors.brandSecondaryColor, fontSize: 55),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Row(
                children: <Widget>[
                  const Icon(
                    Symbols.remove,
                    color: SmartHomeColors.brandLightControlColor,
                    size: 40,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 20, left: 12, right: 12, bottom: 20),
                      color: Colors.amber,
                    ),
                  ),
                  const Icon(
                    Symbols.add,
                    color: SmartHomeColors.brandLightControlColor,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThingsGroupRoom extends StatelessWidget {
  const ThingsGroupRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      transform: Matrix4.translationValues(0, -15, 0),
      width: double.infinity,
      height: 100,
      child: Center(
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Mocks.listThingsRoom.length,
            itemBuilder: (_, index) => CardThing(
                icon: Mocks.listThingsRoom[index].icon,
                thing: Mocks.listThingsRoom[index].name),
            separatorBuilder: (_, index) => const Gap.expand(35)),
      ),
    );
  }
}

class AppBarGroupRoom extends StatelessWidget {
  const AppBarGroupRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
        height: 130,
        widget: Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Symbols.navigate_before),
                color: SmartHomeColors.brandPrimaryColor,
                iconSize: 60,
              ),
              Text(
                'Room',
                style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                    .copyWith(
                        color: SmartHomeColors.brandSecondaryColor,
                        fontSize: 18),
              )
            ],
          ),
        ));
  }
}
