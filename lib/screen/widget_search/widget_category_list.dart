import 'package:ache_facil/screen/widget_search/widget_category_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.9.h),
      height: 12.h,
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
