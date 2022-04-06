import 'package:ache_facil/screen/widgets_home/widget_category_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
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
