// ignore_for_file: file_names

import 'package:ache_facil/data/repositorio.dart';
import 'package:ache_facil/models/item_model.dart';
import 'package:ache_facil/screen/widget_search/itens.dart';
import 'package:ache_facil/screen/widget_search/search_bairro.dart';
import 'package:ache_facil/screen/widget_search/worker_.textField.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late List<ItemModel> itens;
  String query = '';

  @override
  void initState() {
    super.initState();

    itens = allItens;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: [buildSearchPrincipal(), buildSearchBairro()]),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 10),
                    child: Text(
                      " ${itens.length} Resultados ",
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      final item = itens[index];

                      return Itens(itemModel: item);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildSearchPrincipal() => SearchTextField(
        text: query,
        hintText: '', //TODO: Fazer o controller da outra page vir para aqui
        onChanged: searchItem,
      );

  Widget buildSearchBairro() => SearchBairro(
        text: query,
        hintText: 'bairro',
        onChanged: searchItem,
      );

  void searchItem(String query) {
    final itens = allItens.where((itemModel) {
      final professionLower = itemModel.profession.toLowerCase();
      final nameLower = itemModel.name.toLowerCase();
      final bairroLower = itemModel.bairro.toLowerCase();
      final searchLower = query.toLowerCase();

      return professionLower.contains(searchLower) ||
          nameLower.contains(searchLower) ||
          bairroLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.itens = itens;
    });
  }
}
