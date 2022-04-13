// ignore_for_file: file_names

import 'package:ache_facil/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxLocalization extends StatelessWidget {
  const BoxLocalization({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
              onPressed: null,
              icon: const Icon(FontAwesomeIcons.locationPin, color: Colors.red),
              label: const Text("Rua Maria Brasilina Cardoso ,n° 94,Centro ")),
          TextButton.icon(
              onPressed: null,
              icon: const Icon(
                FontAwesomeIcons.shop,
                color: Colors.red,
              ),
              label: const Text(
                  " colocar contato aqui")) //TODO: colocar contato aqui
        ],
      ),
    );
  }
}
