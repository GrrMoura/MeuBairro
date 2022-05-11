import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLoginPage extends StatelessWidget {
  const HeaderLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/ponto.png", height: 120),
        const SizedBox(height: 16),
        richText(23.12),
      ],
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: 23.12,
          color: Colors.white,
          letterSpacing: 1.999999953855673,
        ),
        children: const [
          TextSpan(
            text: 'Meu Bairro',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'TEM',
            style: TextStyle(
              color: background,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
