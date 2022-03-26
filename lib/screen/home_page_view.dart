import 'package:ache_facil/screen/widgets/SearchBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bairros = ["", "Centro", "Atalaia Nova", "Prisco Viana", "Jatobá"];
  String? value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
                child:
                    Text("Ache", style: Theme.of(context).textTheme.subtitle1),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  "tudo no seu bairro",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Expanded(child: SearchBox()),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.amber,
                height: 50,
                width: 390,
                child: const Text("ANUNCIOS"),
              )
            ],
          )),
    );
  }
}
