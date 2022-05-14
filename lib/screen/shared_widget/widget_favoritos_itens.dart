// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ache_facil/android/android_style.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/util/widget_contact_btn.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class FavoritoItens extends StatelessWidget {
  final db = DatabaseConnect();
  final data;

  FavoritoItens(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            onPressed: (va) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Deletar',
          ),
          SlidableAction(
            autoClose: true,
            onPressed: (va) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Compartilhar',
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5.h),
            color: background,
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 0.5.h, top: 0.5.h, bottom: 0.5.h),
                child: Container(
                  height: 8.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5.h),
                      image: DecorationImage(
                          image: NetworkImage(
                            data.photo,
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  top: 1.h,
                  right: 10.h,
                  left: 14.h,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          data.name, //TODO: NOME MÁXIMO 19 LETRAS
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: black, fontSize: 11.sp),
                        ),
                        Text(data.profession,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: black, fontSize: 10.sp)),
                      ],
                    ),
                  )),
              Positioned(
                  top: 2.h,
                  right: 1.h,
                  child: IconButton(
                      onPressed: () {
                        final slidable = Slidable.of(context);
                        slidable?.openEndActionPane(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ))),
              Positioned(
                left: 10.h,
                top: 4.5.h,
                child: Row(
                  //TODO: fazer esses botoes em uma classe unica
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ContactBotton(
                        icon: FontAwesomeIcons.instagram,
                        itemModel: data.instagram,
                        color: Colors.red,
                        opcao: "link"),
                    ContactBotton(
                        icon: FontAwesomeIcons.phone,
                        itemModel: "tel:${data.phone}",
                        color: Colors.black,
                        opcao: "link"),
                    ContactBotton(
                        icon: FontAwesomeIcons.facebookF,
                        itemModel: data.facebook,
                        color: Colors.blue,
                        opcao: "link"),
                    ContactBotton(
                        icon: FontAwesomeIcons.envelope,
                        itemModel: data.email,
                        color: Colors.red,
                        opcao: "email"),
                    ContactBotton(
                        icon: FontAwesomeIcons.whatsapp,
                        itemModel: data.whatsapp,
                        color: Colors.black,
                        opcao: "whats"),
                    Container(width: 18.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
