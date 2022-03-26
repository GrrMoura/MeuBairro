import 'package:ache_facil/data/repositorio.dart';
import 'package:ache_facil/model/item_model.dart';
import 'package:ache_facil/screen/widgets/itens.dart';
import 'package:ache_facil/screen/widgets/search_box_bairro.dart';
import 'package:ache_facil/screen/widgets/search_box_principal.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  SearchBoxState createState() => SearchBoxState();
}

class SearchBoxState extends State<SearchBox> {
  late List<ItemModel> itens;
  String query = '';

  @override
  void initState() {
    super.initState();

    itens = allItens;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [buildSearchPrincipal(), buildSearchBairro()],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(" Profissões & Serviços ",
                style: Theme.of(context).textTheme.subtitle2),
          ),
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
      );

  Widget buildSearchPrincipal() => SearchBoxPrincipal(
        text: query,
        hintText: 'nome,profissão ou serviço',
        onChanged: searchItem,
      );

  Widget buildSearchBairro() => SearchBoxBairro(
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
