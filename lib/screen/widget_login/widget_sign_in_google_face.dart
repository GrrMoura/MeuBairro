import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SigniInGoogleFacebook extends StatelessWidget {
  const SigniInGoogleFacebook({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //sign in google button
        Container(
          alignment: Alignment.center,
          width: size.width / 2.8,
          height: size.height / 13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 0.5.h, color: background),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.google, color: Colors.red),
              const SizedBox(width: 16),
              //google txt
              Text('Google',
                  style: GoogleFonts.inter(fontSize: 14.0, color: Colors.black),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        const SizedBox(width: 16),

        //sign in facebook button
        Container(
          alignment: Alignment.center,
          width: size.width / 2.8,
          height: size.height / 13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 0.5.h, color: background),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
              const SizedBox(width: 16),

              //facebook txt
              Text(
                'Facebook',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 14.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
