import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/historico_model.dart';
import 'package:ache_facil/models/user_model.dart';
import 'package:ache_facil/screen/widget_perfil/widget_favoritos_itens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class PerfilPage extends StatelessWidget {
  final UserModel model = UserModel();
  var db = DatabaseConnect();
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
            padding: EdgeInsets.only(right: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Meus Favoritos",
                    style: Theme.of(context).textTheme.subtitle2),
                Padding(
                  padding: EdgeInsets.only(
                      left: 2.h, right: 4.h, bottom: 2.h, top: 1.h),
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(FontAwesomeIcons.heartPulse,
                          color: Colors.red[900], size: 4.h)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0.h),
            child: FutureBuilder(
                future: db.getFavorites(),
                builder: ((context, AsyncSnapshot<List> snapshot) {
                  var data = snapshot.data;
                  var datalength = data!.length;
                  return datalength == 0
                      ? const Text("sem historico")
                      : ListView.builder(
                          itemCount: datalength,
                          itemBuilder: (context, index) {
                            return FavoritoItens();
                          });
                })),
          )
        ],
      ),
    );
  }
}
