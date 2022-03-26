import 'package:flutter/material.dart';

const primaryColor = Color(0xfff6f6f6);
const accentColor = Color(0xff111111);
const intensidade = Colors.black;
const background = Colors.white;

ThemeData androidTheme() {
  return ThemeData(
      textTheme: const TextTheme(
          headline4: TextStyle(
            color: accentColor,
            fontSize: 14,
          ),
          headline5: TextStyle(color: accentColor, fontSize: 12),
          headline6: TextStyle(color: accentColor, fontSize: 10),
          subtitle1: TextStyle(
              color: accentColor, fontSize: 30, fontFamily: 'Source Serif Pro'),
          subtitle2: TextStyle(color: accentColor, fontSize: 20)),
      backgroundColor: background,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor));
}
