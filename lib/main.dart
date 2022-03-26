import 'dart:io';

import 'package:ache_facil/android/android_app.dart';
import 'package:ache_facil/ios/ios_app.dart';
import 'package:flutter/material.dart';

void main() {
  if (Platform.isIOS) {
    runApp(const IosAPP());
  } else {
    runApp(const AndroidApp());
    debugPrint("é android ? ${Platform.isAndroid.toString()}");
  }
}
