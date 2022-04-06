import 'package:ache_facil/model/item_model.dart';
import 'package:ache_facil/screen/detail_item_pageView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Itens extends StatefulWidget {
  const Itens({Key? key, required this.itemModel}) : super(key: key);

  final ItemModel itemModel;

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends State<Itens> {
  final double circleRadius = 100.0;

  final double circleBorderWidth = 8.0;
  Color color = const Color(0xffE9E4D4);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shadowColor: Colors.black,
              elevation: 6,
              color: const Color(0xffE9E4D4),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      if (value) {
                        color = Colors.red;
                      } else {
                        color = const Color(0xffE9E4D4);
                      }
                    });
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.itemModel.name,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        widget.itemModel.profession,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemModel.bairro,
                            style: Theme.of(context).textTheme.headline3,
                          ),
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
                        Container(width: 60),
                        icons(FontAwesomeIcons.heart, "favorited", Colors.red)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 10,
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
            // Launcher.link(itemModel);
            break;
          case "whats":
            //    Launcher.whats(itemModel);
            break;
          case "email":
            //     Launcher.email(itemModel);
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
                image: NetworkImage(itemModel.photo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
