import 'package:ache_facil/screen/widget_search/widget_category_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.only(bottom: 20, top: 10, left: 10, right: 10),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(FontAwesomeIcons.photoFilm, " Fotógrafo"),
          CategoryItem(FontAwesomeIcons.screwdriverWrench, "Mecânico"),
          CategoryItem(FontAwesomeIcons.taxi, " Táxi"),
          CategoryItem(FontAwesomeIcons.computer, "Informática"),
          CategoryItem(FontAwesomeIcons.photoFilm, " Fotógrafo"),
          CategoryItem(FontAwesomeIcons.hammer, "Pedreiro")
        ],
      ),
    );
  }
}
