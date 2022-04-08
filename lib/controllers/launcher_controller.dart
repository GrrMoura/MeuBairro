import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> link(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      debugPrint("TEXTO PARA DIZER QUE NAO PODE ABRIR O LINK $url");
    }
  }

  static Future<void> email(String email) async {
    final Uri params = Uri(scheme: 'mailto', path: email);
    String urlSetada = params.toString();
    if (await canLaunch(urlSetada)) {
      launch(urlSetada);
    } else {
      debugPrint("TEXTO PARA DIZER QUE NAO PODE ABRIR O LINK $urlSetada");
    }
  }

  static Future<void> whats(String phone) async {
    var whatsappUrl = "whatsapp://send?phone=$phone";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : debugPrint(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}
