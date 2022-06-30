import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/controllers/authentication_controller.dart';
import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  LoginViewModel model;

  TextEditingController? emailCtrl;
  TextEditingController? passwordCtrl;
  //ver qual o tipo de model
  // final _autenticacaoController = AutenticacaoService();

  SignInButton(this.model, this.emailCtrl, this.passwordCtrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        validator(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 5.5.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: background),
        child: Text(
          'Entrar',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }

  void validator(BuildContext context) {
    Loader.show(context, overlayColor: black.withOpacity(0.5));
    AuthenticationController.logar(
        context: context, model: LoginViewModel(login: "", senha: ""));
  }
}
