import 'package:flutter/cupertino.dart';

const brightness = Brightness.light;
const primaryColor = Color.fromARGB(15, 74, 13, 78);
const accentColor = Color.fromARGB(255, 213, 250, 2);

CupertinoThemeData iosTheme() {
  return const CupertinoThemeData(
    brightness: brightness,
  );
}
