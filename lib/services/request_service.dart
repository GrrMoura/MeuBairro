import 'package:dio/dio.dart';

class RequestsServices {
  static Future<Response?> post(String url, Map<String, dynamic> data) async {
    try {
      Dio dio = Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 60000));
      var response = await dio.get(url);
      //var response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      // FirebaseCrashlytics.instance.setCustomKey(
      //     "status_code", e.response?.statusCode.toString() ?? "null");
      // FirebaseCrashlytics.instance.setCustomKey("tipo", e.type.toString());
      // FirebaseCrashlytics.instance
      //     .setCustomKey("mensagem", e.message.toString());
      // FirebaseCrashlytics.instance.setCustomKey("exeção", e.toString());
      // FirebaseCrashlytics.instance.recordError(e, null); //para pegar erros http

      if (e.response != null) {
        return e.response;
      } else {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Response(
              statusCode: 504,
              requestOptions: e.error,
              statusMessage: "tempo execidido");
        } else {
          return Response(
              statusCode: 403,
              requestOptions: e.error,
              statusMessage: "não foi possível conectar-se ao servidor");
        }
      }
    }
  }

  static Future<Response?> postWithOptions(
      {required String url,
      Map<dynamic, dynamic>? data,
      Options? headers}) async {
    try {
      Dio dio =
          new Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 60000));
      var response = await dio.post(url, data: data, options: headers);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // pegaErrosDio(e, e.response.statusMessage);
        return e.response;
      } else {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          var response = Response(
              statusCode: 504,
              requestOptions: RequestOptions(path: ""),
              statusMessage:
                  "Tempo para tentativa de conexão excedido, caso o erro persista entre em contato com a DTI");
          // pegaErrosManipulados(response.statusCode.toString(), e.type,
          //     response.statusMessage, e);
          return response;
        } else {
          var response = Response(
              statusCode: 403,
              requestOptions: RequestOptions(path: ""),
              statusMessage:
                  "Não foi possível estabelecer conexão com o servidor do Disque denúncia, por favor, verifique se a internet é nula ou limitada e tente novamente");
          // pegaErrosManipulados(response.statusCode.toString(), e.type,
          //     response.statusMessage, e);
          return response;
        }
      }
    }
  }
}
