import 'dart:io';

import 'package:ache_facil/models/dispositivo_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceServices {
  static Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print("connectivityResult $connectivityResult");
      return true;
      // I am connected to a mobile network.
    }
    return false;
  }

  static Future<DeviceModel?> carregarInformacoesDispositivo() async {
    final DeviceInfoPlugin dispositivoInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        return _readAndroidBuildData(await dispositivoInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        return _readIosDeviceInfo(await dispositivoInfoPlugin.iosInfo);
      }
    } catch (exc) {
      print(exc);
    }
  }

  static Future<DeviceModel> _readAndroidBuildData(
      AndroidDeviceInfo build) async {
    var device = DeviceModel(
        idDispositivo: build.androidId,
        fabricante: build.manufacturer,
        modelo: build.model,
        so: "Android",
        versaoSo: build.version.release);

    return device;
  }

  static Future<DeviceModel> _readIosDeviceInfo(IosDeviceInfo data) async {
    var device = DeviceModel(
        idDispositivo: data.identifierForVendor,
        fabricante: "Apple",
        modelo: data.model,
        so: data.systemName,
        versaoSo: data.systemVersion);
    return device;
  }
}
