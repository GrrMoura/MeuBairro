import 'package:ache_facil/data/historico_dao.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/historico_model.dart';
import 'package:ache_facil/screen/perfil_pageview.dart';
import 'package:ache_facil/screen/widgets_home/widget_serch_home_page.dart';
import 'package:ache_facil/screen/widgets_home/widget_category_list.dart';
import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:ache_facil/screen/widgets_home/widget_box_carousel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // HistoricoDao _historicoDao = HistoricoDao();
  TextEditingController controller = TextEditingController();
  List<String> bairros = [];
  String? value;
  bool onChanged = false;
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: ListView(
            children: [
              const HeaderHome(),
              onChanged == true ? historico() : Container(),
              searchTextField(context),
              const CategoryList(),
              BoxCarousel(),
              const Expanded(child: Padding(padding: EdgeInsets.only(top: 30))),
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.amber,
                height: 40,
                width: 390,
                child: const Text("ANÚNCIOS"),
              )
            ],
          )),
    );
  }

  Container historico() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.green,
      width: 200,
      height: 100,
      child: FutureBuilder(
          initialData: const [],
          future: db.getHistorico(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data;
            var datalength = data!.length;
            return datalength == 0
                ? const Text("sem historico")
                : ListView.builder(
                    itemCount: datalength,
                    itemBuilder: (context, index) =>
                        termos(data[index].toString()));
          }),
    );
  }

  Row termos(String name) {
    return Row(
      children: [
        Icon(
          Icons.replay,
          size: 20,
        ),
        Text(name),
        IconButton(
            onPressed: () {
              // db.deletarTermo(id);
            },
            icon: Icon(
              Icons.remove,
              size: 20,
            )),
      ],
    );
  }

  Container searchTextField(BuildContext context) {
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
      margin: const EdgeInsets.fromLTRB(16, 1, 16, 16),
      child: TextFormField(
        onChanged: ((value) {}),
        onTap: () {},
        style: Theme.of(context).textTheme.headline4,
        cursorColor: Theme.of(context).colorScheme.secondary,
        cursorHeight: 26,
        textAlign: TextAlign.start,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                onChanged = !onChanged;
              });
            },
            child: Icon(Icons.mic,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
          ),
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              fontSize: 18),
          prefixIcon: IconButton(
              onPressed: () async {
                setState(() {
                  db.insertTermo(Historico(name: controller.text));
                });
              },
              icon: Icon(Icons.search,
                  size: 25,
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.6))),
          hintText: 'Ache agora',
          labelStyle: Theme.of(context).textTheme.headline5,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
