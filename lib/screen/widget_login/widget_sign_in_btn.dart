import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/screen/default_tab_controller.dart';
import 'package:ache_facil/services/autentiction_service.dart';
import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  var model;
  final _autenticacaoController = AutenticacaoService();

  SignInButton(this.model, {Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutenticacaoService.logar(LoginViewModel(login: "", senha: ""));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TabsPage()),
        // );
      },
      child: Container(
        alignment: Alignment.center,
        height: size.height / 13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: background),
        child: Text(
          'Entrar',
          style: GoogleFonts.inter(
              fontSize: 16.0, color: black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
