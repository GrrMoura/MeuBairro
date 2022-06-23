import 'package:ache_facil/services/api_service.dart';
import 'package:ache_facil/services/device_services.dart';
import 'package:ache_facil/services/request_service.dart';
import 'package:dio/dio.dart';

import '../view_models/login_view_model.dart';

class AuthenticationService {
  static Future<Response?> logar(LoginViewModel loginViewModel) async {
    var dispositivo = await DeviceServices.carregarInformacoesDispositivo();
    if (dispositivo == null) {
      return Response(
          statusCode: 403,
          statusMessage:
              "Não foi possível carregar informações do dispositivo.\nPor favor, contate os administradores.",
          requestOptions: RequestOptions(path: ""));
    }
    // Iniciar Sessao do aplicativo
    var responseSessaoIniciar = await iniciarSessao(loginViewModel);

    if (responseSessaoIniciar.statusCode == 200) {
      return responseSessaoIniciar;
    }
    return null;
  }

  static Future<Response> iniciarSessao(LoginViewModel loginViewModel) async {
    //var url = ApiServices.concatIntranetUrl("");
    var url = "https://api.adviceslip.com/advice";

    var responseIniciarSessao =
        await RequestsServices.post(url, loginViewModel.toJson());

    return responseIniciarSessao!;
  }

  // static Future<Response> encerrarSessao() async {
  //   var url = ApiServices.concatIntranetUrl("Sessoes/Encerrar");

  //   var dispositivo = await DeviceServices.carregarInformacoesDispositivo();

  //   if (dispositivo == null) {
  //     return Response(
  //         statusCode: 403,
  //         statusMessage:
  //             "Não foi possível carregar informações do dispositivo.\nPor favor, contate os administradores.",
  //         requestOptions: RequestOptions(path: ""));
  //   }

  //   // var responseEncerrarSessao =
  //   //     await RequestsServices.post(url,);

  //   // return responseEncerrarSessao;
  // }
}
