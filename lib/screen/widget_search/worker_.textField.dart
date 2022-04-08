// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchTextField(
      {Key? key,
      required this.text,
      required this.onChanged,
      required this.hintText})
      : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 250,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
            tileMode: TileMode.clamp,
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.1),
            stops: [0.0, 1.0],
            colors: [Color(0xfff5deb3), Color(0xfff08080)]),
      ),
      //padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: TextField(
        style: Theme.of(context).textTheme.headline4,
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 26,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search,
              size: 25,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4)),
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
