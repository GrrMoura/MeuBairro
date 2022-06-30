// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
  final GetxLoginController controller = Get.put(GetxLoginController());

  final String title;
  TextEditingController ctrl;
  var heightScren;
  var widthScren;
  PasswordTextField(this.title, this.ctrl, this.heightScren, this.widthScren,
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
            //lock logo here
            const Icon(Icons.lock, color: black),
            SizedBox(width: widthScren * 0.10),

            //password textField
            Expanded(
                child: GetBuilder<GetxLoginController>(
              builder: (controller) => TextFormField(
                controller: ctrl,
                cursorHeight: heightScren * 0.03,
                obscureText: controller.showPassword,
                maxLines: 1,
                cursorColor: black,
                keyboardType: TextInputType.text,
                style: style.headline4!.copyWith(fontSize: heightScren * 0.025),
                decoration: InputDecoration(
                    hintText: 'Entre com sua senha',
                    hintStyle:
                        style.headline4!.copyWith(fontSize: heightScren * 0.02),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.showPass();
                      },
                      icon: Icon(
                        controller.showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    border: InputBorder.none),
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (value.length < 6) {
                    return null;
                  }
                  return null;
                },
                onSaved: (value) {
                  //   GetxLoginController.setSenha(val);
                  //  widget.model.senha = val;
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
