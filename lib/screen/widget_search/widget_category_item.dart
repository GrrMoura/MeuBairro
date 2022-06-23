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
      width: 34.w,
      padding: EdgeInsets.only(right: 1.5.h, top: 1.h),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            elevation: 5,
            splashFactory: InkRipple.splashFactory,
            primary: const Color(0xf3FF6700),
            backgroundColor:
                Theme.of(context).backgroundColor), // const Color(0xfffffafa)),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon, size: 3.5.h),
              Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 8.sp))
            ],
          ),
        ),
      ),
    );
  }
}
