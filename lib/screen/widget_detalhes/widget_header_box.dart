import 'package:ache_facil/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          borderRadius: BorderRadiusDirectional.circular(2.h)),
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(1.h, 1.h, 0, 1.h),
            child: Container(
              height: 15.5.h,
              width: 14.h,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 9, spreadRadius: 2)
                  ],
                  image: DecorationImage(
                      image: NetworkImage(itemModel.photos![0]),
                      fit: BoxFit.fitHeight),
                  borderRadius: BorderRadius.all(Radius.circular(2.h))),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2.h),
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
