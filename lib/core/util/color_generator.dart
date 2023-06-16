import 'package:flutter/material.dart';

class ColorGenerator {
  final int hex;

  ColorGenerator(this.hex);

  MaterialColor _generator() {
    Color color = Color(hex);
    Map<int, Color> shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]
        .asMap()
        .map((key, value) =>
            MapEntry(value, color.withOpacity(1 - (1 - (key + 1) / 10))));

    return MaterialColor(hex, shades);
  }

  MaterialColor get color => _generator();
}
