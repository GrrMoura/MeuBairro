import 'dart:io';
import 'package:ache_facil/models/sessao_model.dart';
import 'package:ache_facil/services/device_services.dart';
import 'package:ache_facil/services/user_services.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:ache_facil/view_models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static Future<void> updatePersonalDates(
      {required BuildContext context, required UserViewModel? model}) async {
    await DeviceServices.checkConnection().then((conectado) async {
      if (conectado) {
        var prefs = await SharedPreferences.getInstance();
        String token = (prefs.getString("tokenDisqueDenuncia") ?? "");
        Cookie cookie = Cookie("tokenDisqueDenuncia", token);

        var header = Options(headers: {
          "Authorization": "Basic $token",
          "cookie": "$cookie",
        });

        var response = await UserServices.updatePersonalDates(model!, header);

        if (response.statusCode == 200) {
          GenericToast.show("${response.data}", backgraoundColor: Colors.blue);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("name", "${model.name}");
          prefs.setString("email", "${model.email}");
          prefs.setString("phone", "${model.phone}");
          //TODO: implementar o sexo no dados pessoais
          prefs.setString("birthDate", "${model.birthdate}");
          //Sessao.fromJson(response?.data.to).setSession(prefs, model);
          Loader.hide();

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const TabsPage()));
        } else {
          Loader.hide();
          GenericToast.show("Erro - ${response.data}");
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
    prefs.setBool("leitorBiometrico", false);
    prefs.setBool("lembrar_me", false);
  }
}
