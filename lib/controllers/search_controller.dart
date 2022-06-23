import 'package:ache_facil/services/device_services.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:ache_facil/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class GetxSearchController extends GetxController {
  bool showBairro = true;
}

class SearchController {
  Future<void> fazerPesquisa(
      BuildContext context, SearchViewModel model) async {
    await DeviceServices.checkConnection().then((conectado) async {
      if (conectado) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // var userSesion = Sessao.getSession(prefs);
        // var response = await SearchService.search(model);
      } else {
        GenericToast.show("sem conexão com a intenet");
      }
    });
  }
}
