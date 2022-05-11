import 'package:ache_facil/screen/widget_login/widget_email_text_field.dart';
import 'package:ache_facil/screen/widget_login/widget_header.dart';
import 'package:ache_facil/screen/widget_login/widget_lembrar_senha.dart';
import 'package:ache_facil/screen/widget_login/widget_password_text_field.dart';
import 'package:ache_facil/screen/widget_login/widget_sign_in_btn.dart';
import 'package:ache_facil/screen/widget_login/widget_sign_in_google_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var model;
  // LoginModel loginModel = LoginModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xf3FF6700),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              //left side background design. I use a svg image here
              Positioned(
                left: -34,
                top: 181.0,
                child: SvgPicture.string(
                  // Group 3178
                  '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 99.0,
                  height: 99.0,
                ),
              ),

              //right side background design. I use a svg image here
              Positioned(
                right: -52,
                top: 45.0,
                child: SvgPicture.string(
                  // Group 3177
                  '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  width: 139.0,
                  height: 139.0,
                ),
              ),

              //content ui
              Positioned(
                top: 8.0,
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.06),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //logo section
                        const Expanded(flex: 3, child: HeaderLoginPage()),

                        //continue with email for sign in app text
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Continue com o e-mail para logar no app',
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        //email and password TextField here
                        Expanded(
                          flex: 4,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                EmailTextField(model, emailController, size),
                                const SizedBox(height: 8),
                                PasswordTextField(_formKey, size),
                                const SizedBox(height: 16),
                                BtnRememberMe()
                              ],
                            ),
                          ),
                        ),

                        //sign in button & continue with text here
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SignInButton(model, size: size),
                              const SizedBox(height: 20),
                              buildContinueText(),
                            ],
                          ),
                        ),

                        //footer section. google, facebook button and sign up text here
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SigniInGoogleFacebook(size: size),
                              const SizedBox(height: 16),
                              buildFooter(size),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRemember(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Checkbox(value: true, onChanged: (newValue) {}),
        Text(
          'Lembre-me',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget buildContinueText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Expanded(
            child: Divider(
          thickness: 1.2,
          color: Colors.white,
        )),
        Expanded(
          child: Text(
            'Ou Continue Com',
            style: GoogleFonts.inter(fontSize: 12.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(child: Divider(thickness: 1.2, color: Colors.white)),
      ],
    );
  }

  Widget buildFooter(Size size) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.nunito(fontSize: 16.0, color: Colors.white),
          children: [
            TextSpan(
              text: 'Não possui conta  ? ',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'Cadastre-se',
              style: GoogleFonts.nunito(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
