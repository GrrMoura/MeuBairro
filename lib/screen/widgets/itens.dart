import 'package:ache_facil/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Itens extends StatelessWidget {
  Future<void> _launchLink(String url) async {
    if (!url.contains("@")) {
      debugPrint("NÃO tem @");
      if (await canLaunch(url)) {
        launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        debugPrint("TEXTO PARA DIZER QUE NAO PODE ABRIR O LINK $url");
      }
    } else {
      debugPrint("tem @");

      final Uri emailSetado = Uri(
        scheme: 'mailto',
        path: url,
      );
      launch(emailSetado.toString());
    }
  }

  const Itens({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) => Card(
        shadowColor: Colors.black,
        elevation: 6,
        color: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color(0xffffcb74),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(3.0, 6.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: ExpansionTile(
            controlAffinity: ListTileControlAffinity.trailing,
            leading: Image.network(
              itemModel.photo,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            // trailing: Text(
            //   itemModel.bairro,
            //   style: TextStyle(fontFamily: 'Source Serif Pro'),
            // ),
            title: Text(itemModel.profession),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(itemModel.name),
                Text(
                  itemModel.bairro,
                  textAlign: TextAlign.left,
                )
              ],
            ),
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icons(FontAwesomeIcons.instagram, itemModel.instagram),
                    icons(FontAwesomeIcons.facebookF, "http://www.globo.com"),
                    // icons(FontAwesomeIcons.youtube),
                    icons(FontAwesomeIcons.envelope, itemModel.email),
                    icons(FontAwesomeIcons.phone, "tel:79991140490"),
                    icons(FontAwesomeIcons.whatsapp, itemModel.whatsapp),
                    Container(width: 60),
                    icons(FontAwesomeIcons.heart, "")
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  IconButton icons(IconData icon, String itemModel) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        _launchLink(itemModel);
      },
    );
  }
}
