import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final UserModel model = UserModel();
  TextEditingController? _email;
  TextEditingController? _phone;
  TextEditingController? _name;
  TextEditingController? _gender;
  TextEditingController? _birthDate;
  final db = DatabaseConnect();

  bool saude = false;

  bool educao = false;

  bool lazer = false;

  bool todas = false;

  bool gastronomia = false;
  bool eventos = false;

  @override
  void initState() {
    super.initState();
    futureFill();
  }

  @override
  Widget build(BuildContext context) {
    var style =
        Theme.of(context).textTheme.headline5!.copyWith(fontSize: 10.sp);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              genericTitle(context, title: "Atualizar dados pessoais"),
              genericInfomation(title: "E-mail: ", data: "rocha@gmail.com"),
              genericInfomation(title: "Telefone: ", data: "(79) 9 91140490"),
              genericInfomation(title: "Nome: ", data: "Roberto Rocha"),
              genericInfomation(title: "Sexo: ", data: "Masculino"),
              genericInfomation(
                  title: "Data de Nascimento", data: "16/10/1990"),
              genericTitle(context, title: "Preferências"),
              Padding(
                padding: EdgeInsets.only(left: 1.5.h, right: 1.5, top: 1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.5.h),
                      child: Text("Quero receber notificações de :",
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20.w, child: const Text("Saúde")),
                        Switch(
                            value: saude,
                            onChanged: (value) {
                              setState(() {
                                saude = value;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 20.w, child: Text("Educação", style: style)),
                        Switch(
                            value: educao,
                            onChanged: (value) {
                              setState(() {
                                educao = value;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 20.w, child: Text("Lazer", style: style)),
                        Switch(
                            value: lazer,
                            onChanged: (value) {
                              setState(() {
                                lazer = value;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 20.w,
                            child: Text("Gastronomia", style: style)),
                        Switch(
                            value: gastronomia,
                            onChanged: (value) {
                              setState(() {
                                gastronomia = value;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 20.w, child: Text("Eventos", style: style)),
                        Switch(
                            value: eventos,
                            onChanged: (value) {
                              setState(() {
                                eventos = value;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }

  Padding genericInfomation(
      {String? title, String? data, TextEditingController? ctrl}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          controller: ctrl,
          cursorColor: black,
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.headline4,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: title,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            return null;
          },
          onSaved: (val) {},
        ));
  }

  Padding genericTitle(BuildContext context, {String? title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(1.5.h),
            border: Border.all(width: 0.5.h, color: background)),
        height: 5.h,
        width: double.infinity,
        child: Center(
            child: Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.black),
        )),
      ),
    );
  }

  Future<void> futureFill() async {
    final prefs = await SharedPreferences.getInstance();

    _email?.text = prefs.getString("email")!;
    _phone?.text = prefs.getString("phone")!;
    _name?.text = prefs.getString("name")!;
    _gender?.text = prefs.getString("gender")!;
    _birthDate?.text = prefs.getString("birthDate")!;
  }
}
