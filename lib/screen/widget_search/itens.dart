import 'package:ache_facil/controllers/launcher_controller.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/favorite_model.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:ache_facil/screen/detail_item_pageView.dart';
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

  final double circleRadius = 13.h;

  final double circleBorderWidth = 1.h;
  Color color = const Color(0xff16F529);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: circleRadius / 2),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
              shadowColor: Colors.black,
              elevation: 2.h,
              color: Theme.of(context).backgroundColor,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.1.h, vertical: 2.h),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      if (value) {
                        color = Colors.white;
                      } else {
                        color = Theme.of(context).backgroundColor;
                      }
                    });
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            style: Theme.of(context).textTheme.subtitle2),
                      ),
                      Text(widget.itemModel.profession,
                          style: Theme.of(context).textTheme.headline4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(widget.itemModel.district,
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    ],
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        icons(FontAwesomeIcons.instagram,
                            widget.itemModel.instagram, Colors.red, "link"),
                        icons(
                            FontAwesomeIcons.phone,
                            "tel:${widget.itemModel.phone}",
                            Colors.black,
                            "link"),
                        icons(FontAwesomeIcons.facebookF,
                            widget.itemModel.facebook, Colors.blue, "link"),
                        icons(FontAwesomeIcons.envelope, widget.itemModel.email,
                            Colors.black, "email"),
                        icons(FontAwesomeIcons.whatsapp,
                            widget.itemModel.whatsapp, Colors.green, "whats"),
                        Container(width: 18.w),
                        IconButton(
                            onPressed: () {
                              db.insertFavorite(FavoriteModel(
                                  idItem: widget.itemModel.id,
                                  name: widget.itemModel.name,
                                  profession: widget.itemModel.profession,
                                  city: widget.itemModel.city,
                                  state: widget.itemModel.state,
                                  district: widget.itemModel.district,
                                  phone: widget.itemModel.phone,
                                  email: widget.itemModel.email));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 2.4.h,
            top: 3.h,
            child: Imagebox(
                itemModel: widget.itemModel,
                circleRadius: circleRadius,
                circleBorderWidth: circleBorderWidth,
                color: color),
          )
        ],
      );

  IconButton icons(IconData icon, String itemModel, Color color,
      [String? opcao]) {
    return IconButton(
      color: color,
      icon: Icon(icon),
      onPressed: () {
        switch (opcao) {
          case "link":
            Launcher.link(itemModel);
            break;
          case "whats":
            Launcher.whats(itemModel);
            break;
          case "email":
            Launcher.email(itemModel);
            break;
        }
      },
    );
  }
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
