import 'package:ache_facil/controllers/launcher_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactBotton extends StatelessWidget {
  const ContactBotton({
    Key? key,
    required this.icon,
    required this.itemModel,
    required this.color,
    required this.opcao,
  }) : super(key: key);

  final IconData icon;
  final String itemModel;
  final Color color;
  final String? opcao;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: Icon(
        icon,
        size: 2.h,
      ),
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
