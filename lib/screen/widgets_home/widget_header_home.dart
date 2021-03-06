import 'package:ache_facil/data/sflite.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderHome extends StatelessWidget {
  final db = DatabaseConnect(); //troquei var por final
  HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.h, right: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá,\nZé Ramalho",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white)),
              CircleAvatar(
                radius: 7.h,
                backgroundImage: const AssetImage("assets/images/ze.jpg"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
