import 'dart:developer';
import 'dart:io';

import 'package:antaranter_driverapp/features/splash/api_splash.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/app_version.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';

import 'package:antaranter_driverapp/shared/helpers/device_info.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerSplash extends GetxController {
  final ApiSplash api;

  ControllerSplash({required this.api});

  @override
  void onInit() async {

    splashAnimation();
    super.onInit();
  }

  splashAnimation() async {
    try {
      var deviceInfo = await DeviceInfo.appInfo();
      String type = '';
      if (Platform.isAndroid) {
        type = 'Android';
      } else {
        type = 'IOS';
      }
      var res = await api.latestVersion(type: type);
      AppVersion appVersion = AppVersion.fromJson(res['data']);

      bool checkVersion = deviceInfo['app_ver'] != appVersion.version;

      if (checkVersion) {
        dialogUpdateApp(
            title: "Update Baru AntarAnter Driver",
            desc:
                "silahkan update aplikasi AntarAnter Driver anda untuk menikmati peforma yang lebih baik dengan beragam fitur.",
            onConfirm: () async {
              String url = appVersion.url ?? '';
              log("can launch : " + canLaunch(url).toString());
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            onCancel: () {
              exit(0);
            });
      }else {
        await Future.delayed(const Duration(seconds: 1));
        var statusLogin = await Api2().getLoginStatus();
        if (statusLogin == true) {
          Get.offNamed(Routes.main);
        } else {
          Get.offNamed(Routes.login);
        }
      }
    } catch (e) {
       log(e.toString());
      var message = errorMessage(e.toString());
      dialogError(message: message.toString());
    }
  }
}
