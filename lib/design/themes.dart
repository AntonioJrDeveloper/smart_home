import 'package:flutter/material.dart';
import 'package:smart_home/design/designs.dart';

class SmartHomeThemes {
  SmartHomeThemes._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: SmartHomeColors.brandPrimaryColor,
    textTheme: const TextTheme(
      titleSmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w900),
      titleMedium: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w200),
      displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
      displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w900),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    ),
  );
}
