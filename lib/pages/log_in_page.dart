import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[TitleGroup(), LogInGroup(), AccountGroup()],
      ),
    ));
  }
}

class AccountGroup extends StatelessWidget {
  const AccountGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          TextButton(
              onPressed: () => print('Forgot Password'),
              child: Text(
                SmartHomeCopys.forgotPwd,
                style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                    .copyWith(
                        color: SmartHomeColors.brandSecondaryColor,
                        fontSize: 24),
              )),
          const Gap(10),
          TextButton(
              onPressed: () => print('Create Account'),
              child: Text(
                SmartHomeCopys.createAccount,
                style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                    .copyWith(
                        color: SmartHomeColors.brandPrimaryColor, fontSize: 24),
              )),
        ],
      ),
    );
  }
}

class LogInGroup extends StatelessWidget {
  const LogInGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        transform: Matrix4.translationValues(0, -25, 0),
        margin: const EdgeInsets.only(left: 25, right: 25),
        height: 300,
        decoration: const BoxDecoration(
            color: SmartHomeColors.brandLightColor,
            borderRadius: BorderRadius.all(SmartHomeRadius.small),
            boxShadow: [
              BoxShadow(
                  color: SmartHomeColors.brandLightDividerColor,
                  offset: Offset(0, 10),
                  blurRadius: 7.5)
            ]),
      ),
      Center(
        child: Column(children: <Widget>[
          Text(
            SmartHomeCopys.welcome,
            style: SmartHomeThemes.defaultTheme.textTheme.displaySmall!
                .copyWith(
                    color: SmartHomeColors.brandPrimaryColor, fontSize: 32),
          ),
          Form(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: SmartHomeColors.brandLightColor,
                    border: Border.all(
                        color: SmartHomeColors.brandLightDividerColor,
                        width: 2),
                    borderRadius: const BorderRadius.all(SmartHomeRadius.xs),
                  ),
                )
              ],
            ),
          ))
        ]),
      ),
    ]);
  }
}

class TitleGroup extends StatelessWidget {
  const TitleGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(gradient: SmartHomeColors.brandLinearGradient),
      child: Column(children: <Widget>[
        const Gap(100),
        Text(
          SmartHomeCopys.home,
          style: SmartHomeThemes.defaultTheme.textTheme.titleSmall!
              .copyWith(color: SmartHomeColors.brandLightColor),
        ),
        Text(
          SmartHomeCopys.smart,
          style: SmartHomeThemes.defaultTheme.textTheme.titleMedium!
              .copyWith(color: SmartHomeColors.brandLightColor),
        ),
        const Gap(40),
        Text(
          SmartHomeCopys.controlSpace,
          style: SmartHomeThemes.defaultTheme.textTheme.bodyLarge!
              .copyWith(color: SmartHomeColors.brandLightColor),
        )
      ]),
    );
  }
}
