import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/screen/favorite_page_view.dart';
import 'package:ache_facil/screen/home_page_view.dart';
import 'package:ache_facil/screen/perfil_pageview.dart';
import 'package:ache_facil/screen/search_pageview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int? index = 0;

  final screens = [
    HomePage(),
    const SearchPage(),
    FavoritePage(),
    const PerfilPage(),
  ];

  final items = <Widget>[
    const Icon(Icons.home, size: 30),
    const Icon(Icons.search, size: 30),
    const Icon(Icons.heart_broken, size: 30),
    const Icon(Icons.people, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: primaryColor,
        body: screens[index!],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
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
