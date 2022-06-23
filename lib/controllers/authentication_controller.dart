import 'package:ache_facil/models/sessao_model.dart';
import 'package:ache_facil/screen/tabs_page.dart';
import 'package:ache_facil/services/authentication_service.dart';
import 'package:ache_facil/services/device_services.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController {
  static Future<void> logar(
      {required BuildContext context, required LoginViewModel model}) async {
    await DeviceServices.checkConnection().then((conectado) async {
      if (conectado) {
        var response = await AuthenticationService.logar(model);
        if (response?.statusCode == 200) {
          GenericToast.show("${response?.data}", backgraoundColor: Colors.blue);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("name", "Rocha");
          prefs.setString("email", "rocha@gmail.com");
          prefs.setString("phone", "79 991140490");
          prefs.setString("gender", "Masculino");
          prefs.setString("birthDate", "");
          //Sessao.fromJson(response?.data.to).setSession(prefs, model);
          Loader.hide();

          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TabsPage()));
        } else {
          Loader.hide();
          GenericToast.show("Erro - ${response?.data}");
        }
      } else {
        Loader.hide();
        GenericToast.show(
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
    });
  }

  Future<Sessao> getSessao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var sessao = Sessao.getSession(prefs);
    return sessao;
  }

  static Future<void> limparSessao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", "");
    prefs.setString("usuario", "");
    prefs.setInt("id", 0);
    prefs.setBool("alterarSenha", false);
    prefs.setStringList("regrasAcesso", []);
    prefs.setString("cpf", "");
    prefs.setString("senha", "");
    prefs.setBool("leitorBiometrico", false);
    prefs.setBool("lembrar_me", false);
  }
}
