import 'package:ache_facil/services/api_service.dart';
import 'package:ache_facil/services/request_service.dart';
import 'package:dio/dio.dart';

class UserServices {
  static Future<Response> updatePersonalDates(body, Options header) async {
    var url = ApiServices.concatMeuBairroTemtUrl("UPDATE");

    var response = await RequestsServices.postWithOptions(
        url: url, data: body, headers: header);

    return response!;
  }

  // static Future<Response> updatePersonalDates(body, Options header) async {
  //   var url = ApiServices.concatMeuBairroTemtUrl("UPDATE");

  //   var response = await RequestsServices.postWithOptions(
  //       url: url, data: body, headers: header);

  //   return response!;
  // }
}
