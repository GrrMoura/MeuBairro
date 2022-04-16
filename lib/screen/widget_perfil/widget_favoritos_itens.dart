import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class FavoritoItens extends StatelessWidget {
  const FavoritoItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 24.h,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.5.h)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.h),
              child: Text(
                "Professor Girafales*", //TODO: NOME MÁXIMO 19 LETRAS
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            CircleAvatar(
                radius: 5.5.h,
                backgroundImage:
                    const AssetImage(("assets/images/seuMadruga.jpg"))),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Luva de pedreiro",
                      style: Theme.of(context).textTheme.headline6),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.trash,
                          size: 2.h, color: Colors.red))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
