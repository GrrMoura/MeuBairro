// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatelessWidget {
  final GetxLoginController controller = Get.put(GetxLoginController());

  final size;
  var model; // = loginViewModel;
  PasswordTextField(this.model, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: background),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //lock logo here
            const Icon(Icons.lock, color: black),
            const SizedBox(width: 32),

            //password textField
            Expanded(
                child: GetBuilder<GetxLoginController>(
              builder: (controller) => TextFormField(
                obscureText: controller.showPassword,
                maxLines: 1,
                cursorColor: black,
                keyboardType: TextInputType.text,
                style: GoogleFonts.inter(
                    fontSize: 14.0, color: black, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: 'Entre com sua senha',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: black,
                        fontWeight: FontWeight.w500),
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
                    return "Campo 'senha' é obrigatório";
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
