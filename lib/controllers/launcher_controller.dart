import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> link(String url) async {
    final Uri newUri = Uri.parse(url);
    await canLaunch(newUri);
  }

  static Future<void> email(String email) async {
    final Uri newUri = Uri(scheme: 'mailto', path: email);
    await canLaunch(newUri);
  }

  static Future<void> whats(String phone) async {
    String whatsMessage = "Olá, tudo bem?\nte achei no app meu BairroTem. ";
    Uri newUri = Uri.parse("https://wa.me/$phone/?text=$whatsMessage");

    await canLaunch(newUri);
  }

  static Future<void> canLaunch(Uri newUri) async {
    if (!await canLaunchUrl(newUri)) {
      launchUrl(newUri);
    } else {
      GenericToast.show("Não foi possível abrir o link");
    }
  }
}
