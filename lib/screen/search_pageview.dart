import 'package:ache_facil/controllers/search_controller.dart';
import 'package:ache_facil/data/repositorio.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:ache_facil/screen/widget_search/itens.dart';
import 'package:ache_facil/screen/widget_search/search_bairro.dart';
import 'package:ache_facil/screen/widget_search/widget_category_list.dart';
import 'package:ache_facil/screen/widget_search/widget_serch.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchContorller = Get.put(GetxSearchController());

  late List<ItemModel> itens;

  @override
  void initState() {
    super.initState();

    itens = allItens;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(1.h, 5.h, 1.h, 1.h),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.5.h)),
              margin: EdgeInsets.only(top: 2.h),
              width: double.infinity,
              child: const CategoryList()),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(3.2.h, 4.h, 3.h, 2.h),
          child: Text(
            "Precisa de serviço ou comércio ?",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
        ),
        SearchPrincipal(),
        searchContorller.showBairro == false
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: SearchBairro(
                    text: "bairro",
                    onChanged: (_) {},
                    hintText: "Escolha o bairro"),
              )
            : Container(),
        Expanded(
            child: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            final item = itens[index];

            return Itens(itemModel: item);
          },
        )),
      ],
    );
  }

  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(builder: (context, setState) {
  //         return AlertDialog(
  //             shape: const RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //             title: const Text(
  //               "Defina em que região será feita sua busca",
  //               style: TextStyle(color: Colors.black),
  //             ),
  //             content: SizedBox(
  //                 height: 200,
  //                 child: Form(
  //                     child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [],
  //                 ))));
  //       });
  //     },
  //   );
  // }
}
