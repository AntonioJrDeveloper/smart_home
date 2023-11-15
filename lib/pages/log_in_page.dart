import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';
import 'package:smart_home/pages/helpers/validate_email.dart';

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
        height: 350,
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
          const FromGroup(),
        ]),
      ),
    ]);
  }
}

class FromGroup extends StatefulWidget {
  const FromGroup({
    super.key,
  });

  @override
  State<FromGroup> createState() => _FromGroupState();
}

class _FromGroupState extends State<FromGroup> {
  final _formLoginKey = GlobalKey<FormState>();
  TextEditingController userEmailInputController = TextEditingController();
  late String userEmail;
  late BoxDecoration userEmailContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultCotainerInputDecoration = BoxDecoration(
    color: SmartHomeColors.brandLightColor,
    border: Border.all(color: SmartHomeColors.brandLightDividerColor, width: 2),
    borderRadius: const BorderRadius.all(SmartHomeRadius.xs),
  );
  final activeContainerInputDecoration = BoxDecoration(
    color: SmartHomeColors.brandLightColor,
    border: Border.all(color: SmartHomeColors.brandPrimaryColor, width: 2),
    borderRadius: const BorderRadius.all(SmartHomeRadius.xs),
  );
  final defaultInputLabelTheme = SmartHomeThemes
      .defaultTheme.textTheme.bodySmall!
      .copyWith(color: SmartHomeColors.brandLightInputColor, fontSize: 24);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userEmailContainerDecoration = defaultCotainerInputDecoration;
    pswContainerDecoration = defaultCotainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formLoginKey,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
          child: Column(
            children: <Widget>[
              Container(
                key: const Key('container-email'),
                height: 40,
                decoration: userEmailContainerDecoration,
                child: TextFormField(
                  key: const Key('input-email'),
                  style: SmartHomeThemes.defaultTheme.textTheme.bodySmall,
                  validator: (value) => validateEmail(value!)
                      ? value
                      : SmartHomeErrors.userEmailError,
                  onTap: () {
                    setState(() {
                      userEmailContainerDecoration =
                          activeContainerInputDecoration;
                      pswContainerDecoration = defaultCotainerInputDecoration;
                    });
                  },
                  onTapOutside: (event) {
                    setState(() {
                      userEmailContainerDecoration =
                          defaultCotainerInputDecoration;
                    });
                  },
                  onSaved: (userEmailValue) {
                    userEmail = userEmailValue!;
                  },
                  decoration: InputDecoration(
                      border: defaultInputBorder,
                      label: Center(
                        child: Text(
                          SmartHomeCopys.userEmailInputLabel,
                          style: defaultInputLabelTheme,
                        ),
                      )),
                ),
              ),
              const Gap(20),
              Container(
                key: const Key('container-psw'),
                height: 40,
                decoration: pswContainerDecoration,
                child: TextFormField(
                  key: const Key('input-psw'),
                  style: SmartHomeThemes.defaultTheme.textTheme.bodySmall,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return SmartHomeCopys.userPswInputLabel;
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      pswContainerDecoration = activeContainerInputDecoration;
                      userEmailContainerDecoration =
                          defaultCotainerInputDecoration;
                    });
                  },
                  onTapOutside: (event) {
                    setState(() {
                      pswContainerDecoration = defaultCotainerInputDecoration;
                    });
                  },
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      border: defaultInputBorder,
                      label: Center(
                          child: Text(
                        SmartHomeCopys.userPswInputLabel,
                        style: defaultInputLabelTheme,
                      ))),
                ),
              ),
              const Gap(30),
              MaterialButton(
                onPressed: () => print('LogIn'),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(SmartHomeRadius.small),
                      gradient: SmartHomeColors.brandLinearGradient),
                  child: Center(
                    child: Text(
                      SmartHomeCopys.logIn,
                      style: SmartHomeThemes.defaultTheme.textTheme.bodySmall!
                          .copyWith(
                              color: SmartHomeColors.brandLightColor,
                              fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
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
