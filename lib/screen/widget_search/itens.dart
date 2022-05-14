import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/favorite_model.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:ache_facil/screen/detail_item_pageView.dart';
import 'package:ache_facil/util/widget_contact_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Itens extends StatefulWidget {
  const Itens({Key? key, required this.itemModel}) : super(key: key);

  final ItemModel itemModel;

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends State<Itens> {
  var db = DatabaseConnect();

  final double circleRadius = 10.h;

  final double circleBorderWidth = 1.h;
  Color color = const Color(0xff16F529);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: circleRadius / 2),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 1.5.h),
              shadowColor: black,
              elevation: 2.h,
              color: background,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.1.h, vertical: 1.h),
                child: ExpansionTile(
                  iconColor: black,
                  onExpansionChanged: (value) {
                    setState(() {
                      if (value) {
                        color = Colors.white;
                      } else {
                        color = background;
                      }
                    });
                  },
                  title: Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailItemPage(widget.itemModel)));
                          },
                          child: Text(widget.itemModel.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: black)),
                        ),
                        Text(widget.itemModel.profession,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 9.sp)
                                .copyWith(color: black)),
                      ],
                    ),
                  ),
                  children: [
                    Row(
                      //TODO: fazer esses botoes em uma classe unica
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ContactBotton(
                            icon: FontAwesomeIcons.instagram,
                            itemModel: widget.itemModel.instagram,
                            color: Colors.red,
                            opcao: "link"),
                        ContactBotton(
                            icon: FontAwesomeIcons.phone,
                            itemModel: "tel:${widget.itemModel.phone}",
                            color: Colors.black,
                            opcao: "link"),
                        ContactBotton(
                            icon: FontAwesomeIcons.facebookF,
                            itemModel: widget.itemModel.facebook,
                            color: Colors.blue,
                            opcao: "link"),
                        ContactBotton(
                            icon: FontAwesomeIcons.envelope,
                            itemModel: widget.itemModel.email,
                            color: Colors.black,
                            opcao: "email"),
                        ContactBotton(
                            icon: FontAwesomeIcons.whatsapp,
                            itemModel: widget.itemModel.whatsapp,
                            color: Colors.black,
                            opcao: "whats"),
                        Container(width: 18.w),
                        IconButton(
                            onPressed: () {
                              db.insertFavorite(FavoriteModel(
                                  idItem: widget.itemModel.id,
                                  facebook: widget.itemModel.facebook,
                                  instagram: widget.itemModel.instagram,
                                  whatsapp: widget.itemModel.whatsapp,
                                  name: widget.itemModel.name,
                                  profession: widget.itemModel.profession,
                                  city: widget.itemModel.city,
                                  state: widget.itemModel.state,
                                  district: widget.itemModel.district,
                                  phone: widget.itemModel.phone,
                                  photo: widget.itemModel.photo,
                                  email: widget.itemModel.email));
                            },
                            icon: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                              size: 2.5.h,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 4.5.h,
            top: 13.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.itemModel.district,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 9.sp)
                        .copyWith(color: black)),
              ],
            ),
          ),
          Positioned(
            left: 2.4.h,
            top: 2.0.h,
            child: Imagebox(
                itemModel: widget.itemModel,
                circleRadius: circleRadius,
                circleBorderWidth: circleBorderWidth,
                color: color),
          )
        ],
      );
}

class Imagebox extends StatelessWidget {
  const Imagebox({
    Key? key,
    required this.color,
    required this.itemModel,
    required this.circleRadius,
    required this.circleBorderWidth,
  }) : super(key: key);

  final ItemModel itemModel;
  final double circleRadius;
  final double circleBorderWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailItemPage(itemModel),
          ),
        );
      },
      child: Container(
        width: circleRadius,
        height: circleRadius,
        decoration: ShapeDecoration(shape: const CircleBorder(), color: color),
        child: Padding(
          padding: EdgeInsets.all(circleBorderWidth),
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(itemModel.photos![0]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
