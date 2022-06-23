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
        headline2: GoogleFonts.kalam(
            fontSize: 18.sp, color: Colors.black, letterSpacing: 1),
        headline3: GoogleFonts.kalam(
            fontSize: 15.sp, color: Colors.black, letterSpacing: 1),
        headline4: GoogleFonts.kalam(
            fontSize: 13.sp, color: Colors.black, letterSpacing: 1),
        headline5: GoogleFonts.kalam(
            fontSize: 11.sp, color: Colors.black, letterSpacing: 1),
        headline6: GoogleFonts.kalam(
            fontSize: 9.sp, color: Colors.black, letterSpacing: 1),
        subtitle2: GoogleFonts.kalam(
            fontSize: 20.sp, color: Colors.black, letterSpacing: 1),
        subtitle1: GoogleFonts.kalam(
            fontSize: 22.sp, color: Colors.black, letterSpacing: 1),
      ),
      backgroundColor: background,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor));
}
