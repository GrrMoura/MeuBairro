import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  IconData icon;
  String label;
  CategoryItem(this.icon, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            elevation: 5,
            splashFactory: InkRipple.splashFactory,
            primary: Colors.redAccent,
            backgroundColor:
                Theme.of(context).backgroundColor), // const Color(0xfffffafa)),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, size: 25),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
