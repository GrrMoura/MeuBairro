import 'package:ache_facil/view_models/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sessao {
  String? tokenSessao;
  String? usuario;
  int? id;
  String? cpf;

  Sessao({this.tokenSessao, this.usuario, this.id, this.cpf});

  Sessao.fromJson(Map<String, dynamic> json) {
    tokenSessao = json['token'];
    usuario = json['usuario'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = tokenSessao;
    data['usuario'] = usuario;
    data['id'] = id;

    return data;
  }

  Sessao.getSession(SharedPreferences prefs) {
    tokenSessao = prefs.getString("token") ?? "";
    usuario = prefs.getString('usuario') ?? "";
    id = prefs.getInt('id') ?? 0;
    cpf = prefs.getString("cpf") ?? "";
  }

  void setSession(SharedPreferences prefs, LoginViewModel model) {
    prefs.setString("token", tokenSessao!);
    prefs.setString("usuario", usuario!);
    prefs.setInt("id", id!);
    prefs.setString("cpf", model.login!);
  }

  void clearSession(SharedPreferences prefs) {
    prefs.setString("token", "");
    prefs.setString("usuario", "");
    prefs.setInt("id", 1);
  }
}
