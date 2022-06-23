// ignore_for_file: must_be_immutable

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/controllers/home_controller.dart';
import 'package:ache_facil/screen/login_page_view.dart';
import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:ache_facil/screen/widgets_home/widget_box_carousel.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final _homeController = Get.put(GetxHomeController());
  List<String>? city = [
    'Aracaju',
    'Barra',
    'Cariri',
    'Estância' "                                 ",
  ]; // Option 2
  List<String>? state = [
    'Alagoas',
    'Sergipe',
    'Pernambuco',
    'Paraiba'
        "                                 "
  ]; //
  String? selectedCity;
  String? selectedState; // Option 2

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderHome(),
        GetBuilder<GetxHomeController>(
          builder: (c) => Container(
            child: _homeController.city.toString() == ""
                ? Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 3.h),
                    child: InkWell(
                        onTap: () => _showDialog(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(1.5.h),
                            border: Border.all(width: 0.5.h, color: background),
                          ),
                          child: Center(
                            child: Text(
                              "Onde você está?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        )),
                  )
                : Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Container(
                            width: 320,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5.h),
                                color: Colors.transparent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Você está em:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 20.sp)
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  " ${_homeController.city.obs}, ${_homeController.state.obs}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 15.sp)
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                          onPressed: () {
                            _showDialog(context);
                          },
                          label: Text("Atualizar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 10.sp, color: Colors.black)),
                          icon: const Icon(FontAwesomeIcons.penToSquare,
                              color: Colors.black, size: 20),
                        ),
                      )
                    ],
                  ),
          ),
        ),

        // SearchHome(),
        BoxCarousel(),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text(
              "Defina em que região serão feitas suas buscas",
              style: Theme.of(context).textTheme.headline3!,
            ),
            content: SizedBox(
              height: 200,
              child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButtonFormField<String>(
                        hint: Text(
                          'Estado *',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.black),
                        ), // Not necessary for Option 1
                        value: selectedState,
                        validator: (value) {
                          if (value == null) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                        onChanged: (novoValor) {
                          setState(() {
                            selectedState = novoValor.toString();
                          });
                        },
                        items: state!.map((location) {
                          return DropdownMenuItem(
                            value: location,
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                location,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Colors.black, fontSize: 11.sp),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField(
                        hint: Text(
                          'Cidade *',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ), // Not necessary for Option 1
                        value: selectedCity,
                        validator: (value) {
                          if (value == null) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                        onChanged: (novoValor) {
                          setState(() {
                            selectedCity = novoValor.toString();
                          });
                        },
                        items: city!.map((location) {
                          return DropdownMenuItem(
                            value: location,
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                location,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Colors.black, fontSize: 11.sp),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
            ),
            actions: <Widget>[
              // define os botões na base do dialogo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: background),
                      child: Text("Salvar",
                          style: Theme.of(context).textTheme.headline5!),
                      onPressed: () {
                        if (!_key.currentState!.validate()) {
                          GenericToast.show(
                              "Os campos ( Estado e Cidade) são obrigatórios ",
                              gravity: ToastGravity.SNACKBAR);
                        } else {
                          _homeController.changeName(
                              selectedCity!, selectedState!);

                          Get.to(() => LoginPage());
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 80.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                      child: Text("Cancelar",
                          style: Theme.of(context).textTheme.headline5!),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
        // retorna um objeto do tipo Dialog
      },
    );
  }
}
