// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchBairro extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBairro({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchBairroState createState() => _SearchBairroState();
}

class _SearchBairroState extends State<SearchBairro> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: a pesquisa principal trás do banco de dados e a de bairro filtra na tela
      height: 55,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),

      child: TextField(
        style: Theme.of(context).textTheme.headline4,
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 26,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.headline5,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
