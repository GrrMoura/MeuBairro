import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritoItens extends StatelessWidget {
  const FavoritoItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 195,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Text(
                "Professor Girafales*", //TODO: NOME MÁXIMO 19 LETRAS
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(("assets/images/seuMadruga.jpg"))),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Luva de pedreiro",
                      style: Theme.of(context).textTheme.headline4),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.trash,
                          size: 14, color: Colors.red))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
