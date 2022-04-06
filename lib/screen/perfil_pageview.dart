import 'package:ache_facil/screen/widget_perfil%5D/widget_favoritos_itens.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar:
          AppBar(elevation: 0, backgroundColor: Theme.of(context).primaryColor),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Meus Favoritos",
                    style: Theme.of(context).textTheme.subtitle2),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.ac_unit)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              children: [
                FavoritoItens(),
                Card(
                  child: Container(
                      color: Colors.white,
                      height: 200,
                      width: 180,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Seu Madruga",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                          const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage(("assets/images/seuMadruga.jpg"))),
                          const Text("Profissão")
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
