import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CompetenciaBox extends StatelessWidget {
  const CompetenciaBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadiusDirectional.circular(2.h)),
      padding: EdgeInsets.all(2.h),
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2.h, 1.h, 2.h, 1.5.h),
      child: Wrap(
        spacing: 2.h,
        children: const [
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: null,
            child: Text("Ferro"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Ferro"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Calças"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Arma "),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("sanduiche"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Ladrão Fino"),
          ),
        ],
      ),
    );
  }
}
