import 'package:ache_facil/data/repositorio.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:ache_facil/screen/home_page_view.dart';
import 'package:ache_facil/screen/perfil_pageview.dart';
import 'package:ache_facil/screen/search_pageview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsPage extends StatelessWidget {
  TabsPage({Key? key}) : super(key: key);
  final List<ItemModel> itemModel = allItens;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          const HomePage(),
          const SearchPage(),
          PerfilPage(),
        ],
      ),
      bottomNavigationBar: const TabBar(
        tabs: [
          Tab(icon: Icon(FontAwesomeIcons.house)),
          Tab(icon: Icon(FontAwesomeIcons.magnifyingGlass)),
          Tab(icon: Icon(FontAwesomeIcons.user))
        ],
        indicatorWeight: 0.1,
        indicatorColor: Colors.red,
        labelColor: Colors.red,
        indicatorPadding: EdgeInsets.all(8),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.black54,
      ),
    );
  }
}
