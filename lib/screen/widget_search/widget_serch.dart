import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SearchPrincipal extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  SearchPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 3.h),
      child: TextFormField(
        onFieldSubmitted: (value) {},
        style: Theme.of(context).textTheme.headline4!.copyWith(color: black),
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 3.h,
        textAlign: TextAlign.left,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(23)
        ],
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.mic,
              size: 3.h,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,
                size: 4.h,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          ),
          hintText: 'Ache aqui',
          hintStyle: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black54),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.h)),
        ),
      ),
    );
  }
}
