import 'package:flutter/material.dart';

abstract class ColorManager {
  const ColorManager._();

  static const primaryColor = Colors.greenAccent;
  static const sideBarBackgroundColor = Color(0xFF121212);

  static const mainContentBackgroundGradient = LinearGradient(
    colors: [
      Colors.black87,
      Colors.black,
      Colors.black,
      Colors.black,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
