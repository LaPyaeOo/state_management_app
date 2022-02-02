import 'package:flutter/material.dart';

class AppColor {
  static final AppColor _singleton = AppColor._containColor();

  factory AppColor() {
    return _singleton;
  }

  AppColor._containColor();

  final Color primaryColor = Colors.white;
  final Color primaryFontColor = Colors.black;
  final Color secondaryColor = Color(0xFF1863D6);
  final Color appbarColor = Color(0xFFF5F5F5);
  final Gradient buttonGradientColor = LinearGradient(
    colors: <Color>[
      Color(0xFF06B3C4),
      Color(0xFF31739B),
    ],
  );
}
