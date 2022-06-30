// ignore_for_file: must_be_immutable

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/controllers/home_controller.dart';
import 'package:ache_facil/screen/widgets_home/widget_header_home.dart';
import 'package:ache_facil/screen/widgets_home/widget_box_carousel.dart';
import 'package:ache_facil/util/toasts/generic_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/instance_manager.dart';
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
    'Estância',
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
    return Column(
      children: [
        Expanded(flex: 4, child: Container()),
        Expanded(flex: 6, child: HeaderHome()),
        Expanded(
          flex: 2,
          child: GetBuilder<GetxHomeController>(
            builder: (c) => Container(
              child: _homeController.city.toString() == ""
                  ? InkWell(
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
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _showDialog(context),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Você está em: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 17.sp)
                                  .copyWith(color: Colors.black),
                            ),
                            TextSpan(
                              text:
                                  "${_homeController.city.obs} -${_homeController.state.obs} ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 14.sp)
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ])),
                        ),
                      ],
                    ),
            ),
          ),
        ),

        // SearchHome(),
        Expanded(flex: 20, child: BoxCarousel()),
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
              height: 150,
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
                              width: 100,
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
                              width: 100,
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

                          Navigator.pop(context);
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
