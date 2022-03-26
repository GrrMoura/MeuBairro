import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/screen/home_page_view.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: androidTheme(),
      home: HomePage(),
    );
  }
}
