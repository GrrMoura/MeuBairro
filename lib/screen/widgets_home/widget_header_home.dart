import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá, Zé Ramalho",
                  style: Theme.of(context).textTheme.subtitle2),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/ze.jpg"),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
          child: Text(
            "Precisa de profissional ou comércio?",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
