import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:smart_home/design/designs.dart';
import 'package:smart_home/pages/helpers/validate_email.dart';
import 'package:smart_home/widgets/widgets.dart';

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
  late bool onTapControllerEmail = true;
  late bool onTapControllerPsw = true;

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
                padding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
                key: const Key('container-email'),
                height: 50,
                decoration: userEmailContainerDecoration,
                child: TextFormField(
                  key: const Key('input-email'),
                  style: SmartHomeThemes.defaultTheme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: userEmailInputController,
                  validator: (value) => validateEmail(value!)
                      ? null
                      : SmartHomeErrors.userEmailError,
                  onTap: () {
                    setState(() {
                      userEmailContainerDecoration =
                          activeContainerInputDecoration;
                      pswContainerDecoration = defaultCotainerInputDecoration;
                      onTapControllerEmail = false;
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
                      label: onTapControllerEmail
                          ? Center(
                              child: Text(
                                SmartHomeCopys.userEmailInputLabel,
                                style: defaultInputLabelTheme,
                              ),
                            )
                          : null),
                ),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 10, bottom: 10),
                key: const Key('container-psw'),
                height: 50,
                decoration: pswContainerDecoration,
                child: TextFormField(
                  key: const Key('input-psw'),
                  style: SmartHomeThemes.defaultTheme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return SmartHomeErrors.userPswError;
                    }
                    return null;
                  },
                  onTap: () {
                    setState(() {
                      pswContainerDecoration = activeContainerInputDecoration;
                      userEmailContainerDecoration =
                          defaultCotainerInputDecoration;
                      onTapControllerPsw = false;
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
                      label: onTapControllerPsw
                          ? Center(
                              child: Text(
                              SmartHomeCopys.userPswInputLabel,
                              style: defaultInputLabelTheme,
                            ))
                          : null),
                ),
              ),
              const Gap(30),
              Stack(
                alignment: Alignment.center,
                children: [
                  const RectangleCircle(),
                  MaterialButton(
                    onPressed: () {
                      if (_formLoginKey.currentState!.validate()) {
                        // _formLoginKey.currentState!.save();
                        print('Todos lo campos estan ok 🤯');
                        userEmail = userEmailInputController.text;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.homePage, ModalRoute.withName('/'));
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(SmartHomeRadius.small),
                          gradient: SmartHomeColors.brandLinearGradientPrimary),
                      child: Center(
                        child: Text(
                          SmartHomeCopys.logIn,
                          style: SmartHomeThemes
                              .defaultTheme.textTheme.bodySmall!
                              .copyWith(
                                  color: SmartHomeColors.brandLightColor,
                                  fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
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
    return MyAppBar(
      height: 350,
      gradient: SmartHomeColors.brandLinearGradientPrimary,
      widget: Column(children: <Widget>[
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
              .copyWith(color: SmartHomeColors.brandLightColor, fontSize: 18),
        )
      ]),
    );
  }
}
