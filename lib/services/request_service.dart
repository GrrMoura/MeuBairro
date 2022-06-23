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

  // // static Future<Response> resetarSenhaService(
  // //     String url, ResetarSenhaViewModel data) async {
  // //   try {
  // //     Dio dio = Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 60000));

  // //     var response = await dio.post(url, data: data);

  // //     return response;
  // //   } on DioError catch (e) {
  // //     if (e.response != null) {
  // //       return e.response;
  // //     } else {
  // //       if (e.type == DioErrorType.connectTimeout ||
  // //           e.type == DioErrorType.receiveTimeout) {
  // //         return Response(statusCode: 504, requestOptions: null);
  // //       } else {
  // //         return Response(statusCode: 403, requestOptions: null);
  // //       }
  // //     }
  // //   }
  // }
}
