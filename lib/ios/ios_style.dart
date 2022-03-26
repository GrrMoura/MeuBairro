import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xffaacff);
const accentColor = Color.fromARGB(255, 213, 250, 2);

CupertinoThemeData IosTheme() {
  return const CupertinoThemeData(
    brightness: brightness,
  );
}
