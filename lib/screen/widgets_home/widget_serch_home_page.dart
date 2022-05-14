import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SearchHome extends StatefulWidget {
  SearchHome({Key? key}) : super(key: key);

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  String? estadoInicial;

  final listaStringEstado = [
    "RS",
    "MS",
    "MT",
    "GO",
    'DF',
    'ES',
    'RJ',
    'SP',
    'PR',
    'SC',
    'MG',
    'BA',
    'SE',
    'AL',
    'PE',
    'PB',
    'RN',
    'CE',
    'PI',
    'MA',
    'TO'
  ];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Escolha seu Estado, município e bairro",
          style: TextStyle(fontSize: 20),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: DropdownButton<String>(
              value: estadoInicial,
              items: listaStringEstado.map(buildMenuItem).toList(),
              onChanged: (novoValor) {
                setState(() {
                  estadoInicial = novoValor;
                });

                //  https://servicodados.ibge.gov.br/api/v1/localidades/estados/$novoValor/municipios;
              },
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: Colors.black, fontSize: 15.sp),
      ));
}
