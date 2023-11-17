import 'package:material_symbols_icons/symbols.dart';
import 'package:smart_home/models/models.dart';
import 'package:smart_home/models/thing.dart';

class Mocks {
  Mocks._();

  static List<Room> listRoom = [
    Room(name: 'Rooms', icon: Symbols.bed),
    Room(name: 'Kitchen', icon: Symbols.kitchen),
    Room(name: 'Living Room', icon: Symbols.living),
    Room(name: 'Bathroom', icon: Symbols.bathroom),
  ];

  static List<Thing> listThingsHome = [
    Thing(name: 'Lights', icon: Symbols.light),
    Thing(name: 'Internet', icon: Symbols.wifi),
    Thing(name: 'Music', icon: Symbols.music_cast),
  ];

  static List<Thing> listThingsRoom = [
    Thing(name: 'Lights', icon: Symbols.light),
    Thing(name: 'TV', icon: Symbols.tv),
    Thing(name: 'Temp', icon: Symbols.thermometer),
    Thing(name: 'Music', icon: Symbols.music_cast),
  ];

  static List<String> listLevel = [
    'Low',
    'Med',
    'High',
  ];
}
