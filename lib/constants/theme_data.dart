import 'package:flutter/material.dart';

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> positiv = [Color(0xFF1DF800), Color(0xFF38ef7d)];
  static List<Color> death = [Color(0xFFFF0000), Color(0xFFDC281E)];
  static List<Color> recovered = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  static List<Color> active = [Color(0xFFFFA738), Color(0xFFFFE130)];
  static List<Color> fire = [Color(0xFF585B72), Color(0xFF293049)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.positiv),
    GradientColors(GradientColors.death),
    GradientColors(GradientColors.recovered),
    GradientColors(GradientColors.active),
    GradientColors(GradientColors.fire),
  ];
}