import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const primaryColor = Color(0xf3FF6700); // Color(0xfff6f6f6);
const accentColor = Colors.black; //Color(0xff16F529);
const intensidade = Colors.black;
const background = Color(0xff16F529);
const colorWhite = Colors.white;
const black = Colors.black;

ThemeData androidTheme() {
  return ThemeData(
      textTheme: TextTheme(
        headline1: const TextStyle(
            color: accentColor, fontSize: 31, fontFamily: "Lato"),
        headline2: const TextStyle(
            color: accentColor, fontSize: 26, fontFamily: "Lato"),
        headline3: GoogleFonts.inter(
            fontSize: 15.sp, color: Colors.white, letterSpacing: 1),
        headline4: GoogleFonts.inter(
            fontSize: 14.sp, color: Colors.white, letterSpacing: 1),
        headline5: GoogleFonts.inter(
            fontSize: 13.sp, color: Colors.white, letterSpacing: 1),
        headline6: GoogleFonts.inter(
            fontSize: 12.sp, color: Colors.white, letterSpacing: 1),
        subtitle2: GoogleFonts.inter(
            fontSize: 20.sp, color: Colors.white, letterSpacing: 1),
        subtitle1: GoogleFonts.inter(
            fontSize: 22.sp, color: Colors.white, letterSpacing: 1),
      ),
      backgroundColor: background,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor));
}
