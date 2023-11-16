import 'package:flutter/material.dart';

class SmartHomeColors {
  SmartHomeColors._();
  static LinearGradient brandLinearGradientPrimary = const LinearGradient(
      colors: [brandPrimaryColor, brandSecondaryColor, brandTertiaryColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static LinearGradient brandLinearGradientSecundary = const LinearGradient(
      colors: [brandPrimaryColor, brandSecondaryColor, brandTertiaryColor],
      begin: Alignment.topRight,
      end: Alignment.topLeft);
  static const Color brandPrimaryColor = Color.fromRGBO(84, 48, 217, 1);
  static const Color brandSecondaryColor = Color.fromRGBO(66, 38, 166, 1);
  static const Color brandTertiaryColor = Color.fromRGBO(47, 29, 115, 1);
  static const Color cardsColor = Color.fromRGBO(102, 109, 242, 1);
  static const Color brandLightDividerColor = Color.fromRGBO(242, 242, 242, 1);
  static const Color brandLightInputColor = Color.fromRGBO(227, 226, 226, 1);
  static const Color brandLightColor = Colors.white;
  static const Color brandLightControlColor = Color.fromRGBO(125, 215, 255, 1);
}
