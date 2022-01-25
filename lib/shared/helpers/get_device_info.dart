import 'dart:io';
import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';

class DeviceInfo {
  static deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
  }

  static info() async {
    String? board;
    String? brand;
    String? device;
    String? hardware;
    String? host;
    String? id;
    String? manufacturer;
    String? model;
    String? deviceId;
    String? osVer;
    String? os;
    String? appVer;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      board = androidInfo.board;
      brand = androidInfo.brand;
      device = androidInfo.device;
      hardware = androidInfo.hardware;
      host = androidInfo.host;
      id = androidInfo.id;
      manufacturer = androidInfo.manufacturer;
      model = androidInfo.model;
      deviceId = androidInfo.androidId;
      osVer = androidInfo.version.release;
      os = androidInfo.version.baseOS;
      appVer = packageInfo.version;

      var dataInfo = {
        'board': board,
        'brand': brand,
        'device': device,
        'hardware': hardware,
        'host': host,
        'id': id,
        'manufacturer': manufacturer,
        'model': model,
        'deviceId': deviceId,
        'os_ver': osVer == '' ? 'Andorid' : osVer,
        'os': os,
        'app_ver': appVer
      };

      return dataInfo;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo;
    }
  }
}

// class DeviceInfoModel {
// String? board;
// String? brand;
// String? device;
// String? hardware;
// String? host;
// String? id;
// String? manufacturer;
// String? model;
// String? deviceId;

//   DeviceInfoModel({
//     this.board,
//     this.brand,
//     this.device,
//     this.hardware,
//     this.host,
//     this.id,
//     this.manufacturer,
//     this.model,
//     this.deviceId,
//   });
// }
