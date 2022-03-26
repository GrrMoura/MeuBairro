// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchBoxPrincipal extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBoxPrincipal({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchBoxPrincipalState createState() => _SearchBoxPrincipalState();
}

class _SearchBoxPrincipalState extends State<SearchBoxPrincipal> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 250,
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
