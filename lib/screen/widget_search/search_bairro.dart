// ignore_for_file: prefer_const_constructors

import 'package:ache_facil/android/android_style.dart';
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

      width: 50.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          color: Colors.white,
          border: Border.all(color: background, width: 0.5.h)),

      child: TextField(
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black),
        cursorColor: Theme.of(context).colorScheme.secondary,
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.headline5,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
