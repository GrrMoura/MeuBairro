import 'package:ache_facil/screen/widgets_home/widget_serch_home_page.dart';
import 'package:ache_facil/screen/widgets_home/widget_category_list.dart';
import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:ache_facil/screen/widgets_home/widget_box_carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bairros = ["", "Centro", "Atalaia Nova", "Prisco Viana", "Jatobá"];
  String? value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              const HeaderHome(),
              SearchHome(),
              const CategoryList(),
              BoxCarousel(),
              const Expanded(child: Padding(padding: EdgeInsets.only(top: 30))),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.amber,
                height: 40,
                width: 390,
                child: const Text("ANÚNCIOS"),
              )
            ],
          )),
    );
  }
}
