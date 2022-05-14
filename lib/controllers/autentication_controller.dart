import 'package:ache_facil/models/sessao_model.dart';
import 'package:ache_facil/screen/home_page_view.dart';
import 'package:ache_facil/services/autentiction_service.dart';
import 'package:ache_facil/services/device_services.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoController {
  Future<void> logar(BuildContext context, LoginViewModel model) async {
    model.ocupado = true;

    await DeviceServices.checkConnection().then((conectado) async {
      if (conectado) {
        var response = await AutenticacaoService.logar(model);
        if (response!.statusCode != 200) {
          GenericToast.show("Erro - ${response.statusMessage}", duracao: 3);
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Sessao.fromJson(response.data).setSession(prefs, model);

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        }
      } else {
        GenericToast.show(
            "Sem conexão com a internet. Estabeleça uma conexão e tente novamente.");
      }
      model.ocupado = false;
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
