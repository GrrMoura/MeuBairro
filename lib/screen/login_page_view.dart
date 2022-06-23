import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/controllers/authentication_controller.dart';
import 'package:ache_facil/controllers/login_controller.dart';

import 'package:ache_facil/services/authentication_service.dart';
import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: prefer_typing_uninitialized_variables

  LoginViewModel? model = LoginViewModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var showPass = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xf3FF6700),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints size) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.maxHeight,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: -34,
                      top: size.maxHeight * 0.20,
                      child: SvgPicture.string(
                        '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                        width: 99.0,
                        height: 99.0,
                      ),
                    ),
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
                    Positioned(
                      top: 40,
                      child: SizedBox(
                        width: mediaQuery.width,
                        height: mediaQuery.height,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQuery.width * 0.06),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //logo section
                              Expanded(
                                flex: 3,
                                child: logo(mediaQuery),
                              ),

                              //continue with email for sign in app text
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Continue com o e-mail para logar no app',
                                  style: style.headline5!.copyWith(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              //  email and password TextField here
                              Expanded(
                                flex: 4,
                                child: Form(
                                  child: Column(
                                    children: [
                                      emailForm(mediaQuery, style),

                                      const SizedBox(height: 8),
                                      passForm(mediaQuery, style)
                                      //  passwordForm(mediaQuery, style),
                                      // const SizedBox(height: 16),
                                      // rememberMeForm(context, style),
                                    ],
                                  ),
                                ),
                              ),

                              //sign in button & continue with text here
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    btnEnter(context, mediaQuery),
                                    const SizedBox(height: 16),
                                    buildContinueText(
                                        style, size.maxHeight * 0.016),
                                  ],
                                ),
                              ),

                              //footer section. google, facebook button and sign up text here
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    facebookEgoogle(mediaQuery),
                                    const SizedBox(height: 16),
                                    buildFooter(size.maxHeight),
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
            ],
          ),
        );
      }),
    );
  }

  Row facebookEgoogle(Size mediaQuery) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //sign in google button
        Container(
          alignment: Alignment.center,
          width: mediaQuery.width / 2.8,
          height: mediaQuery.height / 13,
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
                const SizedBox(width: 16),
                //google txt
                Text('Google',
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),

        //sign in facebook button
        Container(
          alignment: Alignment.center,
          width: mediaQuery.width / 2.8,
          height: mediaQuery.height / 13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 4, color: background),
          ),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                const SizedBox(width: 16),

                //facebook txt
                Text(
                  'Facebook',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell btnEnter(BuildContext context, Size mediaQuery) {
    return InkWell(
      onTap: () {
        validator(context);
        AuthenticationService.logar(LoginViewModel(login: "", senha: ""));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TabsPage()),
        // );
      },
      child: Container(
        alignment: Alignment.center,
        height: mediaQuery.height / 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: background),
        child: Text(
          'Entrar',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Row rememberMeForm(BuildContext context, TextTheme style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<GetxLoginController>(
          builder: (controller) => Checkbox(
            value: controller.remember,
            onChanged: (value) {
              controller.rememberMe();
            },
            checkColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).backgroundColor,
          ),
        ),
        Text('Lembre-me',
            style: style.headline5!.copyWith(color: Colors.white)),
      ],
    );
  }

  Container emailForm(Size mediaQuery, TextTheme style) {
    return Container(
      alignment: Alignment.center,
      height: mediaQuery.height / 15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: background),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //mail icon
            const Icon(Icons.mail_rounded, color: black),
            const SizedBox(width: 16),
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
              color: Colors.black,
            ),
            const SizedBox(width: 16),

            //email address textField
            Expanded(
              child: TextFormField(
                controller: emailController,
                maxLines: 1,
                cursorColor: black,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: style.headline6,
                decoration: InputDecoration(
                    hintText: 'Entre com seu email',
                    hintStyle:
                        style.headline5!.copyWith(fontWeight: FontWeight.w500),
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

  Container passForm(Size mediaQuery, TextTheme style) {
    return Container(
      alignment: Alignment.center,
      height: mediaQuery.height / 15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: background),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //mail icon
            const Icon(Icons.lock, color: black),
            const SizedBox(width: 16),
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
              color: Colors.black,
            ),
            const SizedBox(width: 16),

            //email address textField
            Expanded(
              child: TextFormField(
                controller: passController,
                obscureText: showPass,
                maxLines: 1,
                cursorColor: black,
                keyboardType: TextInputType.text,
                style: style.headline5!,
                decoration: InputDecoration(
                    hintText: 'Entre com sua senha',
                    hintStyle: style.headline5!
                        .copyWith(fontWeight: FontWeight.w500)
                        .copyWith(fontSize: 14),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showPass = !showPass;
                        setState(() {});
                      },
                      icon: Icon(
                          showPass ? Icons.visibility_off : Icons.visibility),
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
            ),
          ],
        ),
      ),
    );
  }

  Column logo(Size mediaQuery) {
    return Column(
      children: [
        Image.asset(
          "assets/images/ponto.png",
          height: mediaQuery.height / 10,
          width: mediaQuery.width / 2,
        ),
        const SizedBox(height: 16),
        richText(23.12),
      ],
    );
  }

  void validator(BuildContext context) {
    // if (!_formKey.currentState!.validate()) {
    //   GenericToast.show(
    //       "Ops!  algo certo não está errado, confira os campos e-mail e senha..",
    //       gravity: ToastGravity.SNACKBAR,
    //       backgraoundColor: Colors.red);
    // } else if (emailCtrl!.text.isEmpty) {
    //   GenericToast.show("Como você vai logar sem o e-mail. ?",
    //       backgraoundColor: Colors.brown);
    // } else if (emailCtrl!.text.length < 5 || !emailCtrl!.text.contains("@")) {
    //   GenericToast.show("ops! E-mail inválido",
    //       gravity: ToastGravity.SNACKBAR, backgraoundColor: Colors.brown);
    // } else if (passwordCtrl!.text.isEmpty) {
    //   GenericToast.show("coloque uma senha.",
    //       gravity: ToastGravity.SNACKBAR, backgraoundColor: Colors.brown);
    // } else if (passwordCtrl!.text.length < 8) {
    //   GenericToast.show("Senha muito pequena, coloque entre 8 e 10 caracteres.",
    //       gravity: ToastGravity.SNACKBAR, backgraoundColor: Colors.brown);
    // } else {
    //   Loader.show(context, overlayColor: Colors.transparent);
    //   AuthenticationController.logar(
    //       context: context, model: LoginViewModel(login: "", senha: ""));
    // }
    Loader.show(context, overlayColor: black.withOpacity(0.5));
    AuthenticationController.logar(
        context: context, model: LoginViewModel(login: "", senha: ""));
  }

  Widget buildContinueText(var style, var size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Expanded(
            child: Divider(
          color: Colors.white,
        )),
        Expanded(
          child: Text(
            'Ou Continue com ',
            style: GoogleFonts.kalam(fontSize: 12.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
            child: Divider(
          color: Colors.white,
        )),
      ],
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.kalam(
          fontSize: 25.12,
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

  Widget buildFooter(var size) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: Text.rich(
          TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white),
            children: [
              TextSpan(
                text: 'Não possui conta ?  ',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white)
                    .copyWith(fontSize: size * 0.016),
              ),
              TextSpan(
                  text: 'Cadastre-se',
                  style: Theme.of(context).textTheme.headline5!.copyWith()),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:ache_facil/screen/widget_login/widget_email_text_field.dart';
// import 'package:ache_facil/screen/widget_login/widget_header.dart';
// import 'package:ache_facil/screen/widget_login/widget_lembrar_senha.dart';
// import 'package:ache_facil/screen/widget_login/widget_password_text_field.dart';
// import 'package:ache_facil/screen/widget_login/widget_sign_in_btn.dart';
// import 'package:ache_facil/screen/widget_login/widget_sign_in_google_face.dart';
// import 'package:ache_facil/view_models/login_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   // ignore: prefer_typing_uninitialized_variables

//   LoginViewModel? model = LoginViewModel();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context).size;
//     final style = Theme.of(context).textTheme;
//     return Scaffold(
//       backgroundColor: const Color(0xf3FF6700),
//       body: LayoutBuilder(builder: (BuildContext context, BoxConstraints size) {
//         return Container(
//           height: mediaQuery.height,
//           width: mediaQuery.width,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: size.maxHeight,
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         left: -34,
//                         top: size.maxHeight * 0.20,
//                         child: SvgPicture.string(
//                           '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
//                           width: 99.0,
//                           height: 99.0,
//                         ),
//                       ),
//                       Positioned(
//                         right: -52,
//                         top: 45.0,
//                         child: SvgPicture.string(
//                           // Group 3177
//                           '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
//                           width: 139.0,
//                           height: 139.0,
//                         ),
//                       ),
//                       Positioned(
//                         top: 8,
//                         child: SizedBox(
//                           width: mediaQuery.width,
//                           height: mediaQuery.height,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: size.maxHeight * 0.03,
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 //logo section
//                                 const HeaderLoginPage(),

//                                 //continue with email for sign in app text
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: size.maxHeight * 0.04),
//                                   child: Text(
//                                     'Continue com o e-mail para logar no app',
//                                     style: style.headline5!.copyWith(
//                                         color: Colors.white,
//                                         fontSize: size.maxHeight * 0.019),
//                                   ),
//                                 ),
//                                 //email and password TextField here
//                                 Form(
//                                   key: _formKey,
//                                   child: Column(
//                                     children: [
//                                       EmailTextField(
//                                           model!,
//                                           "email",
//                                           emailController,
//                                           size.maxHeight,
//                                           size.maxWidth),
//                                       SizedBox(height: size.maxHeight * 0.02),
//                                       PasswordTextField("senha", passController,
//                                           size.maxHeight, size.maxWidth),
//                                       SizedBox(height: size.maxHeight * 0.02),
//                                       BtnRememberMe(),
//                                       SizedBox(height: size.maxHeight * 0.02),
//                                     ],
//                                   ),
//                                 ),

//                                 //sign in button & continue with text here
//                                 SignInButton(model!, _formKey, emailController,
//                                     passController),
//                                 SizedBox(height: size.maxHeight * 0.05),
//                                 buildContinueText(
//                                     style, size.maxHeight * 0.016),

//                                 //footer section. google, facebook button and sign up text here
//                                 SigniInGoogleFacebook(
//                                     size.maxHeight, size.maxWidth),
//                                 SizedBox(height: size.maxHeight * 0.03),
//                                 buildFooter(size.maxHeight),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   Widget buildContinueText(var style, var size) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         SizedBox(
//             width: size * 7,
//             child: const Divider(thickness: 1.2, color: Colors.white)),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: size * 1),
//           child: Text(
//             'Ou Continue Com',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline5!
//                 .copyWith(fontSize: size * 1.1, color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Container(
//             width: size * 7,
//             child: const Divider(thickness: 1.2, color: Colors.white)),
//       ],
//     );
//   }

//   Widget buildFooter(var size) {
//     return Align(
//       alignment: Alignment.center,
//       child: InkWell(
//         onTap: () {},
//         child: Text.rich(
//           TextSpan(
//             style: Theme.of(context)
//                 .textTheme
//                 .headline5!
//                 .copyWith(color: Colors.white),
//             children: [
//               TextSpan(
//                 text: 'Não possui conta ?  ',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline5!
//                     .copyWith(color: Colors.white)
//                     .copyWith(fontSize: size * 0.016),
//               ),
//               TextSpan(
//                   text: 'Cadastre-se',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline5!
//                       .copyWith(fontSize: size * 0.016)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
