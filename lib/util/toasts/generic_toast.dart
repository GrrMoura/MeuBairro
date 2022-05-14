import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GenericToast {
  static void show(String? descricao,
      {ToastGravity? gravity,
      int? duracao,
      Color? backgraoundColor,
      Color? textColor,
      double? fontSize}) {
    Fluttertoast.showToast(
        msg: descricao!,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity ?? ToastGravity.SNACKBAR,
        timeInSecForIosWeb: duracao ?? 1,
        backgroundColor: backgraoundColor ?? Colors.red,
        textColor: textColor ?? Colors.white,
        fontSize: fontSize ?? 16);
  }
}
