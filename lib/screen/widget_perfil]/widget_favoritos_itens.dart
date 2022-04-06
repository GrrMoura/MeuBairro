import 'package:flutter/material.dart';

class FavoritoItens extends StatelessWidget {
  FavoritoItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Text(
              " itemModel.name",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(("assets/images/seuMadruga.jpg"))),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10),
            child: Text(
              " itemModel.profession",
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      ),
    );
  }
}
