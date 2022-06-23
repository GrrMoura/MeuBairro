import 'package:ache_facil/services/api_service.dart';
import 'package:ache_facil/services/request_service.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:ache_facil/view_models/search_view_model.dart';
import 'package:dio/dio.dart';

class SearchService {
  static Future<Response> search(SearchViewModel model) async {
    var url = ApiServices.concatMeuBairroTemtUrl("ConsultaVeicular/Completa");

    var response = await RequestsServices.post(url, model.toJson());

    if (response!.statusCode != 200) {
      GenericToast.show("erro - ${response.statusMessage}");
    }

    return response;
  }
}
