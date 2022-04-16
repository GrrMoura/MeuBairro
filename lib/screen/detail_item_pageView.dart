// ignore_for_file: file_names

import 'package:ache_facil/screen/widget_detalhes/widget_competencia_box.dart';
import 'package:ache_facil/screen/widget_detalhes/widget_sobre_box.dart';
import 'package:flutter/material.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:ache_facil/screen/widget_detalhes/widget_Loclization_box.dart';
import 'package:ache_facil/screen/widget_detalhes/widget_header_box.dart';
import 'package:sizer/sizer.dart';

class DetailItemPage extends StatelessWidget {
  final ItemModel itemModel;
  const DetailItemPage(this.itemModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconTheme.of(context),
          backgroundColor: Theme.of(context).primaryColor),
      body: Column(
        children: [
          HeaderCard(itemModel: itemModel),
          BoxLocalization(itemModel: itemModel),
          const CompetenciaBox(),
          SizedBox(
            height: 34.2.h,
            child: ListView(
              children: const [SobreBox()],
            ),
          ),
          Container(
            color: Colors.amber,
            height: 4.5.h,
            width: double.infinity,
            child: const Text("ANÚNCIOS"),
          )
        ],
      ),
    );
  }
}
