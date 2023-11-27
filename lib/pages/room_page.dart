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

class AirConditionersGroup extends StatefulWidget {
  const AirConditionersGroup({
    super.key,
  });

  @override
  State<AirConditionersGroup> createState() => _AirConditionersGroupState();
}

class _AirConditionersGroupState extends State<AirConditionersGroup> {
  double _widthInitial = 300;
  double _percentageInitial = 0;
  double _width = 0;
  double _percentage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _width = _percentageInitial * _widthInitial;
      _percentage = _percentageInitial * 100;
    });
  }

  void _incrementPercentage() {
    setState(() {
      _width += _widthInitial / 10;
      _percentage += 0.1 * 100;
    });
  }

  void _decrementPercentage() {
    setState(() {
      _width -= _widthInitial / 10;
      _percentage -= 0.1 * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
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
            child: GestureDetector(
              onTap: () => _percentage != 100 ? _incrementPercentage() : null,
              onDoubleTap: () => _percentage > 0 && _percentage <= 100
                  ? _decrementPercentage()
                  : null,
              behavior: HitTestBehavior.translucent,
              child: Container(
                transform: Matrix4.translationValues(0, 35, 0),
                margin: const EdgeInsets.only(left: 20, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //ControlLevelGroup()
                    Stack(alignment: Alignment.centerLeft, children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 10,
                        decoration: BoxDecoration(
                            gradient:
                                SmartHomeColors.brandLinearGradientSecundary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                      ),
                      Transform.translate(
                        offset: Offset(
                            _percentage == 100
                                ? _width - ((_widthInitial / 10) / 2)
                                : _width <= _widthInitial
                                    ? _width
                                    : _width - ((_widthInitial / 10) / 2),
                            0),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              color: SmartHomeColors.brandLightControlColor,
                              border: Border.fromBorderSide(BorderSide(
                                  width: 2,
                                  color: SmartHomeColors.brandLightColor)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                    ]),
                    const Gap.expand(10),
                    //CotrolLevelTitleGroup()
                    Container(
                      transform: Matrix4.translationValues(0, -18, 0),
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _percentage = 0;
                                    _width = _widthInitial * _percentage;
                                    print('Low $_width');
                                  });
                                },
                                icon: const Icon(Symbols.arrow_drop_down),
                                color: SmartHomeColors.brandLightControlColor,
                              ),
                              Text(
                                'Low',
                                style: SmartHomeThemes
                                    .defaultTheme.textTheme.bodySmall!
                                    .copyWith(
                                        color:
                                            SmartHomeColors.brandPrimaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _percentage = 0.5;
                                    _width = _widthInitial * _percentage;
                                    print('Med $_width');
                                  });
                                },
                                icon: const Icon(Symbols.arrow_drop_down),
                                color: SmartHomeColors.brandLightControlColor,
                              ),
                              Text(
                                'Med',
                                style: SmartHomeThemes
                                    .defaultTheme.textTheme.bodySmall!
                                    .copyWith(
                                        color:
                                            SmartHomeColors.brandPrimaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _percentage = 1;
                                    _width = _widthInitial * _percentage;
                                    print('High $_width');
                                  });
                                },
                                icon: const Icon(Symbols.arrow_drop_down),
                                color: SmartHomeColors.brandLightControlColor,
                              ),
                              Text(
                                'High',
                                style: SmartHomeThemes
                                    .defaultTheme.textTheme.bodySmall!
                                    .copyWith(
                                        color:
                                            SmartHomeColors.brandPrimaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /*
                      ControlLevelGroup(
                        percentage: 0,
                        width: 300,
                        backgroundColor:
                            SmartHomeColors.brandLinearGradientSecundary,
                        borderRadius: SmartHomeRadius.xs,
                      ),
                      const Gap.expand(10),
                      const CotrolLevelTitleGroup(),
                      */
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class CotrolLevelTitleGroup extends StatelessWidget {
  const CotrolLevelTitleGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -18, 0),
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () => print('Low'),
                icon: const Icon(Symbols.arrow_drop_down),
                color: SmartHomeColors.brandLightControlColor,
              ),
              Text(
                'Low',
                style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                    .copyWith(
                        color: SmartHomeColors.brandPrimaryColor,
                        fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => print('Med'),
                icon: const Icon(Symbols.arrow_drop_down),
                color: SmartHomeColors.brandLightControlColor,
              ),
              Text(
                'Med',
                style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                    .copyWith(
                        color: SmartHomeColors.brandPrimaryColor,
                        fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () => print('High'),
                icon: const Icon(Symbols.arrow_drop_down),
                color: SmartHomeColors.brandLightControlColor,
              ),
              Text(
                'High',
                style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                    .copyWith(
                        color: SmartHomeColors.brandPrimaryColor,
                        fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ControlLevelGroup extends StatelessWidget {
  const ControlLevelGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: <Widget>[
      Container(
        width: double.infinity,
        height: 10,
        decoration: BoxDecoration(
            gradient: SmartHomeColors.brandLinearGradientSecundary,
            borderRadius: const BorderRadius.all(SmartHomeRadius.xs)),
      ),
      Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
            color: SmartHomeColors.brandLightControlColor,
            border: Border.fromBorderSide(
                BorderSide(width: 2, color: SmartHomeColors.brandLightColor)),
            borderRadius: BorderRadius.all(SmartHomeRadius.xs)),
      ),
    ]);
  }
}
*/
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => print('-'),
                    icon: const Icon(Symbols.remove),
                    color: SmartHomeColors.brandLightControlColor,
                    iconSize: 40,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: const ControlLevelPowerGroup(),
                    ),
                  ),
                  IconButton(
                    onPressed: () => print('+'),
                    icon: const Icon(Symbols.add),
                    color: SmartHomeColors.brandLightControlColor,
                    iconSize: 40,
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

class ControlLevelPowerGroup extends StatelessWidget {
  const ControlLevelPowerGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Circle(),
        Container(
          width: 225,
          height: 225,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(SmartHomeRadius.smallXX),
              color: SmartHomeColors.brandLightColor),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(SmartHomeRadius.smallX),
              gradient: SmartHomeColors.brandLinearGradientPrimary),
        ),
        Container(
          width: 175,
          height: 175,
          decoration: const BoxDecoration(
            color: SmartHomeColors.brandLightColor,
            borderRadius: BorderRadius.all(SmartHomeRadius.smallX),
          ),
        ),
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(SmartHomeRadius.small),
              gradient: SmartHomeColors.brandLinearGradientPrimary),
          child: IconButton(
            onPressed: () => print('Control Power'),
            icon: const Icon(Symbols.power_settings_new_rounded),
            color: SmartHomeColors.brandLightColor,
            iconSize: 60,
          ),
        ),
        Container(
          transform: Matrix4.translationValues(92.5, 0, 0),
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
              color: SmartHomeColors.brandLightControlColor,
              borderRadius: BorderRadius.all(SmartHomeRadius.card),
              border: Border.fromBorderSide(BorderSide(
                  color: SmartHomeColors.brandLightColor, width: 3))),
        )
      ],
    );
  }
}

