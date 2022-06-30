import 'package:ache_facil/screen/widget_search/widget_category_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: 0.9.h, left: 0.9.h, right: 0.9.h, top: 0.9.h),
      height: 11.6.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(FontAwesomeIcons.building, "Orgãos públicos"),
          CategoryItem(FontAwesomeIcons.hospital, "Turismo"),
          CategoryItem(FontAwesomeIcons.building, "Eventos"),
          CategoryItem(FontAwesomeIcons.church, " Igrejas"),
          CategoryItem(FontAwesomeIcons.buildingShield, " Polícia"),
          CategoryItem(FontAwesomeIcons.building, "Orgãos públicos"),
          CategoryItem(FontAwesomeIcons.hospital, "Turismo"),
          CategoryItem(FontAwesomeIcons.building, "Eventos"),
          CategoryItem(FontAwesomeIcons.church, " Igrejas"),
          CategoryItem(FontAwesomeIcons.buildingShield, " Polícia"),
        ],
      ),
    );
  }
}
