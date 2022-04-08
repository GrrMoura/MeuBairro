import 'package:flutter/material.dart';

class CompetenciaBox extends StatelessWidget {
  const CompetenciaBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Wrap(
        spacing: 10,
        children: const [
          OutlinedButton(
            onPressed: null,
            child: Text("Ferro"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Ferro"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Calças"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Arma "),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("sanduiche"),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text("Ladrão Fino"),
          ),
        ],
      ),
    );
  }
}