class ThingsGroupRoom extends StatefulWidget {
  const ThingsGroupRoom({
    super.key,
  });

  @override
  State<ThingsGroupRoom> createState() => _ThingsGroupRoomState();
}

class _ThingsGroupRoomState extends State<ThingsGroupRoom> {
  BoxDecoration activeBoxDecoration = const BoxDecoration(
      color: SmartHomeColors.brandPrimaryColor,
      borderRadius: BorderRadius.all(SmartHomeRadius.card));
  BoxDecoration defaultBoxDecoration = BoxDecoration(
      border: Border.all(
        color: SmartHomeColors.brandPrimaryColor,
        width: 4,
      ),
      borderRadius: const BorderRadius.all(SmartHomeRadius.card));

  Color defaultColor = SmartHomeColors.brandPrimaryColor;
  Color activeColor = SmartHomeColors.brandLightColor;

  int controller = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      transform: Matrix4.translationValues(0, -15, 0),
      width: double.infinity,
      height: 100,
      child: Center(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Mocks.listThingsRoom.length,
            itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    setState(() {
                      controller = index;
                      print(Mocks.listThingsRoom[index].name);
                    });
                  },
                  child: CardThing(
                    icon: Mocks.listThingsRoom[index].icon,
                    thing: Mocks.listThingsRoom[index].name,
                    boxDecoration: index == controller
                        ? activeBoxDecoration
                        : defaultBoxDecoration,
                    iconColor: index == controller ? activeColor : defaultColor,
                  ),
                ),
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
