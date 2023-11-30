import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:smart_home/design/designs.dart';
import 'package:smart_home/mocks/mocks.dart';
import 'package:smart_home/widgets/widgets.dart';

class RoomPage extends StatelessWidget {
  final String room;
  const RoomPage({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBarGroupRoom(room: room),
          const ThingsGroupRoom(),
          const Gap.expand(30),
          const TemperatureGroup(),
          const Gap.expand(30),
          const OtherGroup(),
          const Gap.expand(30),
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

  void _lowPercentage() {
    setState(() {
      _percentage = 0;
      _width = 0;
    });
  }

  void _medPercentage() {
    setState(() {
      _percentage = 0;
      _width = _widthInitial / 2;
      _percentage = 0.5 * 100;
    });
  }

  void _highPercentage() {
    setState(() {
      _percentage = 0;
      _width = _widthInitial;
      _percentage = 1 * 100;
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
                    ControlLevelGroup(
                        percentage: _percentage,
                        width: _width,
                        widthInitial: _widthInitial),
                    const Gap.expand(10),
                    CotrolLevelTitleGroup(
                      lowPercentage: _lowPercentage,
                      medPercentage: _medPercentage,
                      highPercentage: _highPercentage,
                    ),
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

class CotrolLevelTitleGroup extends StatelessWidget {
  final VoidCallback lowPercentage;
  final VoidCallback medPercentage;
  final VoidCallback highPercentage;
  const CotrolLevelTitleGroup({
    super.key,
    required this.lowPercentage,
    required this.medPercentage,
    required this.highPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -18, 0),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () => lowPercentage(),
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
                onPressed: () => medPercentage(),
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
                onPressed: () => highPercentage(),
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
    required double percentage,
    required double width,
    required double widthInitial,
  })  : _percentage = percentage,
        _width = width,
        _widthInitial = widthInitial;

  final double _percentage;
  final double _width;
  final double _widthInitial;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: <Widget>[
      Container(
        width: double.infinity,
        height: 8,
        decoration: BoxDecoration(
            gradient: SmartHomeColors.brandLinearGradientSecundary,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
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
          width: 25,
          height: 25,
          decoration: const BoxDecoration(
              color: SmartHomeColors.brandLightControlColor,
              border: Border.fromBorderSide(
                  BorderSide(width: 3, color: SmartHomeColors.brandLightColor)),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
    ]);
  }
}

class TemperatureGroup extends StatefulWidget {
  const TemperatureGroup({
    super.key,
  });

  @override
  State<TemperatureGroup> createState() => _TemperatureGroupState();
}

class _TemperatureGroupState extends State<TemperatureGroup> {
  double progressPercent = 0;

  void _incrementProgressPercent() {
    final updated = ((progressPercent + 0.1).clamp(0.0, 1.0) * 100);
    setState(() {
      progressPercent = updated.round() / 100;
    });
  }

  void _decrementProgressPercent() {
    final updated = ((progressPercent - 0.1).clamp(0.0, 1.0) * 100);
    setState(() {
      progressPercent = updated.round() / 100;
    });
  }

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
          const Gap.expand(20),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => _decrementProgressPercent(),
                    icon: const Icon(Symbols.remove),
                    color: SmartHomeColors.brandLightControlColor,
                    iconSize: 55,
                  ),
                  Expanded(
                    child: ControlLevelPowerGroup(
                      progressPercent: progressPercent,
                      incrementProgressPercent: _incrementProgressPercent,
                      decrementProgressPercent: _decrementProgressPercent,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _incrementProgressPercent(),
                    icon: const Icon(Symbols.add),
                    color: SmartHomeColors.brandLightControlColor,
                    iconSize: 55,
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
  final double progressPercent;
  final VoidCallback incrementProgressPercent;
  final VoidCallback decrementProgressPercent;
  const ControlLevelPowerGroup({
    super.key,
    required this.progressPercent,
    required this.incrementProgressPercent,
    required this.decrementProgressPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ProgressCardCircle(
            progressPercent: progressPercent,
            incrementProgressPercent: incrementProgressPercent,
            decrementProgressPercent: decrementProgressPercent),
        IconButton(
          onPressed: () => print('Control Power'),
          icon: const Icon(Symbols.power_settings_new_rounded),
          color: SmartHomeColors.brandLightColor,
          iconSize: 60,
        ),
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
  final String room;
  const AppBarGroupRoom({
    super.key,
    required this.room,
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
                room,
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
