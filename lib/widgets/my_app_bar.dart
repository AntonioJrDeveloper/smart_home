import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final double height;
  final Gradient gradient;
  final Widget widget;
  const MyAppBar({
    super.key,
    required this.height,
    required this.gradient,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(gradient: gradient),
      child: widget,
    );
  }
}
