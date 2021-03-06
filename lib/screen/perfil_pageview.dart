// ignore_for_file: avoid_print

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/view_models/user_model.dart';
import 'package:ache_facil/util/marks.dart';
import 'package:ache_facil/util/validators.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final UserViewModel model = UserViewModel();

  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _oldPassCtrl = TextEditingController();
  final TextEditingController _newPassCtrl = TextEditingController();
  final TextEditingController _confirmPassCtrl = TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();
  //final TextEditingController _gender = TextEditingController();
  final TextEditingController _birthDateCtrl = TextEditingController();
  final _formKeyDates = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  final db = DatabaseConnect();

  bool changePerfil = false;
  bool changePass = false;
  bool preferences = false;
  bool showPass = true;

  bool saude = false;

  bool educao = false;

  bool lazer = false;

  bool todas = false;

  bool gastronomia = false;
  bool eventos = false;

  // @override
  // void initState() {
  //   super.initState();
  //   futureFill();
  // }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        genericTitle(style.headline3!, title: "Dados Pessoais"),
        changePerfil == true
            ? Form(
                key: _formKeyDates,
                child: Column(
                  children: [
                    emailForm(style.headline4!),
                    phoneForm(style.headline4!),
                    nameForm(style.headline4!),
                    birthDateForm(style.headline4!),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: background),
                        onPressed: () {
                          personalDataValidate();
                        },
                        child: const Text("Salvar Dados",
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              )
            : const SizedBox(),
        genericTitle(style.headline3!, title: "Alterar Senha"),
        changePass
            ? Form(
                key: _formKeyPass,
                child: Column(
                  children: [
                    oldPass(style.headline4!),
                    newPass(style.headline4!),
                    confirmPass(style.headline4!),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: background),
                        onPressed: () {
                          passValidate();
                        },
                        child: const Text("Trocar Senha",
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              )
            : const SizedBox(),
        genericTitle(style.headline3!, title: "Prefer??ncias"),
        preferences == true
            ? Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.5.h),
                      child: Text("Quero receber notifica????es de :",
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 21.w,
                            child: Text("Sa??de", style: style.headline6!)),
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
                            width: 21.w,
                            child: Text("Educa????o", style: style.headline6!)),
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
                            width: 21.w,
                            child: Text("Lazer", style: style.headline6!)),
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
                            width: 21.w,
                            child:
                                Text("Gastronomia", style: style.headline6!)),
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
                            width: 21.w,
                            child: Text("Eventos", style: style.headline6!)),
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
            : Container()
      ])),
    );
  }

  Padding emailForm(TextStyle theme4) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          readOnly: true,
          initialValue: "geibison@hotmail.com",
          cursorColor: black,
          keyboardType: TextInputType.text,
          style: theme4,
          decoration: InputDecoration(
            labelStyle: theme4,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "E-mail:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
        ));
  }

  Padding phoneForm(TextStyle theme) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          controller: _phoneCtrl,
          cursorColor: black,
          keyboardType: TextInputType.number,
          inputFormatters: [MaskUtils.maskFormatterPhone()],
          style: theme,
          decoration: InputDecoration(
            errorStyle: theme.copyWith(fontSize: 12, color: Colors.white),
            labelStyle: theme,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "*Telefone:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "* O Campo telefone ?? obrigat??rio.";
            }
            if (value.length <= 15) {
              return "* N??mero inv??lido.";
            }
            return null;
          },
          onSaved: (value) {
            _phoneCtrl.text = value!;
          },
        ));
  }

  Padding nameForm(TextStyle theme) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          controller: _nameCtrl,
          cursorColor: black,
          keyboardType: TextInputType.text,
          style: theme,
          decoration: InputDecoration(
            errorStyle: theme.copyWith(fontSize: 12, color: Colors.white),
            labelStyle: theme,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "*Nome:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "* O Campo nome ?? obrigat??rio.";
            }
            if (value.length <= 2) {
              return "* Nome muito curto.";
            }
            return null;
          },
          onSaved: (value) {
            _nameCtrl.text = value!;
          },
        ));
  }

  Padding birthDateForm(TextStyle theme) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          controller: _birthDateCtrl,
          cursorColor: black,
          inputFormatters: [MaskUtils.maskFormatterData()],
          keyboardType: TextInputType.datetime,
          style: theme,
          decoration: InputDecoration(
            errorStyle: theme.copyWith(fontSize: 12, color: Colors.white),
            labelStyle: theme,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "*Data de Nascimento:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "* O campo data de nascimento ?? obrigat??rio.";
            }
            if (!ValidatorsUtils.validateDate(value)) {
              return "* Data inv??lida.";
            }

            return null;
          },
          onSaved: (value) {
            _birthDateCtrl.text = value!;
          },
        ));
  }

  Padding oldPass(TextStyle theme) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          obscureText: showPass,
          controller: _oldPassCtrl,
          cursorColor: black,
          keyboardType: TextInputType.text,
          style: theme,
          decoration: InputDecoration(
            errorStyle: theme.copyWith(fontSize: 12, color: Colors.white),
            labelStyle: theme,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "*Senha Antiga:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "* O campo senha antiga ?? obrigat??rio.";
            }
            if (value.length <= 7) {
              return "* Senha muito curta.";
            }
            return null;
          },
          onSaved: (value) {
            _oldPassCtrl.text = value!;
          },
        ));
  }

  Padding newPass(TextStyle theme) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          obscureText: showPass,
          controller: _newPassCtrl,
          cursorColor: black,
          keyboardType: TextInputType.text,
          style: theme,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              color: Colors.black,
              onPressed: () {
                showPass = !showPass;
                setState(() {});
              },
              icon: Icon(
                  showPass == true ? Icons.visibility_off : Icons.visibility),
            ),
            errorStyle: theme.copyWith(fontSize: 12, color: Colors.white),
            labelStyle: theme,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "*Nova Senha:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "* O campo nova senha ?? obrigat??rio.";
            }
            if (value.length <= 7) {
              return "* Senha muito curta.";
            }
            return null;
          },
          onSaved: (value) {
            _newPassCtrl.text = value!;
          },
        ));
  }

  Padding confirmPass(TextStyle theme) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          obscureText: showPass,
          controller: _confirmPassCtrl,
          cursorColor: black,
          keyboardType: TextInputType.text,
          style: theme,
          decoration: InputDecoration(
            errorStyle: theme.copyWith(fontSize: 12, color: Colors.white),
            labelStyle: theme,
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            labelText: "*Nova Senha:",
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: black),
                borderRadius: BorderRadius.circular(1.5.h)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "* O campo nova senha ?? obrigat??rio.";
            }
            if (value.length <= 7) {
              return "* Senha muito curta.";
            }
            if (value != _newPassCtrl.text) {
              return "* As senhas n??o conferem.";
            }
            return null;
          },
          onSaved: (value) {
            _confirmPassCtrl.text = value!;
          },
        ));
  }

  Padding genericTitle(TextStyle theme3,
      {String? title, VoidCallback? method}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
      child: InkWell(
        onTap: () {
          if (title == "Alterar Senha") {
            changePass = !changePass;

            if (changePerfil || preferences) {
              changePerfil = false;
              preferences = false;
            }

            setState(() {});
          } else if (title == "Dados Pessoais") {
            changePerfil = !changePerfil;
            if (changePass || preferences) {
              changePass = false;
              preferences = false;
            }

            setState(() {});
          } else {
            preferences = !preferences;
            if (changePerfil || changePass) {
              changePerfil = false;
              changePass = false;
            }

            setState(() {});
          }
        },
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
            style: theme3.copyWith(color: Colors.black),
          )),
        ),
      ),
    );
  }

  Future<void> futureFill() async {
    // final prefs = await SharedPreferences.getInstance();

    // _email?.text = prefs.getString("email")!;
    // _phoneCtrl?.text = prefs.getString("phone")!;
    // _nameCtrl?.text = prefs.getString("name")!;
    // _gender?.text = prefs.getString("gender")!;
    // _birthDateCtrl?.text = prefs.getString("birthDate")!;
  }

  void personalDataValidate() {
    if (_formKeyDates.currentState!.validate()) {
      print("ol?? eu sou ${_nameCtrl.text} e meu telefone ?? ${_phoneCtrl.text}");

      //  UserController.updatePersonalData();
      print("tudo certo");
    } else {
      print("algo est?? errado");
    }
  }

  void passValidate() {
    if (_formKeyPass.currentState!.validate()) {
      print("tudo certo");
    } else {
      print("algo est?? errado");
    }
  }
}
