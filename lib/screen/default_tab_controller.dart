import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/screen/home_page_view.dart';
import 'package:ache_facil/screen/perfil_pageview.dart';
import 'package:ache_facil/screen/search_pageview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int? index = 0;

  final screens = [
    const HomePage(),
    const SearchPage(),
    PerfilPage(),
  ];

  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.search, size: 30),
    const Icon(Icons.people, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.1,
        ),
        backgroundColor: primaryColor,
        body: screens[index!],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: primaryColor,
          color: background,
          animationDuration: const Duration(milliseconds: 300),
          items: items,
          height: 60,
          index: index!,
          onTap: (index) {
            setState(() => this.index = index);
          },
        ));
  }
}
