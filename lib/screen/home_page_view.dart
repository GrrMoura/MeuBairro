import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:ache_facil/screen/widgets_home/widget_box_carousel.dart';
import 'package:ache_facil/screen/widgets_home/widget_serch_home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderHome(),
        SearchHome(),
        BoxCarousel(),
      ],
    );
  }
}
