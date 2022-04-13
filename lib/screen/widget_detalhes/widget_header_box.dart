import 'package:ache_facil/models/item_model.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10)),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 9, spreadRadius: 2)
                  ],
                  image: DecorationImage(
                      image: NetworkImage(itemModel.photos![0]),
                      fit: BoxFit.fitHeight),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    itemModel.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Text(
                  itemModel.profession,
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
