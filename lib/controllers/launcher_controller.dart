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
    String whatsMessage = "Olá, tudo bem?\nte achei no app meu BairroTem. ";
    String whatsAppUrl = "https://wa.me/$phone/?text=$whatsMessage";

    await canLaunch(whatsAppUrl)
        ? launch(whatsAppUrl)
        : debugPrint(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}
