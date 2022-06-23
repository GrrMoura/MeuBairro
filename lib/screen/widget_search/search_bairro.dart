// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
  // ignore: library_private_types_in_public_api
  _SearchBairroState createState() => _SearchBairroState();
}

class _SearchBairroState extends State<SearchBairro> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: a pesquisa principal trás do banco de dados e a de bairro filtra na tela
      height: 7.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        color: Colors.white,
      ),

      child: TextField(
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black),
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 26,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.headline5,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
