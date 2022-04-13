import 'package:ache_facil/models/user_model.dart';
import 'package:ache_facil/screen/widget_perfil/widget_favoritos_itens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfilPage extends StatelessWidget {
  final UserModel model = UserModel();
  PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconTheme.of(context)),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Meus Favoritos",
                    style: Theme.of(context).textTheme.subtitle2),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 45, right: 35, bottom: 20, top: 10),
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(FontAwesomeIcons.heartPulse,
                          color: Colors.red, size: 40)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Wrap(
              children: const [
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens(),
                FavoritoItens()
              ],
            ),
          )
        ],
      ),
    );
  }
}
