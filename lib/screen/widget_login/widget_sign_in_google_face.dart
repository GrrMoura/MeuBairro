import 'package:ache_facil/android/android_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SigniInGoogleFacebook extends StatelessWidget {
  late double heightScreen;
  late double widthScreen;
  SigniInGoogleFacebook(this.heightScreen, this.widthScreen, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: heightScreen * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //sign in google button
          Container(
            alignment: Alignment.center,
            width: widthScreen * 0.366,
            height: heightScreen * 0.06,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 4, color: background),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.google, color: Colors.red),
                  SizedBox(width: widthScreen * 0.042),
                  //google txt
                  Text('Google',
                      style: GoogleFonts.inter(
                          fontSize: heightScreen * 0.019, color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          SizedBox(width: widthScreen * 0.1),

          //sign in facebook button
          Container(
            alignment: Alignment.center,
            width: widthScreen * 0.366,
            height: heightScreen * 0.06,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1.4.h),
              border: Border.all(width: 4, color: background),
            ),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                  SizedBox(width: widthScreen * 0.042),

                  //facebook txt
                  Text(
                    'Facebook',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: heightScreen * 0.019, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
