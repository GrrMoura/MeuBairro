import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.h, top: 5.h, right: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá,\nZé Ramalho",
                  style: Theme.of(context).textTheme.subtitle2),
              CircleAvatar(
                radius: 8.h,
                backgroundImage: const AssetImage("assets/images/ze.jpg"),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7.h, 9.h, 3.h, 2.h),
          child: Text(
            "Precisa de profissional ou comércio?",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
