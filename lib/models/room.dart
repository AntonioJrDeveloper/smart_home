import 'package:flutter/material.dart';

class Room {
  late final String _name;
  late final IconData _icon;
  Room({
    required name,
    required icon,
  }) {
    _name = name;
    _icon = icon;
  }
}
