import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SobreBox extends StatelessWidget {
  const SobreBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(2.h)),
      padding: EdgeInsets.all(2.h),
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2.h, 0, 2.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sobre",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        ],
      ),
    );
  }
}
