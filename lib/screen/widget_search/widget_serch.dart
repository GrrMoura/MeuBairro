import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SearchPrincipal extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SearchPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          color: Colors.white,
          border: Border.all(color: background, width: 0.5.h)),
      margin: EdgeInsets.symmetric(horizontal: 3.h),
      child: TextFormField(
        key: _formKey,
        onTap: (() {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        }),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) {
          print("Aqui o código de pesquisa");
        },
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black, height: 0.25.h),
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 4.h,
        textAlign: TextAlign.center,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(23)
        ],
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(FontAwesomeIcons.x,
              size: 2.h,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,
                size: 4.h,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          ),
          hintText: 'Encontre aqui',
          hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black54,
              ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.h)),
        ),
      ),
    );
  }
}
