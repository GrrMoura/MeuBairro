import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/screen/default_tab_controller.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: androidTheme(),
        home: const DefaultTabController(length: 3, child: TabsPage()));
  }
}
