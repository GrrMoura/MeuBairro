// ignore_for_file: file_names

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class BoxLocalization extends StatelessWidget {
  const BoxLocalization({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadiusDirectional.circular(2.h)),
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2.h, 0.5.h, 2.h, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: null,
            icon: Icon(FontAwesomeIcons.mapLocation,
                color: primaryColor, size: 3.8.h),
            label: Text("Rua Maria Brasilina Cardoso ,n° 94,Centro ",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
