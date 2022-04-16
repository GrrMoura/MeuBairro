import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:ache_facil/screen/widgets_home/widget_box_carousel.dart';
import 'package:ache_facil/screen/widgets_home/widget_serch_home_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            const HeaderHome(),
            SearchHome(),
            BoxCarousel(),
            Container(
              color: Colors.amber,
              height: 4.5.h,
              width: double.infinity,
              child: const Text("ANÚNCIOS"),
            )
          ],
        ));
  }
}
