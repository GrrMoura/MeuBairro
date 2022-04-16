import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const primaryColor = Color(0xf3FF6700); // Color(0xfff6f6f6);
const accentColor = Colors.black; //Color(0xff16F529);
const intensidade = Colors.black;
const background = Color(0xff16F529);
const colorWhite = Colors.white;

ThemeData androidTheme() {
  return ThemeData(
      textTheme: TextTheme(
          headline1:
              TextStyle(color: accentColor, fontSize: 31, fontFamily: "Lato"),
          headline2:
              TextStyle(color: accentColor, fontSize: 26, fontFamily: "Lato"),
          headline3:
              TextStyle(color: accentColor, fontSize: 21, fontFamily: "Lato"),
          headline4: TextStyle(
              color: accentColor, fontSize: 13.sp, fontFamily: "Lato"),
          headline5:
              TextStyle(color: accentColor, fontSize: 13, fontFamily: "Lato"),
          headline6: TextStyle(
              color: accentColor, fontSize: 12.sp, fontFamily: "Lato"),
          subtitle1: TextStyle(
              color: accentColor, fontSize: 20.sp, fontFamily: 'Prata'),
          subtitle2: TextStyle(
              color: accentColor, fontSize: 18.sp, fontFamily: "Prata")),
      backgroundColor: background,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor));
}
