import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/user_model.dart';
import 'package:ache_facil/screen/widget_perfil/widget_favoritos_itens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class PerfilPage extends StatelessWidget {
  final UserModel model = UserModel();
  final db = DatabaseConnect();

  PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 4.h),
                child: Text("Meus Favoritos",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: black)),
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(FontAwesomeIcons.heartPulse,
                      color: background, size: 4.h)),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconTheme.of(context).copyWith(color: black)),
      drawer: const Drawer(backgroundColor: Colors.white),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0.h),
            child: FutureBuilder(
                future: db.getFavorites(),
                builder: ((context, AsyncSnapshot snapshot) {
                  var data = snapshot.data;
                  var dataLength = 0;
                  if (snapshot.hasData) {
                    dataLength = data!.length;
                  }
                  return SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                        itemCount: dataLength,
                        itemBuilder: (context, index) {
                          return FavoritoItens(data[index]);
                        }),
                  );
                })),
          )
        ],
      ),
    );
  }
}
