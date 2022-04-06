// // ignore_for_file: file_names

// import 'package:ache_facil/data/repositorio.dart';
// import 'package:ache_facil/model/item_model.dart';
// import 'package:ache_facil/screen/widget_search/itens.dart';
// import 'package:ache_facil/screen/widget_search/search_bairro.dart';
// import 'package:ache_facil/screen/widget_search/worker_.textField.dart';
// import 'package:flutter/material.dart';

// class BoxSearch extends StatefulWidget {
//   const BoxSearch({Key? key}) : super(key: key);

//   @override
//   BoxSearchState createState() => BoxSearchState();
// }

// class BoxSearchState extends State<BoxSearch> {
//   late List<ItemModel> itens;
//   String query = '';

//   @override
//   void initState() {
//     super.initState();

//     itens = allItens;
//   }

//   @override
//   Widget build(BuildContext context) =>   Scaffold(appBar: AppBar(), body:Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             children: [buildSearchPrincipal(), buildSearchBairro()],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Text(" Profissões e Serviços ",
//                 style: Theme.of(context).textTheme.subtitle2),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: itens.length,
//               itemBuilder: (context, index) {
//                 final item = itens[index];

//                 return Itens(itemModel: item);
//               },
//             ),
//           ),
//         ],
//       ));

//   Widget buildSearchPrincipal() => WorkTextField(
//         text: query,
//         hintText: 'Ache agora',
//         onChanged: searchItem,
//       );

//   Widget buildSearchBairro() => SearchBairro(
//         text: query,
//         hintText: 'bairro',
//         onChanged: searchItem,
//       );

//   void searchItem(String query) {
//     final itens = allItens.where((itemModel) {
//       final professionLower = itemModel.profession.toLowerCase();
//       final nameLower = itemModel.name.toLowerCase();
//       final bairroLower = itemModel.bairro.toLowerCase();
//       final searchLower = query.toLowerCase();

//       return professionLower.contains(searchLower) ||
//           nameLower.contains(searchLower) ||
//           bairroLower.contains(searchLower);
//     }).toList();

//     setState(() {
//       this.query = query;
//       this.itens = itens;
//     });
//   }
// }
