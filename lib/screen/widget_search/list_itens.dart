// import 'package:ache_facil/model/item_model.dart';
// import 'package:ache_facil/screen/widget_search/itens.dart';
// import 'package:flutter/material.dart';

// class ListItens extends StatelessWidget {
//   const ListItens({Key? key, required this.itens}) : super(key: key);

//   final List<ItemModel> itens;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Text(" Profissões e Serviços ",
//               style: Theme.of(context).textTheme.subtitle2),
//         ),
//         ListView.builder(
//           itemCount: itens.length,
//           itemBuilder: (context, index) {
//             final item = itens[index];

//             return Itens(itemModel: item);
//           },
//         ),
//       ],
//     );
//   }
// }
