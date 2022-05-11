import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  IconData icon;
  String label;
  CategoryItem(this.icon, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      padding: EdgeInsets.only(
        left: 2.h,
        top: 2.h,
      ),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            elevation: 5,
            splashFactory: InkRipple.splashFactory,
            primary: const Color(0xf3FF6700),
            backgroundColor:
                Theme.of(context).backgroundColor), // const Color(0xfffffafa)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon, size: 3.h),
              SizedBox(height: 0.5.h),
              Text(
                label,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
