import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/screen/default_tab_controller.dart';
import 'package:ache_facil/screen/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: androidTheme(),
          home: DefaultTabController(length: 3, child: TabsPage()));
      //  home: LoginPage());
    });
  }
}
