// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextField extends StatelessWidget {
  final size;
  var model;
  TextEditingController emailCrtl;
  EmailTextField(this.model, this.emailCrtl, this.size, {Key? key})
      : super(key: key);

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
            //mail icon
            const Icon(Icons.mail_rounded, color: black),
            const SizedBox(width: 32),

            //email address textField
            Expanded(
              child: TextField(
                maxLines: 1,
                cursorColor: black,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.inter(
                    fontSize: 14.0, color: black, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: 'Entre com seu email',
                    hintStyle: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: black,
                        fontWeight: FontWeight.w500),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
