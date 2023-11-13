import 'package:flutter/material.dart';

import 'package:smart_home/design/app_routes.dart';
import 'package:smart_home/pages/pages.dart';

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.homePage:
            return MaterialPageRoute(builder: (_) => const HomePage());
          default:
            return MaterialPageRoute(builder: (_) => const LogInPage());
        }
      },
    );
  }
}
