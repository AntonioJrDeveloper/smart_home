import 'package:flutter/material.dart';

import 'package:smart_home/design/designs.dart';
import 'package:smart_home/pages/pages.dart';

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.homePage:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case AppRoutes.roomPage:
            return MaterialPageRoute(builder: (_) => const RoomPage());
          default:
            return MaterialPageRoute(builder: (_) => const LogInPage());
        }
      },
    );
  }
}
