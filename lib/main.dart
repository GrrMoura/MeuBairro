import 'dart:io';

import 'package:ache_facil/android/android_app.dart';
import 'package:ache_facil/data/sflite.dart';
import 'package:ache_facil/ios/ios_app.dart';
import 'package:ache_facil/models/historico_model.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  await db.insertTermo(Historico(id: 2, name: "sda21312"));
  print(await db.getHistorico());
  debugPrint("olaaaa");
  if (Platform.isIOS) {
    runApp(const IosAPP());
  } else {
    runApp(const AndroidApp());
    debugPrint("é android ? ${Platform.isAndroid.toString()}");
  }
}
