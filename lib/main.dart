import 'dart:io';

import 'package:ache_facil/android/android_app.dart';
import 'package:ache_facil/ios/ios_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Firebase.initializeApp().then((_) async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    await FirebaseCrashlytics.instance.setUserIdentifier(
        "user123456789"); //identificar o usuário no crashlytcs
    FlutterError.onError = FirebaseCrashlytics.instance
        .recordFlutterError; //recordFlutterError; // pegar os erros do flutter e colocar no crashlytichs
  });

  if (Platform.isIOS) {
    runApp(const IosAPP());
  } else {
    runApp(const AndroidApp());
    debugPrint("é android ? ${Platform.isAndroid.toString()}");
  }
}
