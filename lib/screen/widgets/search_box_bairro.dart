// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchBoxBairro extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBoxBairro({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchBoxBairroState createState() => _SearchBoxBairroState();
}

class _SearchBoxBairroState extends State<SearchBoxBairro> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: a pesquisa principal trás do banco de dados e a de bairro filtra na tela
      height: 70,
      width: 100,
      //padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
      // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: TextField(
        style: Theme.of(context).textTheme.headline4,
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 26,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          labelStyle: Theme.of(context).textTheme.headline5,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
