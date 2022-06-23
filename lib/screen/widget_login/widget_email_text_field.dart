// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmailTextField extends StatelessWidget {
  LoginViewModel model;
  var heightScren;
  var widthScren;
  String title;
  TextEditingController ctlr;

  EmailTextField(
      this.model, this.title, this.ctlr, this.heightScren, this.widthScren,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      height: heightScren * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.5.h), color: background),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScren * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //mail icon
            const Icon(Icons.mail_rounded, color: black),
            SizedBox(width: widthScren * 0.10),

            //email address textField
            Expanded(
              child: TextFormField(
                controller: ctlr,
                maxLines: 1,
                cursorColor: black,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: style.headline4!.copyWith(fontSize: heightScren * 0.025),
                decoration: InputDecoration(
                    hintText: 'Entre com seu email',
                    hintStyle: style.headline4!
                        .copyWith(fontSize: heightScren * 0.025),
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.length < 5 || !value.contains("@")) {
                    return null;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
