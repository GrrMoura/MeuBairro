import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/user_model.dart';
import 'package:ache_facil/screen/widget_search/widget_serch.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'shared_widget/widget_favoritos_itens.dart';

class PerfilPage extends StatelessWidget {
  final UserModel model = UserModel();
  final db = DatabaseConnect();

  PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
