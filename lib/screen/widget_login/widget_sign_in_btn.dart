import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: background),
      child: Text(
        'Entrar',
        style: GoogleFonts.inter(
            fontSize: 16.0, color: black, fontWeight: FontWeight.w600),
      ),
    );
  }
}
