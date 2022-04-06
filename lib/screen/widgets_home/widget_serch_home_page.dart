import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchHome extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
            tileMode: TileMode.clamp,
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.1),
            stops: [0.0, 1.0],
            colors: [Color(0xfff5deb3), Color(0xfff08080)]),
      ),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: TextFormField(
        style: Theme.of(context).textTheme.headline4,
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 26,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.mic,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              fontSize: 18),
          prefixIcon: Icon(Icons.search,
              size: 25,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          hintText: 'Ache agora',
          labelStyle: Theme.of(context).textTheme.headline5,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
